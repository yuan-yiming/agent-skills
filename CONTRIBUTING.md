# 贡献指南

本仓库收录的是 **通用 Agent Skill**，不绑定 Cursor 或其它单一产品。

## 新增一个 skill

1. 复制模板：

   ```powershell
   Copy-Item -Recurse skills\_template skills\my-new-skill
   ```

2. 编辑 `skills/my-new-skill/SKILL.md`：
   - `name`：小写 + 连字符，≤64 字符，仓库内唯一
   - `description`：**第三人称**，写清做什么 + 何时触发（关键词越多，Agent 越容易发现）
   - 正文：简洁，主文件建议 <500 行；细节放 `reference.md`

3. （可选）`skills/my-new-skill/README.md`：简介 + 示例

4. 更新根目录 [README.md](README.md) 索引表

5. 本地验证：

   ```powershell
   .\scripts\install.ps1 my-new-skill
   ```

   push 到 GitHub 后，用 CLI 验证（与用户使用方式一致）：

   ```bash
   npx skills add yuan-yiming/agent-skills@my-new-skill -g -y
   ```

   在 Cursor 里 `@my-new-skill` 试一条 prompt。

## 发布前检查

- [ ] 无 API Key、Cookie、内网地址、私人数据
- [ ] 不依赖某一 IDE 私有 API（除非在 README 里标明「可选增强」）
- [ ] `name` 与目录名一致（建议）
- [ ] 内网 / 公司专用 skill **不要**放进本仓库

## 从本机开发目录同步

在本地 skills 目录迭代（路径因工具而异），确认后再入库：

```powershell
# 示例：从 Cursor 个人 skills 同步
.\scripts\sync-from-local.ps1 write-ama-letter

# 或手动复制
Copy-Item -Recurse "$env:USERPROFILE\.cursor\skills\my-skill" "skills\my-skill"
```

## 提交

```powershell
git add skills/my-new-skill README.md
git commit -m "Add my-new-skill"
git push
```
