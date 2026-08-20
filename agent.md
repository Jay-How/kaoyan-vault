---
tags:
  - config/agent
aliases:
  - "考研助手"
  - "备考配置"
created: "2025-08-20"
updated: "2025-08-20"
status: active
---

# 🎓 考研备考助手

> 清华大学深圳国际研究生院 - IMDT（互动媒体设计与技术）843 考研备考知识库

---

## 🚀 新会话指引

> ⚠️ **重要**：如果你是第一次接触这个项目，**必须按顺序阅读以下文档**：

### 必读文档（按顺序）

| 顺序 | 文档 | 说明 |
|------|------|------|
| 1 | **本文件（agent.md）** | 了解项目背景和目录结构 |
| 2 | [[agent/标签规范文档\|标签规范文档]] | **必须阅读** - 所有笔记的标签和属性规范 |
| 3 | [[agent/plugins-guide/README\|插件指南索引]] | 了解可用插件及其用途 |

### 关键规则速查

**标签规则**（详见标签规范文档）：
- 标签用于分类：`#note/科目`、`#error/科目`、`#knowledge/科目`
- 属性用于状态：`status: 进行中`、`priority: 高`
- 示例：`tags: [note/设计理论]`，`status: 进行中`，`priority: 高`

**Git 规则**（本文件「Git 提交规范」章节）：
- 每次提交前**必须**将提交信息提交给用户审阅
- 提交信息格式：`<type>(<scope>): <subject>`

**模板规则**：
- 创建笔记使用 Templates/ 文件夹中的模板
- 学习记录使用 daily-record.md（计划+执行+复盘）

| 项目 | 内容 |
|------|------|
| **目标院校** | 清华大学深圳国际研究生院 |
| **报考专业** | 电子信息（互动媒体设计与技术 IMDT） |
| **专业代码** | 843 |
| **考试时间** | 2026年12月 |
| **备考周期** | 2025年8月 ~ 2026年12月 |

---

## 📂 目录结构

```
kaoyan-vault/
├── 00-Inbox收件箱/        # 📥 快速收集
├── 01-Records记录/        # 📝 计划+执行+复盘
│   ├── Daily每日/
│   ├── Weekly每周/
│   ├── Monthly每月/
│   └── Yearly年度/
├── 02-Notes笔记/          # 📚 核心知识（6个科目）
├── 03-Exams真题/          # 📝 真题研究
├── 04-Errors错题/         # ❌ 薄弱追踪
├── 05-Experience经验帖/   # 🎓 上岸经验
├── 06-Resources资源/      # 📦 资源索引
├── 07-Interview复试/      # 🎤 复试准备
├── Templates/             # 📋 模板库
├── Attachments/           # 📎 附件
└── agent/                 # 🤖 规范与指南
```

---

## 📖 索引：规范与指南

### 🏷️ 标签与属性

| 文档 | 说明 |
|------|------|
| [[agent/标签规范文档\|标签规范]] | 标签结构、属性规范、使用示例 |

**核心规则**：
- **标签**：管理内容类型 + 科目（如 `#note/设计理论`）
- **属性**：管理状态、优先级、来源（如 `status: 进行中`）

---

### 🔌 插件指南

| 文档 | 插件 | 用途 |
|------|------|------|
| [[agent/plugins-guide/Templater 高级模板引擎\|Templater]] | 高级模板 | 智能模板、自动填充 |
| [[agent/plugins-guide/Dataview 数据查询\|Dataview]] | 数据查询 | 统计报表、进度追踪 |
| [[agent/plugins-guide/Calendar 日历视图\|Calendar]] | 日历 | 日记管理、时间可视化 |
| [[agent/plugins-guide/Periodic Notes 周期笔记\|Periodic Notes]] | 周期笔记 | 日/周/月/年记录 |
| [[agent/plugins-guide/Obsidian Git 版本控制\|Obsidian Git]] | Git | 数据备份、多端同步 |
| [[agent/plugins-guide/Obsidian Kanban 看板视图\|Kanban]] | 看板 | 任务管理、计划追踪 |
| [[agent/plugins-guide/Table Editor 表格编辑器\|Table Editor]] | 表格编辑 | 数据整理、对比分析 |
| [[agent/plugins-guide/Style Settings 样式设置\|Style Settings]] | 样式设置 | 个性化界面 |
| [[agent/plugins-guide/RealClaudian AI助手\|RealClaudian]] | AI 助手 | 知识问答、内容生成 |

> 📚 索引：[[agent/plugins-guide/README|插件指南索引]]

---

## 🏷️ 标签快速参考

### 标签格式

```
#英文中文（直接连接，无分隔符）
```

搜 `#note` 或 `#笔记` 都能找到 `#note笔记`

### 类型标签（必选）

| 标签 | 搜英文 | 搜中文 |
|------|--------|--------|
| `#note笔记` | `#note` | `#笔记` |
| `#error错题` | `#error` | `#错题` |
| `#knowledge知识` | `#knowledge` | `#知识` |
| `#record记录` | `#record` | `#记录` |
| `#exam真题` | `#exam` | `#真题` |
| `#experience经验` | `#experience` | `#经验` |
| `#resource资源` | `#resource` | `#资源` |

### 科目标签（按需）

| 标签 | 搜英文 | 搜中文 |
|------|--------|--------|
| `#theory设计理论` | `#theory` | `#设计理论` |
| `#practice设计实践` | `#practice` | `#设计实践` |
| `#ds数据结构` | `#ds` | `#数据结构` |
| `#math数学` | `#math` | `#数学` |
| `#politics政治` | `#politics` | `#政治` |
| `#english英语` | `#english` | `#英语` |

