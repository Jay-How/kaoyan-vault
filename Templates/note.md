---
tags:
  - note笔记
  - <% await tp.system.suggester(
      ["politics政治", "english英语", "math数学", "ds数据结构", "hardware计算机硬件", "network网络技术", "ml机器学习", "theory设计理论", "practice设计实践"],
      ["politics政治", "english英语", "math数学", "ds数据结构", "hardware计算机硬件", "network网络技术", "ml机器学习", "theory设计理论", "practice设计实践"]
    ) %>
aliases:
  - "<% await tp.system.prompt("请输入笔记标题") %>"
created: "<% tp.date.now("YYYY-MM-DD") %>"
updated: "<% tp.date.now("YYYY-MM-DD") %>"
status: 进行中
priority:
source:
type: 笔记
subject: "<% await tp.system.suggester(
    ["政治", "英语", "数学", "数据结构", "计算机硬件", "网络技术", "机器学习", "设计理论", "设计实践"],
    ["政治", "英语", "数学", "数据结构", "计算机硬件", "网络技术", "机器学习", "设计理论", "设计实践"]
  ) %>"
chapter: "<% await tp.system.prompt("请输入章节") %>"
---

# <% await tp.system.prompt("请输入笔记标题") %>

## 核心概念

### 定义


### 要点
1. 
2. 
3. 

### 重要公式/原理
```
```

## 理解与反思
> 

## 关联知识
- 相关概念：[[]]
- 前置知识：[[]]
- 延伸阅读：[[]]

## 开放问题
- [ ] 

## 参考资料
- 

---

## 复习记录
| 日期 | 效果 | 备注 |
|------|------|------|
| <% tp.date.now("YYYY-MM-DD") %> | 初次记录 | |
