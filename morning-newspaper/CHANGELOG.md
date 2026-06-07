# Changelog

## README 快速开始优化

- 新增"前置条件"段，列出 Python 版本、OpenClaw、GitHub Token、IMAP 授权码的依赖关系和可选性
- "快速开始"拆分为三步递进：环境准备 → 单步采集验证 → 完整流水线
- 第二步增加 `--skip-tavily` 采集和 `enrich_content.py` 正文抓取，让学生在不依赖 OpenClaw 的情况下看到真实数据
- 第三步改用 `run_daily_pipeline.py` 替代深层嵌套的 skill 入口脚本
- 明确说明三个 LLM 回填文件缺失时的报错行为，不再用"停住"这种模糊描述

## 项目重命名

将遗留的 `v2` / `Morning-Newspaper-Manager` 命名统一为 `morning-newspaper`。

### 目录与文件重命名

| 原始路径 | 变更后路径 |
|---|---|
| `src/morning_v2/` | `src/morning_newspaper/` |
| `skills/.../scripts/run_morning_report_v2.py` | `skills/.../scripts/run_morning_report.py` |

### Python 代码

- 所有 `from morning_v2.xxx import` → `from morning_newspaper.xxx import`（涉及 19 个文件）
- `USER_AGENT` 从 `"Morning-Newspaper-Manager-v2/0.1"` → `"Morning-Newspaper-Assistant/1.0"`（`src/morning_newspaper/common.py`）
- `scripts/collect_raw.py` argparse description 和报告标题去掉 `v2`
- `scripts/enrich_content.py` 报告标题去掉 `v2`

### 文档与配置

- `config/sources.yaml` — `paused_sources` 注释去掉 `v2`
- `skills/.../SKILL.md` — 移除 `Morning-Newspaper-Manager` 相关描述
- `scripts/serve_dashboard_8510.sh` — 移除 kill 旧 Manager 进程的行

## 邮箱配置泛化

将邮箱从限定 163 调整为支持任意 IMAP/POP3 邮箱（以 163 为例）。

- `README.md` — 邮箱配置段说明支持任意 IMAP 邮箱，增加 163/QQ/Gmail/Outlook 服务器地址对照表
- `.env.example` — 注释说明支持多种邮箱，示例地址改为 `your_email@example.com`
- `skills/.../SKILL.md` — 章节标题从 `163 邮箱配置` → `邮箱配置`，说明支持任意 IMAP/POP3 邮箱
- `lesson14-lab.md` — 保持不动（实验手册以 163 为具体操作示例）

## 文档重写

- `docs/source_strategy.md` — 基于 `src/morning_newspaper/collectors/` 实际代码全文重写为信息源策略文档，涵盖三种采集范式的实现细节、配置示例、调度与去重机制、统一数据模型
- `README.md` — 按课程规范全文重写，增加 Dashboard 效果截图

## 新增文件

| 文件 | 说明 |
|---|---|
| `.env.example` | 环境变量模板（邮箱 + GitHub Token） |
| `docs/screenshots/dashboard-demo.png` | 早报 Dashboard 运行效果截图 |
| `CHANGELOG.md` | 本文件 |

## 删除文件

| 文件 | 原因 |
|---|---|
| `docs/rewrite_plan.md` | 内部开发规划文档，不属于课程交付物 |
| `docs/pipeline_rebuild_plan.md` | 内部开发规划文档，不属于课程交付物 |
| `run_dashboard.cmd` | Windows 批处理脚本，课程以 Linux 服务器为主 |

## .gitignore 完善

补齐 `.env` / `.env.local` / `.venv/` / `.idea/` / `.vscode/` 等条目。

## requirements.txt 补全

补充 `streamlit>=1.30`（`dashboard_app.py` 的依赖）。
