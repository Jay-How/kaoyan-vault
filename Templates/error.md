---
tags:
  - error错题
  - "<% await tp.system.suggester(["politics政治", "english英语", "math数学", "ds数据结构", "hardware计算机硬件", "network网络技术", "ml机器学习", "theory设计理论", "practice设计实践"], ["politics政治", "english英语", "math数学", "ds数据结构", "hardware计算机硬件", "network网络技术", "ml机器学习", "theory设计理论", "practice设计实践"]) %>"
aliases:
  - "错题：<% await tp.system.prompt("请输入错题标题") %>"
created: "<% tp.date.now("YYYY-MM-DD") %>"
updated: "<% tp.date.now("YYYY-MM-DD") %>"
status: 待复习
priority:
source: "<% await tp.system.prompt("请输入题目来源（如：真题/习题/模拟题）") %>"
type: 错题
subject: "<% await tp.system.suggester(["政治", "英语", "数学", "数据结构", "计算机硬件", "网络技术", "机器学习", "数理基础", "设计理论", "设计实践", "843专业课", "专业课", "综合", "教资", "其他"], ["政治", "英语", "数学", "数据结构", "计算机硬件", "网络技术", "机器学习", "数理基础", "设计理论", "设计实践", "843专业课", "专业课", "综合", "教资", "其他"]) %>"
chapter: "<% await tp.system.prompt("请输入所属章节") %>"
difficulty: "<% await tp.system.suggester(["简单", "中等", "困难"], ["简单", "中等", "困难"]) %>"
error-type: "<% await tp.system.suggester(["计算错误", "概念混淆", "粗心大意", "知识盲区", "审题不清", "其他"], ["计算错误", "概念混淆", "粗心大意", "知识盲区", "审题不清", "其他"]) %>"
---

# <% await tp.system.prompt("请输入错题标题") %>

> [!question] 题目
> <% await tp.system.prompt("请粘贴题目内容") %>

> [!failure] 我的错误答案
> ```
> <% await tp.system.prompt("请输入你的错误答案") %>
> ```

> [!success] 正确答案
> ```
> <% await tp.system.prompt("请输入正确答案") %>
> ```

## 错误分析

### 错误原因

<% await tp.system.prompt("请分析错误原因") %>

### 正确思路

<% await tp.system.prompt("请写出正确解题思路") %>

### 知识点总结

<% await tp.system.prompt("请总结相关知识点") %>

## 相关笔记

- 

## 复习记录

| 日期 | 掌握程度 | 备注 |
|------|----------|------|
| <% tp.date.now("YYYY-MM-DD") %> | 初次记录 | |
