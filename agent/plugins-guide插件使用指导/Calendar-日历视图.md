---
tags:
  - plugin-guide插件指南
  - AI-generated人工智能生成
aliases:
  - Calendar使用指南
created: 2025-08-20
updated: 2026-08-24
status: done
---

# 📅 Calendar 日历视图

> 在侧边栏显示日历，快速创建和定位日记、计划

---

## 📋 插件简介

| 项目 | 说明 |
|------|------|
| **插件名** | Calendar |
| **功能** | 日历视图，可视化日记和计划 |
| **适用场景** | 日记管理、计划追踪、时间可视化 |

---

## ⚙️ 基础配置

### 1. 启用日历视图

1. 打开 Obsidian 设置
2. 进入 **Calendar** 选项
3. 确认 **Show calendar** 已启用

### 2. 推荐设置

| 设置项 | 推荐值 | 说明 |
|--------|--------|------|
| Show calendar | ✅ 启用 | 显示日历 |
| Start week on | Monday | 周一开始 |
| Words per dot | 250 | 每个点代表250字 |
| Show week numbers | ✅ 启用 | 显示周数 |

### 3. 配置日记路径

确保 **Daily Notes** 插件设置正确：

1. 进入 **Daily Notes** 设置
2. 设置 **New file location** 为 `01-Plans计划/Daily日常`
3. 设置 **Date format** 为 `YYYY-MM-DD`

---

## 🎯 基础使用

### 1. 打开日历视图

- 点击左侧边栏的 **日历图标**
- 或使用快捷键 `Ctrl/Cmd + P` 输入 `Calendar: Open calendar`

### 2. 创建日记

**方法一：点击日期**
- 在日历上点击任意日期
- 自动创建对应日期的日记文件

**方法二：点击今天**
- 点击日历顶部的 **今天** 按钮
- 快速创建今天的日记

### 3. 查看日记

- **有笔记的日期**：显示圆点
- **圆点大小**：表示笔记字数
- **悬停**：预览笔记内容

---

## 📊 考研应用场景

### 1. 学习日记追踪

```
📅 日历视图
├── 2025-08-15（3个点）→ 学习了8小时
├── 2025-08-16（2个点）→ 学习了5小时
├── 2025-08-17（4个点）→ 学习了10小时
└── 2025-08-18（今天）→ 点击创建
```

### 2. 周计划可视化

- 日历自动显示 **周数**
- 配合 `weekly-plan.md` 模板
- 快速定位某周的计划

### 3. 月度复盘

- 通过圆点密度 **直观感受学习强度**
- 识别学习低谷期
- 调整学习节奏

---

## 🔧 高级技巧

### 1. 自定义日期格式

在 **Daily Notes** 设置中：

| 格式 | 效果 |
|------|------|
| `YYYY-MM-DD` | 2025-08-20 |
| `YYYY/MM/DD` | 2025/08/20 |
| `YYYY年第MM月DD日` | 2025年第08月20日 |

### 2. 配合 Templater

使用 Templater 模板自动填充日记内容：

```markdown
---
tags:
  - plan/daily
created: "<% tp.date.now('YYYY-MM-DD') %>"
---

# 📅 <% tp.date.now("YYYY-MM-DD dddd") %>

## 🎯 今日目标
- [ ] 
- [ ] 
- [ ] 

## 📚 学习内容

### 上午
- 

### 下午
- 

### 晚上
- 

## 📊 今日总结
- 学习时长：
- 完成任务：
```

### 3. 添加笔记预览

悬停在日期上时，会显示：
- 笔记标题
- 前几行内容
- 标签信息

---

## 📅 配合周数查询

### 使用 Dataview 查询某周笔记

```dataview
TABLE created AS "日期", length(file.tasks) AS "任务数"
FROM "01-Plans计划/Daily日常"
WHERE contains(created, "2025-W34")
SORT created ASC
```

### 统计每周学习时长

```dataview
TABLE 
  sum(study-hours) AS "总时长",
  round(sum(study-hours) / 7, 1) AS "日均"
FROM "01-Plans计划/Daily日常"
WHERE created >= date(today) - dur(30 days)
GROUP BY dateformat(created, "yyyy-'W'ww")
```

---

## ⚠️ 常见问题

### 1. 日历不显示

- 确认 Calendar 插件已启用
- 检查左侧边栏是否有日历图标
- 尝试重启 Obsidian

### 2. 日期点击无反应

- 确认 Daily Notes 插件已启用
- 检查日记文件夹路径设置
- 确认有写入权限

### 3. 圆点不显示

- 检查日记文件是否在正确路径
- 确认文件名格式与设置一致
- 检查字数是否达到阈值

---

## 📖 相关资源

- [Calendar 插件文档](https://github.com/liamcain/obsidian-calendar-plugin)

---

> 📅 **最后更新**：2026-08-24