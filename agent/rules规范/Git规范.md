---
tags:
  - AI-generated人工智能生成
aliases:
  - Git规范
created: 2025-08-21
updated: 2026-08-24
status: done
---

# Git 提交规范

> 本知识库的 Git 提交规范，所有提交必须遵循

---

## 核心规则

**每次 Git 提交前，必须将提交信息提交给用户审阅，确认后再执行 commit！**

---

## 提交信息格式

```
<type>(<scope>): <subject>

<body>
```

### Type 类型

| 类型 | 说明 | 示例 |
|------|------|------|
| `feat` | 新功能 | feat(agent): 添加标签规范文档 |
| `fix` | 修复 | fix(template): 修正标签格式 |
| `docs` | 文档 | docs(readme): 更新使用指南 |
| `style` | 格式 | style(agent): 调整文档结构 |
| `refactor` | 重构 | refactor(tags): 重构标签体系 |
| `chore` | 杂务 | chore: 更新 gitignore |

### Scope 范围

| 范围 | 说明 |
|------|------|
| `agent` | agent 配置和规范 |
| `template` | 模板文件 |
| `note` | 学习笔记 |
| `error` | 错题记录 |
| `record` | 学习记录 |
| `plugin` | 插件指南 |
| `tags` | 标签相关 |
| `notes` | 笔记目录结构 |

---

## 提交流程

```
1. 检查变更内容
   ↓
2. 准备提交信息草稿
   ↓
3. 展示给用户审阅
   ↓
4. 用户确认
   ↓
5. 执行 git commit
```

---

## 提交信息示例

### 好的提交信息

```
refactor(tags): 重构标签系统为中英结合格式

- 标签格式改为 #英文中文（如 #note笔记、#error错题）
- 更新标签规范文档
- 更新所有模板文件标签格式
```

```
fix(periodic-notes): 修复模板路径和 Templater 自动触发配置

- Periodic Notes 模板路径添加 .md 扩展名
- Templater 启用 trigger_on_file_creation
```

### 不好的提交信息

```
update files 太模糊
修改了一些内容 不够具体
fix bug 没有说明修复了什么
```

---

> **最后更新**：2026-08-24