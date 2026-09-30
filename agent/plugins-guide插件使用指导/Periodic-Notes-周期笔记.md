---
tags:
  - plugin-guide插件指南
  - AI-generated人工智能生成
aliases:
  - Periodic Notes使用指南
created: 2025-08-20
updated: 2026-08-24
status: done
---

# 📆 Periodic Notes 周期笔记

> 管理日记、周记、月记、年记等周期性笔记，配合 Calendar 实现完整的时间管理系统

---

## 📋 插件简介

| 项目 | 说明 |
|------|------|
| **插件名** | Periodic Notes |
| **功能** | 周期性笔记管理（日/周/月/年） |
| **适用场景** | 定期复盘、周期计划、习惯追踪 |
| **配合插件** | Calendar、Templater |

---

## ⚙️ 基础配置

### 1. 启用插件

1. 打开 Obsidian 设置
2. 进入 **Community plugins**
3. 确认 **Periodic Notes** 已启用

### 2. 推荐设置

| 设置项 | 推荐值 | 说明 |
|--------|--------|------|
| Daily Notes | ✅ 启用 | 每日笔记 |
| Weekly Notes | ✅ 启用 | 每周笔记 |
| Monthly Notes | ✅ 启用 | 每月笔记 |
| Yearly Notes | ✅ 启用 | 每年笔记 |

### 3. 路径配置

| 类型 | 文件夹 | 文件名格式 |
|------|--------|------------|
| Daily | `01-Records记录/Daily每日` | `YYYY-MM-DD dddd` |
| Weekly | `01-Records记录/Weekly每周` | `YYYY-[W]ww` |
| Monthly | `01-Records记录/Monthly每月` | `YYYY-MM` |
| Yearly | `01-Records记录/Yearly年度` | `YYYY` |

### 4. 模板配置

| 类型 | 模板路径 |
|------|----------|
| Daily | `Templates/daily-record.md` |
| Weekly | `Templates/weekly-record.md` |
| Monthly | `Templates/monthly-record.md` |
| Yearly | `Templates/yearly-record.md` |

---

## 🎯 基础使用

### 1. 创建周期笔记

**方法一：命令面板**
- `Ctrl/Cmd + P` 输入：
  - `Periodic Notes: Open daily note`
  - `Periodic Notes: Open weekly note`
  - `Periodic Notes: Open monthly note`
  - `Periodic Notes: Open yearly note`

**方法二：左侧边栏**
- 点击日历图标旁的周期笔记按钮

**方法三：快捷键**
- 设置自定义快捷键快速创建

### 2. 导航操作

| 操作 | 说明 |
|------|------|
| 上一篇 | 切换到上一个周期笔记 |
| 下一篇 | 切换到下一个周期笔记 |
| 今天 | 快速跳转到今天的笔记 |

---

## 📊 考研应用场景

### 1. 每日学习记录

```
Daily Notes（每日记录）
├── 2025-08-20 星期二.md  → 计划+执行+复盘
├── 2025-08-21 星期三.md  → 计划+执行+复盘
└── ...
```

**用途**：
- 晨间填写学习计划
- 学习中记录执行情况
- 晚间完成复盘总结

### 2. 每周复盘总结

```
Weekly Notes（每周记录）
├── 2025-W34.md  → 本周复盘+下周计划
├── 2025-W35.md  → 本周复盘+下周计划
└── ...
```

**用途**：
- 回顾本周学习成果
- 分析薄弱环节
- 同时制定下周计划

### 3. 每月进度评估

```
Monthly Notes（每月记录）
├── 2025-08.md  → 8月复盘+9月计划
├── 2025-09.md  → 9月复盘+10月计划
└── ...
```

**用途**：
- 月度学习进度评估
- 调整学习策略
- 同时规划下月目标

### 4. 每年规划回顾

```
Yearly Notes（每年笔记）
├── 2025.md  → 2025年备考规划
├── 2026.md  → 2026年冲刺计划
└── ...
```

**用途**：
- 年度备考规划
- 长期目标设定
- 考前冲刺安排

---

## 📝 模板设计

### 1. 每日记录模板

```markdown
---
tags:
  - record/daily
created: "{{date:YYYY-MM-DD}}"
date: "{{date:YYYY-MM-DD}}"
weekday: "{{date:dddd}}"
status: in-progress
---

# 📅 {{date:YYYY-MM-DD dddd}} 每日记录

## 🎯 今日计划
- [ ] 目标1
- [ ] 目标2
- [ ] 目标3

## 📚 学习安排

### 上午（8:00-12:00）
| 时间 | 科目 | 计划内容 | 执行情况 |
|------|------|----------|----------|
| 8:00-10:00 |  |  |  |
| 10:00-12:00 |  |  |  |

### 下午（14:00-18:00）
| 时间 | 科目 | 计划内容 | 执行情况 |
|------|------|----------|----------|
| 14:00-16:00 |  |  |  |
| 16:00-18:00 |  |  |  |

### 晚上（19:00-22:00）
| 时间 | 科目 | 计划内容 | 执行情况 |
|------|------|----------|----------|
| 19:00-21:00 |  |  |  |
| 21:00-22:00 |  |  |  |

## 📝 执行记录
> （学习过程中或结束后填写实际完成情况）

## 🔄 今日复盘
- **学习时长**：__小时
- **完成任务**：__/__ 个
- **最大收获**：
- **遇到问题**：
- **待改进**：
- **明日调整**：
```

