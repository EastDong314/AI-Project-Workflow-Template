# pi Companion

This folder contains a public-safe companion setup for `pi`.

It is meant to help users configure `~/.pi/agent/` so `pi` behaves like a disciplined senior software engineer inside the Codex-to-pi workflow.

## Included

- `agent/AGENTS.md`
- `agent/APPEND_SYSTEM.md`
- `agent/prompts/`
- `agent/settings.json.example`
- `agent/models.json.example`
- `restore.ps1`

## Not Included

- `auth.json`
- real API keys
- session history
- private machine-specific paths

## Setup

1. Review and customize:
   - `agent/AGENTS.md`
   - `agent/APPEND_SYSTEM.md`
   - `agent/settings.json.example`
2. Rename `settings.json.example` to `settings.json` locally.
3. Fill `models.json.example` with your provider credentials and save it as `models.json` locally.
4. Copy `skills/workflow-implement/` into `~/.pi/agent/skills/` if you want a pi-local implementation skill.
5. Keep project workflow skills in project `.agents/skills/` when possible.

## Restore Helper

```powershell
powershell -ExecutionPolicy Bypass -File .\pi\restore.ps1
```

Optional target root:

```powershell
powershell -ExecutionPolicy Bypass -File .\pi\restore.ps1 -TargetRoot "C:\Users\YourName"
```