### 属性（可选）

```yaml
status: 进行中/待复习/待回顾/已掌握/已归档
priority: 高/中/低
source: 真题/教材/网课/经验帖
type: 笔记/错题/知识/记录/真题/经验/资源
subject: 设计理论/设计实践/数据结构/数学/政治/英语
```

---

## 📋 模板清单

> 所有模板使用 Templater 高级语法，插入时会弹窗提示输入

| 模板 | 文件 | 用途 | 弹窗输入 |
|------|------|------|----------|
| 每日记录 | `Templates/daily-record.md` | 计划+执行+复盘 | 科目选择 |
| 每周记录 | `Templates/weekly-record.md` | 周复盘+下周计划 | 自动日期 |
| 每月记录 | `Templates/monthly-record.md` | 月复盘+下月计划 | 自动日期 |
| 年度记录 | `Templates/yearly-record.md` | 年度规划+回顾 | 自动日期 |
| 学习笔记 | `Templates/note.md` | 记录学习内容 | 标题、科目、章节 |
| 错题记录 | `Templates/error.md` | 记录错题分析 | 标题、科目、来源、错误类型 |
| 知识卡片 | `Templates/knowledge.md` | 提炼知识要点 | 标题、科目、分类 |
| 经验帖 | `Templates/experience.md` | 索引经验帖 | 标题、作者、年份、结果 |
| 资源索引 | `Templates/resource.md` | 索引学习资源 | 标题、类型、科目、来源 |

---

## 📊 常用查询

### 待复习内容

```dataview
TABLE file.name, tags, priority
WHERE status = "待复习"
SORT priority DESC
```

### 错题统计

```dataview
TABLE length(rows) AS "数量"
FROM #error
WHERE mastered != true
GROUP BY subject
```

### 学习进度

```dataview
TABLE length(rows) AS "笔记数"
FROM #note
GROUP BY subject
```

---

## 📚 核心资源

| 资料 | 位置 |
|------|------|
| 843 考试大纲 | `Attachments/官方文件/843 互联网+创新设计专业基础综合考纲.pdf` |
| 真题参考答案 | `Attachments/真题解析/843真题参考答案2020-2025.pdf` |
| IMDT 备考指南 | `Attachments/经验帖/IMDT备考指南.pdf` |
| 忆南百科全书 | `Attachments/经验帖/忆南_IMDT初试百科全书.pdf` |

---

## 🔄 工作流

```
晨间 → 填写今日计划（daily-record.md）
  ↓
学习 → 记录笔记（note.md）
  ↓
练习 → 记录错题（error.md）
  ↓
晚间 → 填写执行记录和复盘
```

---

## 📌 使用原则

1. **工具为学习服务** — 不要过度优化系统
2. **保持一致性** — 使用模板，遵循标签规范
3. **及时记录** — 错题和笔记要及时整理
4. **定期复盘** — 利用周期笔记复盘总结

---

## 🔄 变更管理规范

> ⚠️ **重要**：重构任何组件后，必须更新所有相关配置！

### 变更检查清单

当修改标签、模板、规范等组件时，按以下清单逐一检查：

#### 标签变更

- [ ] 更新 `agent/标签规范文档.md`
- [ ] 更新 `agent.md` 标签速查部分
- [ ] 更新所有模板文件（Templates/*.md）
- [ ] 检查是否有现有笔记需要迁移

#### 模板变更

- [ ] 更新模板文件本身
- [ ] 更新 `agent.md` 模板清单
- [ ] 检查模板中的标签是否符合规范
- [ ] 检查模板中的属性是否完整

#### 规范文档变更

- [ ] 更新规范文档本身
- [ ] 更新 `agent.md` 中的索引链接
- [ ] 更新 `agent.md` 中的速查内容
- [ ] 检查是否有交叉引用需要更新

### 变更示例

**场景**：重构标签格式从 `#note/设计理论` 改为 `#note笔记`

**检查清单**：
1. ✅ 更新 `agent/标签规范文档.md`
2. ✅ 更新 `agent.md` 标签速查
3. ✅ 更新 `Templates/note.md`
4. ✅ 更新 `Templates/error.md`
5. ✅ 更新 `Templates/knowledge.md`
6. ✅ 更新 `Templates/experience.md`
7. ✅ 更新 `Templates/resource.md`
8. ✅ 更新 `Templates/daily-record.md`
9. ✅ 更新 `Templates/weekly-record.md`
10. ✅ 更新 `Templates/monthly-record.md`
11. ✅ 更新 `Templates/yearly-record.md`
12. ✅ 更新插件指南中的相关引用

### 经验教训

- **不要只改一处**：标签规范改了，模板也要改
- **不要忘记索引**：agent.md 中的速查内容要同步更新
- **不要忘记插件指南**：插件指南中可能引用了旧标签
- **检查交叉引用**：其他文档可能引用了被修改的内容

---

## 🔀 Git 提交规范

### 提交流程

⚠️ **重要：每次 Git 提交前，必须将提交信息提交给用户审阅，确认后再执行 commit！**

### 提交信息格式

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

---

## 📖 相关文档

| 文档 | 说明 |
|------|------|
| [[README\|使用指南]] | 知识库详细使用说明 |
| [[agent/标签规范文档\|标签规范]] | 标签与属性规范 |
| [[agent/plugins-guide/README\|插件指南]] | 社区插件使用指南 |

---

> 📅 **最后更新**：2025-08-20
> 
> 🔀 **Git 规范**：提交前需用户审阅提交信息
> 
> 🎯 **目标**：2026年12月考研成功上岸！🎉
