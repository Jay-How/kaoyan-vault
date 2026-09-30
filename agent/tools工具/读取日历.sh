#!/usr/bin/env bash
#
# 读取 macOS 日历（含已同步的 Google 账户），展开重复日程，输出课程表与空闲时段。
#
# 用法：
#   ./读取日历.sh                 # 默认：未来 14 天日程明细
#   ./读取日历.sh upcoming 21     # 未来 21 天明细
#   ./读取日历.sh timetable       # 本学期固定课表（按星期几汇总）
#   ./读取日历.sh free            # 每周空闲时段
#   ./读取日历.sh raw             # 原始导出，不展开、不加工
#
# 依赖：macOS + osascript + python3
#
# 重要：DSH 的文件沙箱策略必须是 danger-full-access。
#       workspace-write 会拦截 Apple Events，报 "权限违例 (-10004)"。
#
# 关于重复日程：AppleScript 直接查询只会返回重复系列的主条目，
# 不展开各次发生。本脚本自行展开 FREQ=WEEKLY;INTERVAL=n;COUNT=m。
#

set -euo pipefail

MODE="${1:-upcoming}"
ARG="${2:-14}"

# 需要忽略的日历名（订阅的节气/节假日表、系统日历、提醒事项等）
# 注意：真实的"XX假期"事件在 Google 日历里，必须保留，脚本靠它识别假期区间。
SKIP_LIST='{"中国 节假日", "中国节假日", "中国大陆节假日", "生日", "Siri建议", "计划的提醒事项", "Calendar", "日历"}'

TMPAS="$(mktemp -t caldump).applescript"
TMPTSV="$(mktemp -t caldump).tsv"
trap 'rm -f "$TMPAS" "$TMPTSV"' EXIT

cat > "$TMPAS" <<APPLESCRIPT
on pad(n)
	if n < 10 then return "0" & (n as string)
	return n as string
end pad

on isoDate(d)
	set y to (year of d) as integer
	set mo to (month of d) as integer
	set dy to day of d
	set hh to hours of d
	set mi to minutes of d
	return (y as string) & "-" & pad(mo) & "-" & pad(dy) & "T" & pad(hh) & ":" & pad(mi)
end isoDate

on run
	set skipNames to $SKIP_LIST
	set out to ""
	tell application "Calendar"
		repeat with c in calendars
			set cname to name of c
			if skipNames does not contain cname then
				try
					repeat with e in (every event of c)
						try
							set r to recurrence of e
						on error
							set r to ""
						end try
						if r is missing value then set r to ""
						set ad to "0"
						try
							if allday event of e then set ad to "1"
						end try
						set out to out & cname & tab & (summary of e) & tab & (my isoDate(start date of e)) & tab & (my isoDate(end date of e)) & tab & ad & tab & r & linefeed
					end repeat
				end try
			end if
		end repeat
	end tell
	return out
end run
APPLESCRIPT

osascript "$TMPAS" > "$TMPTSV"

python3 - "$MODE" "$ARG" "$TMPTSV" <<'PY'
import sys, re, datetime as dt, collections

mode = sys.argv[1] if len(sys.argv) > 1 else "upcoming"
arg  = sys.argv[2] if len(sys.argv) > 2 else "14"
path = sys.argv[3]

def P(s):
    return dt.datetime.strptime(s, "%Y-%m-%dT%H:%M")

rows = [l.rstrip("\n").split("\t") for l in open(path, encoding="utf-8") if l.strip()]

if mode == "raw":
    for r in rows:
        r += [""] * (6 - len(r))
        print(" | ".join(r[:6]))
    raise SystemExit(0)

holidays = []   # (date_from, date_to, name)
events   = []   # (start, end, summary, cal, allday, recur)

for r in rows:
    r += [""] * (6 - len(r))
    cal, summ, s, e, ad, rec = r[:6]
    st, en, allday = P(s), P(e), ad == "1"
    if allday and "假期" in summ:
        holidays.append((st.date(), en.date(), summ))
    events.append((st, en, summ, cal, allday, rec))

def in_holiday(d):
    for a, b, n in holidays:
        if a <= d <= b:
            return n
    return None

