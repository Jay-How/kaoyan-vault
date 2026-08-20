---
tags:
  - guide
aliases:
  - "使用指南"
created: "2025-08-20"
updated: "2025-08-20"
---

# 📚 考研 Obsidian 库使用指南

## 🎯 目标

清华大学深圳国际研究生院 - IMDT（互动媒体设计与技术）
- **考试时间**：2026年12月
- **专业代码**：843

---

## 📁 文件夹结构（中英文结合）

```
Obsidian库/
├── 00-Inbox收件箱/        # 快速收集：临时想法、未整理内容
│
├── 01-Plans计划/          # 时间管理
│   ├── Daily日常/         # 日计划
│   ├── Weekly周度/        # 周计划
│   ├── Monthly月度/       # 月计划
│   └── Yearly年度/        # 年计划
│
├── 02-Notes笔记/          # 核心知识
│   ├── Theory设计理论/
│   ├── Practice设计实践/
│   ├── DS数据结构/
│   ├── Math数学/
│   ├── Politics政治/
│   └── English英语/
│
├── 03-Exams真题/          # 真题研究
│   ├── 843Papers/
│   └── Analysis解析/
│
├── 04-Errors错题/         # 薄弱追踪
│   ├── Design设计/
│   └── Common公共课/
│
├── 05-Experience经验帖/   # 学长智慧
│
├── 06-Resources资源/      # 资源索引
│
├── 07-Interview复试/      # 后期准备
│
├── Templates/             # 模板库（9个）
├── Attachments/           # 附件（33个文件）
├── agent.md               # Agent配置
└── README.md              # 本文件
```

---

## 🚀 快速开始

### 1️⃣ 配置模板
- 设置 → 核心插件 → 模板
- 模板文件夹位置：`Templates`

### 2️⃣ 创建今日计划
- 快捷键：`Cmd/Ctrl + N` 新建笔记
- 输入 `/` 调用模板
- 选择 `daily-plan.md`

### 3️⃣ 记录学习笔记
- 使用 `note.md` 模板
- 记得打标签：`#theory设计理论` 等
- 用 `[[]]` 双向链接关联知识点

---

## 🏷️ 标签规范（中英文结合）

### 科目标签
| 标签 | 说明 |
|------|------|
| `#theory设计理论` | 设计理论 |
| `#practice设计实践` | 设计实践 |
| `#ds数据结构` | 数据结构 |
| `#math数学` | 数学 |
| `#politics政治` | 政治 |
| `#english英语` | 英语 |

### 类型标签
| 标签 | 说明 |
|------|------|
| `#plan/daily` | 日计划 |
| `#plan/weekly` | 周计划 |
| `#plan/monthly` | 月计划 |
| `#plan/yearly` | 年计划 |
| `#note/{科目}` | 学习笔记 |
| `#error/{科目}` | 错题 |
| `#knowledge/{科目}` | 知识卡片 |
| `#experience` | 经验帖 |
| `#resource` | 资源 |

---

## 📋 模板列表

| 模板文件 | 用途 | Frontmatter Tags |
|----------|------|------------------|
| `daily-plan.md` | 日计划 | `#plan/daily` |
| `weekly-plan.md` | 周计划 | `#plan/weekly` |
| `monthly-plan.md` | 月计划 | `#plan/monthly` |
| `yearly-plan.md` | 年计划 | `#plan/yearly` |
| `note.md` | 学习笔记 | `#note/{科目}` |
| `error.md` | 错题记录 | `#error/{科目}` |
| `knowledge.md` | 知识卡片 | `#knowledge/{科目}` |
| `experience.md` | 经验帖 | `#experience` |
| `resource.md` | 资源索引 | `#resource` |

---

## 📝 Frontmatter 规范

每个模板都包含标准的 YAML frontmatter：

```yaml
---
tags:
  - type/subject
aliases:
  - "别名"
created: "YYYY-MM-DD"
updated: "YYYY-MM-DD"
status: in-progress
---
```

### Status 值
- `in-progress` - 进行中
- `to-review` - 待复习
- `to-read` - 待阅读
- `done` - 已完成
- `archived` - 已归档

---

## 🔗 双向链接

### 基本语法
```markdown
[[笔记名称]]          # 链接到笔记
[[笔记名称|显示文字]]  # 自定义显示文字
[[笔记名称#标题]]     # 链接到特定标题
```

### 应用场景
- 经验帖 → 知识点：`[[设计理论-色彩搭配]]`
- 错题 → 知识点：`[[数据结构-二叉树]]`
- 笔记 → 笔记：`[[前置知识]]`

---

## 📊 Dataview 查询

### 查看待复习内容
```dataview
TABLE subject, mastery, last reviewed
FROM #knowledge
WHERE status = "to-review"
SORT mastery ASC
```

### 查看错题统计
```dataview
TABLE subject, error-type, mastered
FROM #error
WHERE mastered = false
SORT subject ASC
```

---

## 📎 附件使用

### 路径
所有附件存放在 `Attachments/` 文件夹，按类别分类。

### 嵌入附件
```markdown
![[文件名.pdf]]        # 嵌入PDF
![[图片.png]]          # 嵌入图片
```

### 查看索引
- 打开 `Attachments/附件索引.md` 查看所有附件

---

## ✨ 使用技巧

1. **每天先写日计划** - 明确今日目标
2. **学完就记笔记** - 趁热打铁
3. **每周做周复盘** - 总结问题
4. **及时记录错题** - 错过的题不能再错
5. **定期复习知识卡片** - 间隔重复

---

## 🔧 推荐插件

1. **Dataview** - 数据查询和统计
2. **Calendar** - 日历视图
3. **Templater** - 高级模板
4. **Kanban** - 看板视图
5. **Excalidraw** - 手绘笔记

---

## 📚 关键资源

### 核心文件
- ⭐ `Attachments/官方文件/843 互联网+创新设计专业基础综合考纲.pdf`
- ⭐ `Attachments/真题解析/843真题参考答案2020-2025.pdf`
- ⭐ `Attachments/经验帖/IMDT备考指南.pdf`
- ⭐ `Attachments/经验帖/忆南_IMDT初试百科全书.pdf`

### 索引文件
- `Attachments/附件索引.md` - 附件总索引
- `05-Experience经验帖/` - 经验帖索引
- `06-Resources资源/` - 资源索引

---

## ⚠️ 注意事项

1. **不要过度优化系统** - 工具是为学习服务的
2. **保持一致性** - 使用模板，统一标签
3. **定期复习** - 利用间隔重复原理
4. **及时记录** - 错题和笔记要及时整理

---

> 💡 **记住**：工具是为学习服务的，不要过度优化系统而忽略了真正的学习！
> 
> 祝考研顺利，成功上岸！🎉

