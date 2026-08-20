---
tags:
  - knowledge知识
  - <% await tp.system.suggester(
      ["theory设计理论", "practice设计实践", "ds数据结构", "math数学", "politics政治", "english英语"],
      ["theory设计理论", "practice设计实践", "ds数据结构", "math数学", "politics政治", "english英语"]
    ) %>
aliases:
  - "知识：<% await tp.system.prompt("请输入知识卡片标题") %>"
created: "<% tp.date.now("YYYY-MM-DD") %>"
updated: "<% tp.date.now("YYYY-MM-DD") %>"
status: 待复习
priority:
source:
type: 知识
subject: "<% await tp.system.suggester(
    ["设计理论", "设计实践", "数据结构", "数学", "政治", "英语"],
    ["设计理论", "设计实践", "数据结构", "数学", "政治", "英语"]
  ) %>"
category: "<% await tp.system.suggester(
    ["概念", "原理", "方法", "技巧", "公式", "定理"],
    ["概念", "原理", "方法", "技巧", "公式", "定理"]
  ) %>"
mastery: 了解
---

# 🧠 <% await tp.system.prompt("请输入知识卡片标题") %>

## 📖 核心内容
> 

## 🎯 关键要点
1. 
2. 
3. 

## 💡 理解记忆
### 通俗解释


### 记忆技巧


### 类比


## 🔗 关联知识
- 前置知识：[[]]
- 相关概念：[[]]
- 应用场景：[[]]

## ❓ 常见问题
1. **Q**: 
   **A**: 

## 📚 参考资料
- 

---

## 📅 复习记录
| 日期 | 掌握程度 | 备注 |
|------|----------|------|
| <% tp.date.now("YYYY-MM-DD") %> | 了解 | |