occ = []
biweekly = set()   # (weekday, t1, t2) 来自 INTERVAL>1 的隔周课程
for st, en, summ, cal, allday, rec in events:
    if not rec:
        occ.append((st, en, summ, cal, allday, False))
        continue
    m = re.match(r"FREQ=WEEKLY;INTERVAL=(\d+);COUNT=(\d+)", rec)
    if not m:
        occ.append((st, en, summ, cal, allday, False))
        continue
    itv, cnt = int(m.group(1)), int(m.group(2))
    if itv > 1:
        biweekly.add((st.weekday(), st.time(), en.time()))
    for i in range(cnt):
        d = st + dt.timedelta(weeks=i * itv)
        if not allday and in_holiday(d.date()):
            continue
        occ.append((d, d + (en - st), summ, cal, allday, True))
occ.sort()

WD = ["周一", "周二", "周三", "周四", "周五", "周六", "周日"]

def fmt(t):
    return t.strftime("%H:%M")

if mode == "timetable":
    print("=" * 62)
    print("学期固定课表（已展开重复日程、剔除假期）")
    print("=" * 62)
    bywd = collections.defaultdict(set)
    span = collections.defaultdict(list)
    for st, en, summ, cal, allday, rec in occ:
        if not rec or allday:
            continue
        bywd[st.weekday()].add((st.time(), en.time(), summ))
        span[summ].append(st.date())
    for wd in range(7):
        items = bywd.get(wd, set())
        if not items:
            continue
        print(f"\n{WD[wd]}")
        for t1, t2, summ in sorted(items):
            print(f"  {fmt(t1)}-{fmt(t2)}  {summ}")
    print("\n" + "-" * 62)
    print("各课程起止")
    for k, v in sorted(span.items(), key=lambda x: min(x[1])):
        n = len(v)
        extra = "" if n > 1 else "  （单次）"
        print(f"  {k:26} {min(v)} ~ {max(v)}  {n} 次{extra}")

elif mode == "free":
    print("=" * 62)
    print("每周空闲时段（按 08:00-23:00 估算，只列 1 小时以上）")
    print("=" * 62)
    BUSY_FROM, BUSY_TO = dt.time(8, 0), dt.time(23, 0)

    def gaps(blocks):
        out, cur = [], BUSY_FROM
        for t1, t2 in sorted(blocks):
            if t1 > cur:
                mins = (dt.datetime.combine(dt.date.min, t1) - dt.datetime.combine(dt.date.min, cur)).seconds // 60
                if mins >= 60:
                    out.append((cur, t1, mins))
            cur = max(cur, t2)
        if cur < BUSY_TO:
            mins = (dt.datetime.combine(dt.date.min, BUSY_TO) - dt.datetime.combine(dt.date.min, cur)).seconds // 60
            if mins >= 60:
                out.append((cur, BUSY_TO, mins))
        return out

    def show(blocks, indent):
        gs = gaps(blocks)
        if not gs:
            print(f"{indent}（没有 1 小时以上的空闲时段）")
        for a, b, m in gs:
            print(f"{indent}{a.strftime('%H:%M')}-{b.strftime('%H:%M')}  {m/60:.1f}h")

    for wd in range(7):
        weekly, bi = set(), set()
        for st, en, summ, cal, ad, rec in occ:
            if not (rec and not ad and st.weekday() == wd):
                continue
            key = (st.time(), en.time())
            (bi if (wd, key[0], key[1]) in biweekly else weekly).add(key)
        if not weekly and not bi:
            print(f"\n{WD[wd]}  全天无课")
            continue
        if bi:
            print(f"\n{WD[wd]}  （含隔周课程，分两种情况）")
            print("  有实验周")
            show(weekly | bi, "    ")
            print("  无实验周")
            show(weekly, "    ")
        else:
            print(f"\n{WD[wd]}")
            show(weekly, "  ")

else:  # upcoming
    days = int(arg)
    today = dt.date.today()
    end = today + dt.timedelta(days=days)
    print("=" * 62)
    print(f"日程明细  {today} ~ {end}")
    print("=" * 62)
    d = today
    while d <= end:
        items = [(st, en, summ) for st, en, summ, cal, ad, rec in occ
                 if st.date() == d and not ad]
        h = in_holiday(d)
        if items or h:
            print(f"\n{d} {WD[d.weekday()]}" + (f"  【{h}】" if h else ""))
            for st, en, summ in sorted(items):
                print(f"   {fmt(st)}-{fmt(en)}  {summ}")
        d += dt.timedelta(days=1)
PY
