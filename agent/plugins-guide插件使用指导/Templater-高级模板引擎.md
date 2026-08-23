---
tags:
  - plugin-guide插件指南
  - AI-generated人工智能生成
aliases:
  - Templater使用指南
created: 2025-08-20
updated: 2026-08-24
status: done
---

# 📝 Templater 高级模板引擎

> Obsidian 最强大的模板插件，支持动态内容、JavaScript 执行、日期计算等高级功能

---

## 📋 插件简介

| 项目 | 说明 |
|------|------|
| **插件名** | Templater |
| **功能** | 高级模板引擎，支持动态内容和脚本 |
| **适用场景** | 复杂模板、自动填充、批量操作 |

---

## ⚙️ 基础配置

### 1. 设置模板文件夹

1. 打开 Obsidian 设置
2. 进入 **Templater** 选项
3. 设置 **Template folder location** 为 `Templates`

### 2. 推荐设置

| 设置项 | 推荐值 | 说明 |
|--------|--------|------|
| Trigger Templater on new file creation | ✅ 启用 | 新建文件时自动触发 |
| Enable system commands | ⚠️ 按需 | 允许执行系统命令 |
| Enable JavaScript Functions | ✅ 启用 | 允许 JS 函数 |
| Allow running System Commands | ❌ 禁用 | 安全考虑 |

---

## 🎯 基础语法

### 日期时间函数

```markdown
<% tp.date.now("YYYY-MM-DD") %>          // 当前日期：2025-08-20
<% tp.date.now("YYYY-MM-DD HH:mm") %>    // 当前日期时间：2025-08-20 14:30
<% tp.date.now("dddd") %>                // 星期几：星期二
<% tp.date.now("YYYY年第w周") %>          // 2025年第34周
```

### 日期偏移

```markdown
<% tp.date.now("YYYY-MM-DD", 1) %>       // 明天
<% tp.date.now("YYYY-MM-DD", -1) %>      // 昨天
<% tp.date.now("YYYY-MM-DD", 7) %>       // 一周后
```

### 文件信息

```markdown
<% tp.file.title %>                      // 当前文件名
<% tp.file.creation_date() %>            // 创建日期
<% tp.file.last_modified_date() %>       // 最后修改日期
<% tp.file.folder() %>                   // 所在文件夹
```

---

## 🚀 高级功能

### 用户输入提示

```markdown
<% await tp.system.prompt("请输入标题") %>
<% await tp.system.suggester(["选项1", "选项2", "选项3"], ["值1", "值2", "值3"]) %>
```

**示例：创建错题记录模板**

```markdown
---
tags:
  - error/<% await tp.system.suggester(["数学", "数据结构", "设计理论", "英语"], ["math", "ds", "theory", "english"]) %>
---

# ❌ <% await tp.system.prompt("请输入错题标题") %>

## 📋 题目
> <% await tp.system.prompt("请粘贴题目内容") %>

## 🚫 我的错误答案
<% await tp.system.prompt("请输入你的错误答案") %>

## ✅ 正确答案
<% await tp.system.prompt("请输入正确答案") %>
```

### 条件判断

```markdown
<%*
if (tp.file.folder() === "01-Records记录/Daily每日") { %>
这是日计划文件
<%* } else { %>
这不是日计划文件
<%* } %>
```

### 循环生成

```markdown
<%*
const days = ["周一", "周二", "周三", "周四", "周五", "周六", "周日"];
for (const day of days) { %>
### <%- day %>
- [ ] 
<%* } %>
```

---

## 📚 考研实用模板

### 1. 智能日计划模板

```markdown
---
tags:
  - record/daily
created: "<% tp.date.now('YYYY-MM-DD') %>"
date: "<% tp.date.now('YYYY-MM-DD') %>"
weekday: "<% tp.date.now('dddd') %>"
---

# 📅 <% tp.date.now("YYYY-MM-DD dddd") %> 每日记录

## 🎯 今日目标
- [ ] 目标1
- [ ] 目标2
- [ ] 目标3

## 📚 学习安排

### 上午（8:00-12:00）
| 时间 | 科目 | 计划内容 | 执行情况 |
|------|------|----------|----------|
| 8:00-9:30 | <% await tp.system.suggester(["数学", "数据结构", "设计理论", "英语", "政治"], ["数学", "数据结构", "设计理论", "英语", "政治"]) %> |  |  |
| 9:45-11:15 |  |  |  |
| 11:15-12:00 |  |  |  |

### 下午（14:00-17:30）
| 时间 | 科目 | 计划内容 | 执行情况 |
|------|------|----------|----------|
| 14:00-15:30 |  |  |  |
| 15:45-17:30 |  |  |  |

### 晚上（19:00-22:00）
| 时间 | 科目 | 计划内容 | 执行情况 |
|------|------|----------|----------|
| 19:00-20:30 |  |  |  |
| 20:45-22:00 |  |  |  |

## 📝 执行记录
> （学习过程中或结束后填写）

## 🔄 今日复盘
- 学习时长：
- 完成任务：
- 最大收获：
- 待改进：

---
> 📅 <% tp.date.now("YYYY-MM-DD HH:mm") %> 创建
```

