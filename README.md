# KnowFlow Secretary 🌿

> 你的 AI 学习成长秘书 — 让碎片化学习变得可追踪、可量化、有反馈

**Demo 体验：** [https://knowflow-secretary.pages.dev](https://knowflow-secretary.pages.dev)

---

## ✨ 功能一览

| 模块 | 功能 |
|------|------|
| 🏠 **概览** | 学习热力图 · 连续打卡统计 · 学习方向管理 · AI 学习成果看板 |
| ✅ **每日打卡** | 记录每天学了什么、学了多久，支持多次打卡 |
| 🌐 **信息社区** | AI 日报（每日自动生成）· GitHub 热门项目推荐 · 常用网址书签 |
| 🃏 **知识卡片** | 按领域分区管理，支持搜索、折叠、参考链接 |
| 🎨 **作品集** | 项目展示 + 阶段记录（自定义字段），记录每个项目的完整历程 |
| 💡 **灵感箱** | 灵感 → 进行中 → 已实现，追踪想法的落地过程 |
| 🏔️ **心灵手账** | 每日语录 · 今日提问 · 日记 / 自我发现 · 一键翻译英文 |

---

## 🛠️ 技术栈

- **单 HTML 文件**，零构建依赖，即开即用
- **Supabase**（可选）— 云端数据存储，多设备同步
- **智谱 GLM API**（可选）— AI 学习成果分析 · 自动翻译
- **GitHub Actions + 智谱 API** — AI 日报每日自动生成
- **Cloudflare Pages** — 一键部署，国内可访问

---

## 🚀 快速开始

### 1. 最简方式（纯本地，30 秒）

直接下载 `index.html`，用浏览器打开即可使用。数据保存在浏览器本地。

### 2. 部署到 Cloudflare Pages（推荐）

1. Fork 本仓库
2. 登录 [Cloudflare](https://dash.cloudflare.com) → Workers & Pages → Create → Pages
3. 连接你的 GitHub，选择 Fork 的仓库
4. Build command 和 output directory 留空
5. 部署完成 ✅

### 3. 启用 AI 功能（可选）

1. 注册 [智谱开放平台](https://open.bigmodel.cn)，获取免费 API Key
2. 点击页面左上角 Logo → 设置面板 → 填入 API Key
3. 即可使用 AI 学习看板、自动翻译等功能

### 4. 启用云端同步（可选）

1. 注册 [Supabase](https://supabase.com)，新建项目
2. 在 SQL Editor 中执行 `supabase-setup.sql`
3. 将 Supabase URL 和 Anon Key 填入 `index.html` 的 CONFIG 区域
4. 数据自动云端同步，多设备可用

---

## 📁 文件说明

```
index.html              ← 完整应用（单文件，含 Demo 示例数据）
supabase-setup.sql      ← Supabase 建表脚本（启用云端同步时使用）
```

---

## 🎨 个性化

点击左上角 **Logo** 即可修改：
- 👤 你的名字
- 🤖 AI 秘书的名字
- 🔑 智谱 API Key

所有设置保存在浏览器本地，不会上传。

---

## 📄 开源协议

MIT License — 自由使用、修改、分发。

---

> *没有宏大的目标，你要做的只是每天按时出摊* 🌿
