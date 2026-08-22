---
tags:
  - plugin-guide插件指南
  - dataview
  - AI-generated人工智能生成
aliases:
  - "Dataview使用指南"
created: "2025-08-20"
updated: "2026-08-24"
status: done
---

# 📊 Dataview 数据查询

> Obsidian 最强大的数据查询插件，将笔记库变成可查询的数据库

---

## 📋 插件简介

| 项目 | 说明 |
|------|------|
| **插件名** | Dataview |
| **功能** | 基于 Frontmatter 和内容的数据查询 |
| **适用场景** | 统计、报表、动态列表、进度追踪 |

---

## ⚙️ 基础配置

### 1. 启用 JavaScript 查询

1. 打开 Obsidian 设置
2. 进入 **Dataview** 选项
3. 启用 **Enable JavaScript Queries**

### 2. 推荐设置

| 设置项 | 推荐值 | 说明 |
|--------|--------|------|
| Enable JavaScript Queries | ✅ 启用 | 允许 JS 查询 |
| Enable Inline Queries | ✅ 启用 | 行内查询 |
| Enable Inline Field Queries | ✅ 启用 | 行内字段 |
| Automatic Task Completion | ✅ 启用 | 自动标记任务完成 |

---

## 🎯 查询语法

### TABLE 查询（表格）

**基础语法**

```dataview
TABLE 字段1, 字段2, 字段3
FROM "文件夹路径"
WHERE 条件
SORT 字段 ASC/DESC
```

**示例：查看所有学习笔记**

```dataview
TABLE subject AS "科目", created AS "创建日期", status AS "状态"
FROM #note
SORT created DESC
```

### LIST 查询（列表）

```dataview
LIST
FROM "文件夹路径"
WHERE 条件
```

**示例：查看待复习内容**

```dataview
LIST
FROM #knowledge
WHERE status = "to-review"
```

### TASK 查询（任务）

```dataview
TASK
FROM "文件夹路径"
WHERE !completed
```

**示例：查看未完成任务**

```dataview
TASK
FROM "01-Plans计划"
WHERE !completed
GROUP BY file.link
```

---

## 🔍 常用查询操作符

| 操作符 | 说明 | 示例 |
|--------|------|------|
| `=` | 等于 | `WHERE status = "done"` |
| `!=` | 不等于 | `WHERE status != "done"` |
| `>` | 大于 | `WHERE priority > 3` |
| `<` | 小于 | `WHERE pages < 100` |
| `>=` | 大于等于 | `WHERE rating >= 4` |
| `<=` | 小于等于 | `WHERE difficulty <= 2` |
| `contains` | 包含 | `WHERE contains(tags, "math")` |
| `!contains` | 不包含 | `WHERE !contains(tags, "archived")` |

---

## 📊 考研实用查询

### 1. 学习进度统计

```dataview
TABLE length(rows) AS "笔记数量"
FROM #note
GROUP BY subject
SORT subject ASC
```

**效果**：按科目统计学习笔记数量

---

### 2. 错题统计分析

```dataview
TABLE 
  error-type AS "错误类型",
  subject AS "科目",
  mastered AS "已掌握"
FROM #error
WHERE mastered = false
SORT subject ASC
```

---

### 3. 待复习知识卡片

```dataview
TABLE 
  subject AS "科目",
  mastery AS "掌握程度",
  created AS "创建日期"
FROM #knowledge
WHERE status = "to-review"
SORT mastery ASC
LIMIT 20
```

---

### 4. 本周学习记录

```dataview
TABLE 
  file.name AS "日期",
  length(filter(file.tasks, (t) => t.completed)) AS "已完成",
  length(file.tasks) AS "总任务"
FROM "01-Records记录/Daily每日"
WHERE created >= date(today) - dur(7 days)
SORT created DESC
```

---

### 5. 月度学习时长统计

```dataview
TABLE 
  sum(study-hours) AS "总学习时长",
  length(rows) AS "学习天数",
  round(sum(study-hours) / length(rows), 1) AS "日均时长"
FROM "01-Records记录/Daily每日"
WHERE created >= date(today) - dur(30 days)
GROUP BY file.folder
```

---

### 6. 真题考点频率