### 2. 智能周计划模板

```markdown
---
tags:
  - record/weekly
created: "<% tp.date.now('YYYY-MM-DD') %>"
week: "<% tp.date.now('gggg-[W]ww') %>"
---

# 📆 <% tp.date.now("YYYY") %> 第 <% tp.date.now("ww") %> 周记录

**周期**：<% tp.date.now("YYYY-MM-DD") %> ~ <% tp.date.now("YYYY-MM-DD", 7) %>

## 🎯 本周目标
- [ ] 目标1
- [ ] 目标2
- [ ] 目标3

## 📅 每日安排

<%*
const days = [
  {name: "周一", date: tp.date.now("MM-DD", 0)},
  {name: "周二", date: tp.date.now("MM-DD", 1)},
  {name: "周三", date: tp.date.now("MM-DD", 2)},
  {name: "周四", date: tp.date.now("MM-DD", 3)},
  {name: "周五", date: tp.date.now("MM-DD", 4)},
  {name: "周六", date: tp.date.now("MM-DD", 5)},
  {name: "周日", date: tp.date.now("MM-DD", 6)}
];
for (const day of days) { %>
### <%- day.name %>（<%- day.date %>）
- 上午：
- 下午：
- 晚上：
<%* } %>

## 📊 本周复盘
- 完成率：
- 最大收获：
- 待改进：

---
> 📅 <% tp.date.now("YYYY-MM-DD HH:mm") %> 创建
```

### 3. 智能错题模板

```markdown
---
tags:
  - error/<% await tp.system.suggester(
      ["数学", "数据结构", "设计理论", "设计实践", "英语", "政治"],
      ["math", "ds", "theory", "practice", "english", "politics"]
    ) %>
created: "<% tp.date.now('YYYY-MM-DD') %>"
status: to-review
mastered: false
error-type: "<% await tp.system.suggester(
  ["计算错误", "概念混淆", "粗心大意", "知识盲区", "审题不清"],
  ["计算错误", "概念混淆", "粗心大意", "知识盲区", "审题不清"]
) %>"
---

# ❌ <% await tp.system.prompt("请输入错题标题") %>

## 📋 题目信息
- **来源**：<% await tp.system.prompt("请输入题目来源（如：真题/习题/模拟题）") %>
- **章节**：<% await tp.system.prompt("请输入所属章节") %>
- **难度**：<% await tp.system.suggester(["简单", "中等", "困难"], ["简单", "中等", "困难"]) %>

## 📝 题目内容
> <% await tp.system.prompt("请粘贴题目内容") %>

## 🚫 我的错误答案
```
<% await tp.system.prompt("请输入你的错误答案") %>
```

## ✅ 正确答案
```
<% await tp.system.prompt("请输入正确答案") %>
```

## 💡 错误分析

### 错误原因
<% await tp.system.prompt("请分析错误原因") %>

### 正确思路
<% await tp.system.prompt("请写出正确解题思路") %>

### 知识点总结
<% await tp.system.prompt("请总结相关知识点") %>

## 🔄 复习记录

| 日期 | 掌握程度 | 备注 |
|------|----------|------|
| <% tp.date.now("YYYY-MM-DD") %> | 初次记录 | |

---
> 📅 <% tp.date.now("YYYY-MM-DD HH:mm") %> 创建
```

---

## 🔧 常用快捷键

| 快捷键 | 功能 |
|--------|------|
| `Alt + E` | 打开 Templater 命令面板 |
| `Ctrl/Cmd + P` 输入 `Templater` | 查看所有 Templater 命令 |

---

## ⚠️ 注意事项

1. **模板语法**：使用 `<% %>` 而不是 `{{}}`
2. **异步函数**：需要使用 `await` 关键字
3. **JavaScript**：需要在设置中启用 JS 函数
4. **备份**：修改模板前先备份

---

## 📖 相关资源

- [Templater 官方文档](https://silentvoid13.github.io/Templater/)
- [Templater 函数参考](https://silentvoid13.github.io/Templater/internal-functions/overview.html)

---

> 📅 **最后更新**：2025-08-20
