---
tags:
  - resource资源
aliases:
  - "资源：<% await tp.system.prompt("请输入资源标题") %>"
created: "<% tp.date.now("YYYY-MM-DD") %>"
updated: "<% tp.date.now("YYYY-MM-DD") %>"
status: 待处理
resource-type: "<% await tp.system.suggester(
    ["考纲", "真题", "笔记", "课件", "经验帖", "视频", "其他"],
    ["考纲", "真题", "笔记", "课件", "经验帖", "视频", "其他"]
  ) %>"
subject: "<% await tp.system.suggester(
    ["设计理论", "设计实践", "数据结构", "数学", "政治", "英语", "综合", "其他"],
    ["设计理论", "设计实践", "数据结构", "数学", "政治", "英语", "综合", "其他"]
  ) %>"
source: "<% await tp.system.prompt("请输入来源渠道（如：官网/学长/网络）") %>"
type: 资源
---

# 📚 <% await tp.system.prompt("请输入资源标题") %>

## 📋 基本信息
- **文件名**：<% await tp.system.prompt("请输入原始文件名") %>
- **格式**：<% await tp.system.suggester(["PDF", "DOCX", "MP4", "PNG", "其他"], ["PDF", "DOCX", "MP4", "PNG", "其他"]) %>
- **大小**：<% await tp.system.prompt("请输入文件大小") %>
- **位置**：`Attachments/<% await tp.system.prompt("请输入子文件夹") %>/<% await tp.system.prompt("请输入文件名") %>`

## 📖 内容摘要
> （简要描述资源内容）

## 🎯 价值评估
- [ ] 核心必备
- [ ] 重要参考
- [ ] 补充材料
- [ ] 待评估

## 📝 使用计划
> （计划如何使用这个资源）

## 🔗 相关资源
- [[]]

## ⭐ 评分
| 维度 | 评分(1-5) | 备注 |
|------|-----------|------|
| 质量 |  |  |
| 实用性 |  |  |
| 时效性 |  |  |