```dataview
TABLE 
  length(rows) AS "出现次数",
  join(rows.file.name, ", ") AS "相关笔记"
FROM #exam-topic
GROUP BY topic
SORT length(rows) DESC
LIMIT 10
```

---

### 7. 经验帖索引

```dataview
TABLE 
  author AS "作者",
  year AS "年份",
  result AS "结果",
  status AS "状态"
FROM #experience/经验帖
SORT year DESC
```

---

## 🎨 高级查询技巧

### 使用 Dataview JS

```dataviewjs
// 统计各科目笔记数量
const pages = dv.pages('#note');
const subjects = {};
for (const page of pages) {
  const subject = page.subject || '未分类';
  subjects[subject] = (subjects[subject] || 0) + 1;
}

dv.table(
  ["科目", "笔记数量"],
  Object.entries(subjects).sort((a, b) => b[1] - a[1])
);
```

### 计算完成率

```dataviewjs
// 学习记录完成率统计
const records = dv.pages('#record/每日');
let totalTasks = 0;
let completedTasks = 0;

for (const plan of plans) {
  if (plan.file.tasks) {
    totalTasks += plan.file.tasks.length;
    completedTasks += plan.file.tasks.filter(t => t.completed).length;
  }
}

const rate = totalTasks > 0 ? Math.round(completedTasks / totalTasks * 100) : 0;
dv.paragraph(`📊 **计划完成率**：${rate}%（${completedTasks}/${totalTasks}）`);
```

---

## 📝 行内查询

### 基础行内查询

```markdown
今天是 `= date(today)`，距离考研还有 `= (date("2026-12-01") - date(today)).days` 天。
```

### 行内字段查询

```markdown
我的学习状态是`= this.status`，创建于`= this.created`。
```

---

## 🔧 常用函数

| 函数 | 说明 | 示例 |
|------|------|------|
| `date()` | 创建日期 | `date("2025-08-20")` |
| `date(today)` | 今天 | `date(today)` |
| `date(now)` | 当前时间 | `date(now)` |
| `dur()` | 时间段 | `dur(7 days)` |
| `length()` | 长度 | `length(rows)` |
| `round()` | 四舍五入 | `round(3.14, 1)` |
| `filter()` | 过滤 | `filter(list, (x) => x > 3)` |
| `sort()` | 排序 | `sort(list, (x) => x)` |
| `join()` | 连接 | `join(list, ", ")` |
| `reverse()` | 反转 | `reverse(list)` |

---

## 📊 考研数据面板

### 创建学习仪表盘

```markdown
# 📊 考研学习仪表盘

## 📈 整体进度

```dataviewjs
// 学习进度概览
const notes = dv.pages('#note');
const errors = dv.pages('#error');
const knowledge = dv.pages('#knowledge');

const stats = [
  ['📚 学习笔记', notes.length],
  ['❌ 错题记录', errors.length],
  ['🧠 知识卡片', knowledge.length],
  ['📝 待复习', knowledge.where(p => p.status === 'to-review').length]
];

dv.table(['指标', '数量'], stats);
```

## 📅 近期学习

```dataview
TABLE created AS "日期", length(file.tasks) AS "任务数"
FROM "01-Records记录/Daily每日"
SORT created DESC
LIMIT 7
```

## ❌ 薄弱环节

```dataview
TABLE subject AS "科目", length(rows) AS "错题数"
FROM #error
WHERE mastered = false
GROUP BY subject
SORT length(rows) DESC
```
```

---

## ⚠️ 常见问题

### 1. 查询不显示结果

- 检查标签是否正确（区分大小写）
- 检查 Frontmatter 格式是否正确
- 确认 Dataview 插件已启用

### 2. 日期比较失败

- 使用 `date()` 函数转换字符串
- 确保日期格式为 `YYYY-MM-DD`

### 3. 任务查询不准确

- 使用 `- [ ]` 和 `- [x]` 格式
- 确保缩进正确

---

## 📖 相关资源

- [Dataview 官方文档](https://blacksmithgu.github.io/obsidian-dataview/)
- [Dataview 查询示例](https://blacksmithgu.github.io/obsidian-dataview/reference/queries/)

---

> 📅 **最后更新**：2025-08-20
