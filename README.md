# Agent Skills Collection

个人维护的 **Agent Skills** 集合——每个 skill 是一个带 `SKILL.md` 的目录，给 AI Agent 提供领域知识与工作流。

> **通用格式，不限于某一 IDE。**  
> 本仓库遵循常见的 Agent Skill 约定（YAML frontmatter + Markdown 指令）。  
> [Cursor](https://cursor.com/docs/context/skills) 可直接使用；其他支持相同或类似 Skill 协议的 Agent / IDE，把目录拷到对应 skills 路径即可。

## Skills 索引

| Skill | 说明 | 触发示例 |
|-------|------|----------|
| [write-ama-letter](skills/write-ama-letter/) | 将现代内容改写为《给阿嬷的情书》侨批格式书信 | `跟对象说今晚加班` / `@write-ama-letter` |

## Skill 是什么

每个 skill 至少包含：

```
skills/<skill-name>/
└── SKILL.md          # 必需：frontmatter (name, description) + 指令正文
```

可选：`reference.md`、`examples.md`、`scripts/`、`README.md`。

Agent 根据 `description` 里的触发词决定是否加载 skill；与具体产品无关，**关键是目录结构和 `SKILL.md` 内容**。

## 安装

### 一键安装（脚本）

**Windows (PowerShell):**

```powershell
git clone https://github.com/yuan-yiming/agent-skills.git
cd agent-skills
.\scripts\install.ps1                      # 默认：Cursor 个人目录
.\scripts\install.ps1 -TargetDir "D:\my-agent\skills"   # 自定义路径
.\scripts\install.ps1 write-ama-letter     # 只装一个
```

**macOS / Linux:**

```bash
git clone https://github.com/yuan-yiming/agent-skills.git
cd agent-skills
./scripts/install.sh
./scripts/install.sh write-ama-letter
TARGET_DIR=~/.cursor/skills ./scripts/install.sh   # 可改环境变量
```

### 各平台常见路径

| 环境 | 个人（全局） | 项目（仓库内） |
|------|-------------|----------------|
| **Cursor** | `~/.cursor/skills/<name>/` | `.cursor/skills/<name>/` |
| **其它 Agent** | 查阅所用工具的 skills 文档 | 项目级 skills 目录（因产品而异） |

不确定时：**手动复制** `skills/<name>/` 到目标 skills 目录最稳妥。

### 手动安装

```powershell
Copy-Item -Recurse skills\write-ama-letter "$env:USERPROFILE\.cursor\skills\write-ama-letter"
```

## 使用（以 Cursor 为例）

安装后重启 Agent 或新开对话，然后：

- `@write-ama-letter`，或
- 在 prompt 里写触发词（如「侨批」「write ama letter」）

其它 Agent 的调用方式（@、slash command 等）以该产品文档为准；**skill 内容本身是通用的**。

## 仓库结构

```
agent-skills/
├── README.md
├── CONTRIBUTING.md
├── skills/
│   ├── _template/
│   └── write-ama-letter/
└── scripts/
    ├── install.ps1
    ├── install.sh
    └── sync-from-local.ps1
```

## 新增 skill

见 [CONTRIBUTING.md](CONTRIBUTING.md)。

## License

MIT — 见 [LICENSE](LICENSE)。