### 2. 每周记录模板

```markdown
---
tags:
  - record/weekly
created: "{{date:YYYY-MM-DD}}"
week: "{{date:gggg-[W]ww}}"
status: in-progress
---

# 📆 {{date:YYYY}} 第 {{date:ww}} 周记录

**周期**：{{date:YYYY-MM-DD}} ~ {{date+7d:YYYY-MM-DD}}

## 📋 本周计划
- [ ] 目标1
- [ ] 目标2
- [ ] 目标3

## 📊 本周复盘

### 学习统计
| 科目 | 计划时长 | 实际时长 | 完成率 |
|------|----------|----------|--------|
| 数学 | 15h |  |  |
| 专业课 | 20h |  |  |
| 英语 | 10h |  |  |
| 政治 | 5h |  |  |
| **合计** | **50h** |  |  |

### 本周成就
1. 
2. 
3. 

### 薄弱环节
1. 
2. 

### 经验总结


## 📅 下周计划

| 日期 | 重点任务 |
|------|----------|
| 周一 |  |
| 周二 |  |
| 周三 |  |
| 周四 |  |
| 周五 |  |
| 周六 |  |
| 周日 |  |
```

### 3. 每月记录模板

```markdown
---
tags:
  - record/monthly
created: "{{date:YYYY-MM-DD}}"
month: "{{date:YYYY-MM}}"
status: in-progress
---

# 🗓️ {{date:YYYY年MM月}} 月度记录

## 📋 本月计划

### 重点目标
1. 
2. 
3. 

### 时间分配
- 数学：__小时
- 专业课：__小时
- 英语：__小时
- 政治：__小时

## 📊 本月复盘

### 各科完成情况

| 科目 | 月初目标 | 实际完成 | 完成率 |
|------|----------|----------|--------|
| 数学 |  |  |  |
| 专业课 |  |  |  |
| 英语 |  |  |  |
| 政治 |  |  |  |

### 学习时长统计

- 本月总学习时长：__小时
- 日均学习时长：__小时
- 最高单日时长：__小时
- 最低单日时长：__小时

### 本月成就
1. 
2. 
3. 

### 问题分析
1. 
2. 

### 经验教训


## 📅 下月计划

### 重点目标
1. 
2. 
3. 

### 时间分配
- 数学：__小时
- 专业课：__小时
- 英语：__小时
- 政治：__小时
```

---

## 🔧 高级功能

### 1. 与 Calendar 配合

Periodic Notes 和 Calendar 是最佳搭档：

```
Calendar（可视化）
    ↓ 点击日期
Periodic Notes（创建/打开笔记）
    ↓ 使用模板
Templater（填充内容）
```

### 2. 与 Dataview 配合

使用 Dataview 查询周期笔记数据：

```dataview
TABLE 
  date AS "日期",
  study-hours AS "学习时长",
  completed-tasks AS "完成任务"
FROM "01-Plans计划/Daily日常"
WHERE created >= date(today) - dur(7 days)
SORT created DESC
```

### 3. 快捷键设置

| 命令 | 推荐快捷键 |
|------|------------|
| Open daily note | `Ctrl/Cmd + Shift + D` |
| Open weekly note | `Ctrl/Cmd + Shift + W` |
| Open monthly note | `Ctrl/Cmd + Shift + M` |
| Open yearly note | `Ctrl/Cmd + Shift + Y` |

---

## 📊 Dataview 查询示例

### 本周学习统计

```dataviewjs
// 统计本周每日学习时长
const dailyNotes = dv.pages('"01-Records记录/Daily每日"')
  .where(p => p.created >= dv.date('today').minus(dv.duration('7 days')));

let totalHours = 0;
const rows = [];

for (const note of dailyNotes) {
  const hours = note['study-hours'] || 0;
  totalHours += hours;
  rows.push([
    note.file.link,
    note.weekday || '',
    `${hours}h`
  ]);
}

dv.table(['日期', '星期', '学习时长'], rows);
dv.paragraph(`**本周总学习时长**：${totalHours}小时`);
```

### 月度科目分布

```dataviewjs
// 统计本月各科学习笔记数量
const notes = dv.pages('"02-Notes笔记"')
  .where(p => p.created >= dv.date('today').minus(dv.duration('30 days')));

const subjects = {};
for (const note of notes) {
  const subject = note.subject || '未分类';
  subjects[subject] = (subjects[subject] || 0) + 1;
}

dv.table(
  ['科目', '笔记数量'],
  Object.entries(subjects).sort((a, b) => b[1] - a[1])
);
```

---

## ⚠️ 常见问题

### 1. 笔记不自动创建

- 确认 Periodic Notes 插件已启用
- 检查文件夹路径设置是否正确
- 确认模板文件存在

### 2. 模板不自动填充

- 确认 Templater 插件已启用
- 检查模板路径设置
- 确认模板语法正确

### 3. 周数显示错误

- 检查日期格式设置
- 确认时区设置正确
- 使用 `gggg-[W]ww` 格式

### 4. 与 Daily Notes 插件冲突

- Periodic Notes 会替代内置的 Daily Notes
- 在设置中禁用内置 Daily Notes
- 统一使用 Periodic Notes 管理

---

## 📖 相关资源

- [Periodic Notes 插件文档](https://github.com/liamcain/obsidian-periodic-notes)
- [Calendar 插件文档](https://github.com/liamcain/obsidian-calendar-plugin)

---

> 📅 **最后更新**：2026-08-24