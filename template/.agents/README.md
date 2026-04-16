# Agents Compatibility

Upstream `pi` automatically discovers skills from `.agents/skills`, but not from `.codex/skills`.

Recommended pattern:

- keep the real project-local skills in `.codex/skills`
- expose them to `pi` through `.agents/skills`

## Windows

Example junction:

```powershell
New-Item -ItemType Directory -Force ".agents" | Out-Null
New-Item -ItemType Junction -Path ".agents\\skills" -Target ".codex\\skills"
```

## Unix-like systems

Example symlink:

```bash
mkdir -p .agents
ln -s ../.codex/skills .agents/skills
```
