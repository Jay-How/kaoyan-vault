---
tags:
  - plugin-guide
  - git
aliases:
  - "Obsidian Git使用指南"
created: "2025-08-20"
updated: "2025-08-20"
status: done
---

# 🔄 Obsidian Git 版本控制

> 使用 Git 进行笔记版本控制、备份和多端同步

---

## 📋 插件简介

| 项目 | 说明 |
|------|------|
| **插件名** | Obsidian Git |
| **功能** | Git 版本控制、自动备份、多端同步 |
| **适用场景** | 数据备份、版本管理、多设备同步 |

---

## ⚙️ 基础配置

### 1. 初始化 Git 仓库

**方法一：使用插件**
1. 打开命令面板 `Ctrl/Cmd + P`
2. 输入 `Obsidian Git: Initialize Git`
3. 确认初始化

**方法二：手动初始化**
```bash
cd /path/to/your/vault
git init
```

### 2. 推荐设置

| 设置项 | 推荐值 | 说明 |
|--------|--------|------|
| Auto backup interval | 30 | 自动备份间隔（分钟） |
| Auto pull interval | 10 | 自动拉取间隔（分钟） |
| Commit message | `vault backup: {{date}}` | 提交信息格式 |
| Pull updates on startup | ✅ 启用 | 启动时拉取更新 |
| Push on backup | ✅ 启用 | 备份时推送 |
| Show status bar | ✅ 启用 | 显示状态栏 |

---

## 🎯 基础使用

### 1. 常用命令

| 命令 | 快捷键 | 功能 |
|------|--------|------|
| `Obsidian Git: Open source control view` | - | 打开源代码管理视图 |
| `Obsidian Git: Pull` | - | 拉取远程更新 |
| `Obsidian Git: Push` | - | 推送本地更改 |
| `Obsidian Git: Commit all changes` | - | 提交所有更改 |
| `Obsidian Git: Create backup` | - | 创建备份 |
| `Obsidian Git: List changed files` | - | 查看更改文件 |

### 2. 工作流程

```
修改笔记 → 自动检测更改 → 提交更改 → 推送到远程
```

---

## 📊 考研应用场景

### 1. 自动备份学习进度

- 每30分钟自动备份
- 防止数据丢失
- 保留完整学习历史

### 2. 多设备同步

```
电脑A（家里）←→ GitHub/Gitee ←→ 电脑B（图书馆）
```

### 3. 版本回溯

- 查看笔记修改历史
- 恢复误删内容
- 对比不同版本

---

## 🔧 高级配置

### 1. 配置远程仓库

**使用 GitHub**
```bash
git remote add origin https://github.com/username/kaoyan-vault.git
git branch -M main
git push -u origin main
```

**使用 Gitee（国内更快）**
```bash
git remote add origin https://gitee.com/username/kaoyan-vault.git
git branch -M main
git push -u origin main
```

### 2. 配置 .gitignore

创建 `.gitignore` 文件排除不需要同步的内容：

```gitignore
# Obsidian 配置
.obsidian/workspace.json
.obsidian/workspace-mobile.json

# 临时文件
*.tmp
*.bak
.DS_Store

# 大型附件（可选）
# Attachments/视频/
# Attachments/*.mp4
```

### 3. 自动提交信息模板

在设置中使用变量：

| 变量 | 说明 | 示例 |
|------|------|------|
| `{{date}}` | 当前日期 | 2025-08-20 |
| `{{files}}` | 更改文件数 | 3 files |
| `{{hostname}}` | 设备名 | MacBook |

**推荐格式**：
```
vault backup: {{date}} - {{files}} changed
```

---

## 📱 移动端同步

### iOS 设置

1. 安装 **Working Copy**（Git 客户端）
2. 在 Working Copy 中克隆仓库
3. 在 Obsidian Mobile 中设置仓库路径

### Android 设置

1. 安装 **Termux**
2. 在 Termux 中配置 Git
3. 使用 Obsidian Git 插件同步

---

## 🔐 安全配置

### 1. 使用 SSH 密钥

```bash
# 生成 SSH 密钥
ssh-keygen -t ed25519 -C "your_email@example.com"

# 添加到 SSH 代理
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

# 将公钥添加到 GitHub/Gitee
cat ~/.ssh/id_ed25519.pub
```

### 2. 使用 Personal Access Token

1. 在 GitHub/Gitee 生成 Token
2. 使用 Token 作为密码推送

---

## 📊 状态栏说明

插件会在底部状态栏显示：

| 状态 | 说明 |
|------|------|
| `✓ 0` | 无更改 |
| `↑ 3` | 3个文件待推送 |
| `↓ 2` | 2个文件待拉取 |
| `⟳` | 同步中 |

---

## ⚠️ 常见问题

### 1. 推送失败

**原因**：远程仓库有本地没有的更新

**解决**：
```bash
git pull --rebase origin main
git push origin main
```

### 2. 冲突处理

**手动解决**：
1. 查看冲突文件
2. 编辑冲突标记 `<<<<<<<` `=======` `>>>>>>>`
3. 保留正确内容
4. 提交解决

### 3. 大文件问题

**使用 Git LFS**：
```bash
git lfs install
git lfs track "*.pdf"
git lfs track "*.mp4"
git add .gitattributes
```

---

## 📖 相关资源

- [Obsidian Git 插件文档](https://github.com/denolehov/obsidian-git)
- [Git 官方文档](https://git-scm.com/doc)

---

> 📅 **最后更新**：2025-08-20
