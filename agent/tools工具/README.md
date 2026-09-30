---
tags:
  - resource资源
  - AI-generated人工智能生成
  - important重点
status: active
priority: 中
source: 其他
type: 资源
subject: 其他
created: 2026-09-30
updated: 2026-09-30
---

# 日历读取工具

读取 macOS 日历中已同步的 Google 账户课程，展开重复日程，输出课表与空闲时段。用于每周复盘时替代手工抄写「日程协同与时段分配策略」表。

## 用法

```bash
cd agent/tools工具
./读取日历.sh                 # 未来 14 天日程明细（默认）
./读取日历.sh upcoming 21     # 未来 21 天
./读取日历.sh timetable       # 本学期固定课表
./读取日历.sh free            # 每周空闲时段
./读取日历.sh raw             # 原始导出
```

## 前置条件

| 项 | 要求 |
| --- | --- |
| 系统 | macOS |
| 依赖 | `osascript`、`python3`（系统自带） |
| 日历 | 课程需已在 macOS 日历中，且为**重复日程** |
| **DSH 沙箱策略** | **必须是 `danger-full-access`** |

最后一条是关键：`workspace-write` 会拦截 Apple Events，脚本报 `权限违例 (-10004)`。若需切回更严格的沙箱，本工具将不可用。

## 两类失败及其原因

**1. 权限违例 (-10004)**

先确认沙箱策略。若策略正确仍失败，检查「系统设置 → 隐私与安全性 → 自动化 → DeepSeek Harness → 日历」。

**2. 只看到少量事件，课程不全**

AppleScript 直接查询**只返回重复系列的主条目，不展开各次发生**。这是最容易误判的地方：曾据此错误得出「日历没有维护」的结论。本脚本自行展开 `FREQ=WEEKLY;INTERVAL=n;COUNT=m`，不要改回直接查询。

## 实现要点

- 日历数据经 AppleScript 导出为 TSV，再交由 Python 展开与渲染
- 假期**自动识别**：全天事件且标题含「假期」，取起止区间；该区间内的课程实例会被剔除
- `free` 模式按 08:00–23:00 估算活跃时段，只列 1 小时以上的空闲时段
- `INTERVAL>1` 的隔周课程在 `free` 模式中分「有实验周 / 无实验周」两种情况输出

## 已知限制

- 假期识别依赖日历中存在全天「假期」事件；若某年未录入，需先补录
- 只处理 `FREQ=WEEKLY`，其他 RRULE（如 `FREQ=DAILY`、`BYDAY` 组合）按单次事件处理
- 不处理 `EXDATE` 排除与 `RECURRENCE-ID` 单次改期实例
- 活跃时段 08:00–23:00 是硬编码假设，作息变化时需改脚本内 `BUSY_FROM` / `BUSY_TO`
- 需忽略的日历名写在脚本顶部 `SKIP_LIST`，新增订阅日历时需同步维护
