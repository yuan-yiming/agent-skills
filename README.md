# Agent Skills Collection

个人维护的 **Agent Skills** 集合——每个 skill 是一个带 `SKILL.md` 的目录，给 AI Agent 提供领域知识与工作流。

> **通用格式，不限于某一 IDE。**  
> 本仓库遵循 [Agent Skills 开放约定](https://skills.sh/)（YAML frontmatter + Markdown 指令）。  
> 支持 Cursor、Claude Code、GitHub Copilot 等 40+ Agent，通过 [Skills CLI](https://skills.sh/) 一键安装。

## Skills 索引

| Skill | 说明 | 安装 |
|-------|------|------|
| [write-ama-letter](skills/write-ama-letter/) | 将现代内容改写为《给阿嬷的情书》侨批格式书信 | `npx skills add yuan-yiming/agent-skills@write-ama-letter -g -y` |

Browse: [skills.sh](https://skills.sh/) · 搜索：`npx skills find qiaopi`

## 安装（推荐）

使用 [Skills CLI](https://skills.sh/) 安装到用户全局目录（`-g`），适用于 Cursor、Copilot 等：

```bash
# 安装单个 skill
npx skills add yuan-yiming/agent-skills@write-ama-letter -g -y

# 安装本仓库全部 skills
npx skills add yuan-yiming/agent-skills -g -y
```

| 参数 | 说明 |
|------|------|
| `-g` | 安装到 `~/.agents/skills/`（全局，跨 Agent 通用） |
| `-y` | 跳过确认提示 |

安装完成后**重启 Agent 或新开对话**。CLI 会自动处理 Cursor、Claude Code 等工具的 symlink。

### 搜索 skill

```bash
npx skills find ama letter
npx skills find changelog
```

### 更新已安装的 skill

```bash
npx skills update
```

## 备选安装方式

### Git clone + 脚本

适合无法使用 `npx`、或需安装到自定义目录时。

**Windows (PowerShell):**

```powershell
git clone https://github.com/yuan-yiming/agent-skills.git
cd agent-skills
.\scripts\install.ps1 write-ama-letter              # 默认 ~/.cursor/skills
.\scripts\install.ps1 -TargetDir "D:\my-agent\skills" write-ama-letter
```

**macOS / Linux:**

```bash
git clone https://github.com/yuan-yiming/agent-skills.git
cd agent-skills
./scripts/install.sh write-ama-letter
TARGET_DIR=~/.cursor/skills ./scripts/install.sh write-ama-letter
```

### 手动复制

将 `skills/<skill-name>/` 复制到 Agent 的 skills 目录，例如：

- `~/.agents/skills/<name>/`（Skills CLI 默认，跨 Agent）
- `~/.cursor/skills/<name>/`（Cursor 个人）
- `.cursor/skills/<name>/`（项目级）

## 使用（以 Cursor 为例）

- `@write-ama-letter`，或
- 在 prompt 里写触发词（如「侨批」「write ama letter」）

其它 Agent 的调用方式（@、slash command 等）以该产品文档为准。

## Skill 是什么

每个 skill 至少包含：

```
skills/<skill-name>/
└── SKILL.md          # 必需：frontmatter (name, description) + 指令正文
```

可选：`reference.md`、`examples.md`、`scripts/`、`README.md`。

## 仓库结构

```
agent-skills/
├── README.md
├── CONTRIBUTING.md
├── skills/
│   ├── _template/
│   └── write-ama-letter/
└── scripts/              # 备选安装脚本
    ├── install.ps1
    ├── install.sh
    └── sync-from-local.ps1
```

## 新增 skill

见 [CONTRIBUTING.md](CONTRIBUTING.md)。

## License

MIT — 见 [LICENSE](LICENSE)。
