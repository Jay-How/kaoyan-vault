---
tags:
  - plugin-guide
  - index
aliases:
  - "插件指南索引"
created: "2025-08-20"
updated: "2025-08-20"
status: done
---

# 📚 社区插件使用指南

> 为考研 Obsidian 库中安装的 8 个社区插件编写的中文使用指导

---

## 📋 插件清单

| 插件 | 功能 | 考研用途 | 文档链接 |
|------|------|----------|----------|
| **Templater** | 高级模板引擎 | 智能模板、自动填充 | [[Templater 高级模板引擎]] |
| **Dataview** | 数据查询 | 统计报表、进度追踪 | [[Dataview 数据查询]] |
| **Calendar** | 日历视图 | 日记管理、时间可视化 | [[Calendar 日历视图]] |
| **Periodic Notes** | 周期笔记 | 日/周/月/年笔记管理 | [[Periodic Notes 周期笔记]] |
| **Obsidian Git** | 版本控制 | 数据备份、多端同步 | [[Obsidian Git 版本控制]] |
| **Kanban** | 看板视图 | 任务管理、计划追踪 | [[Obsidian Kanban 看板视图]] |
| **Table Editor** | 表格编辑器 | 数据整理、对比分析 | [[Table Editor 表格编辑器]] |
| **Style Settings** | 样式设置 | 个性化界面、护眼配色 | [[Style Settings 样式设置]] |
| **RealClaudian** | AI 助手 | 知识问答、内容生成 | [[RealClaudian AI助手]] |

---

## 🎯 快速查找

### 按使用场景

| 场景 | 推荐插件 |
|------|----------|
| 创建智能模板 | [[Templater 高级模板引擎]] |
| 统计学习进度 | [[Dataview 数据查询]] |
| 管理每日日记 | [[Calendar 日历视图]], [[Periodic Notes 周期笔记]] |
| 周期性复盘 | [[Periodic Notes 周期笔记]] |
| 备份学习数据 | [[Obsidian Git 版本控制]] |
| 管理学习任务 | [[Obsidian Kanban 看板视图]] |
| 整理数据表格 | [[Table Editor 表格编辑器]] |
| 自定义界面 | [[Style Settings 样式设置]] |
| AI 辅助学习 | [[RealClaudian AI助手]] |

### 按学习阶段

| 阶段 | 推荐插件 |
|------|----------|
| **基础阶段** | Calendar、Periodic Notes、Kanban、Templater |
| **强化阶段** | Dataview、Table Editor、RealClaudian |
| **冲刺阶段** | Dataview、Obsidian Git、Style Settings、Periodic Notes |

---

## 🔗 插件协作

### 典型工作流

```
┌─────────────┐     ┌─────────────────┐     ┌─────────────┐
│  Calendar   │ ──→ │ Periodic Notes  │ ──→ │  Templater  │
│  选择日期   │     │  创建周期笔记   │     │  填充模板   │
└─────────────┘     └─────────────────┘     └─────────────┘
                                                  ↓
                    ┌─────────────┐     ┌─────────────┐
                    │   Kanban    │ ──→ │  Dataview   │
                    │  任务管理   │     │  统计进度   │
                    └─────────────┘     └─────────────┘
                                                  ↓
                                        ┌─────────────┐
                                        │   Git       │
                                        │  备份同步   │
                                        └─────────────┘
```

### 配合使用示例

1. **创建学习计划**
   - Calendar 选择日期
   - Periodic Notes 创建周期笔记
   - Templater 自动填充模板
   - Kanban 管理任务

2. **记录学习进度**
   - Periodic Notes 每日/周/月记录
   - Templater 创建笔记模板
   - Dataview 统计进度
   - Git 自动备份

3. **周期复盘分析**
   - Periodic Notes 周/月复盘笔记
   - Dataview 查询数据
   - Table Editor 整理表格
   - RealClaudian 辅助分析

---

## 📖 使用建议

### 新手入门

1. 先熟悉 **Calendar** 和 **Periodic Notes**（时间管理基础）
2. 学习 **Kanban** 管理任务（计划执行）
3. 掌握 **Templater** 基础语法（提升效率）
4. 了解 **Dataview** 基础查询（数据统计）

### 进阶使用

1. 深入 **Templater** 高级功能（JS 脚本）
2. 精通 **Dataview** 复杂查询（数据分析）
3. 配置 **Style Settings**（个性化界面）

### 高级技巧

1. **RealClaudian** 辅助学习（AI 问答）
2. **Git** 多端同步（数据安全）
3. **Table Editor** 数据整理（对比分析）

---

## ⚙️ 通用设置建议

### 快捷键配置

| 功能 | 推荐快捷键 |
|------|------------|
| 打开日历 | `Ctrl/Cmd + Shift + C` |
| 插入模板 | `Ctrl/Cmd + Shift + T` |
| 打开看板 | `Ctrl/Cmd + Shift + K` |
| AI 面板 | `Ctrl/Cmd + Shift + A` |

### 文件夹结构

```
kaoyan-vault/
├── Templates/          # Templater 模板
├── 01-Records记录/     # 学习记录（Calendar + Periodic Notes）
├── 02-Notes笔记/       # 笔记（Templater + Dataview）
├── 03-Exams真题/       # 真题（Table Editor）
├── 04-Errors错题/      # 错题（Dataview 统计）
└── agent/plugins-guide/  # 本指南
```

---

## 🔧 故障排除

### 插件不工作

1. 检查插件是否启用
2. 重启 Obsidian
3. 检查设置是否正确

### 快捷键冲突

1. 进入设置 → Hotkeys
2. 搜索冲突的快捷键
3. 修改或禁用冲突项

### 性能问题

1. 禁用不常用的插件
2. 减少 Dataview 查询频率
3. 优化 CSS 样式

### Periodic Notes 与 Calendar 冲突

1. 确认两者都已启用
2. 在 Periodic Notes 中配置路径和模板
3. 禁用内置的 Daily Notes 插件
4. 统一使用 Periodic Notes 管理周期笔记

---

## 📚 相关资源

- [Obsidian 官方文档](https://help.obsidian.md/)
- [Obsidian 社区插件](https://obsidian.md/plugins)
- [Obsidian 中文社区](https://pkmer.cn/)

---

> 📅 **最后更新**：2025-08-20
> 
> 💡 如有疑问，可查阅各插件的详细文档
