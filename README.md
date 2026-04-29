# AI Project Workflow Template

Reusable workflow kit for Codex-to-pi collaboration.

This repository is now the single public home for:

- the reusable project template
- the five workflow skills
- public-safe pi companion configuration
- workflow reference docs and visual guides

The goal is simple: keep one source of truth for the workflow so planning, implementation, review, and pi setup do not drift apart.

## Repository Layout

- `docs/`
  - workflow method, extracted patterns, and visual guides
- `skills/`
  - canonical copies of the five workflow skills
- `pi/`
  - public-safe pi companion config, prompts, and restore helper
- `template/`
  - files to copy into a new repository
- `scripts/`
  - bootstrap and sync helpers

## The Five Workflow Skills

- `workflow-grill-with-docs`
- `workflow-plan-acceptance`
- `workflow-implement`
- `workflow-review-md`
- `workflow-diagnose`

The root `skills/` directory is the canonical public source.

The copies under `template/.codex/skills/` exist so a new project can be bootstrapped as a self-contained repository.

## Role Split

- `Codex`
  - context alignment
  - planning
  - acceptance shaping
  - review
  - optional coding only when explicitly requested
- `pi`
  - implementation
  - validation
  - diagnosis and bug fixing
  - final cleanup and follow-through

Project state should live in files, not only in chat history.

## What To Use For What

### `template/`

Use when you want to initialize a new repository with:

- `AGENTS.md`
- `CONTEXT.md`
- `.ai-workflow/*`
- `.pi/SYSTEM.md`
- project-local `.codex/skills/*`
- `.agents/README.md`

### `skills/`

Use when you want to inspect, copy, or evolve the workflow skills themselves.

### `pi/`

Use when you want a public-safe example of:

- `~/.pi/agent/AGENTS.md`
- `~/.pi/agent/APPEND_SYSTEM.md`
- prompt templates
- example `settings.json`
- example `models.json`

The `pi/` folder intentionally avoids machine-specific private values.

## Recommended Usage

### Initialize a new repository

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\init-project.ps1 -TargetPath "C:\Workspace\MyProject" -ProjectName "MyProject"
```

If upstream `pi` should see the same project-local skills:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\init-project.ps1 -TargetPath "C:\Workspace\MyProject" -ProjectName "MyProject" -CreatePiSkillsBridge
```

For an existing repository:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\link-codex-skills.ps1 -ProjectPath "C:\Workspace\MyProject"
```

## Recommended New Feature Flow

1. Read `AGENTS.md`, `CONTEXT.md`, and the relevant docs/ADRs.
2. Use `workflow-grill-with-docs` when terminology, scope, or architecture fit is unclear.
3. Use `workflow-plan-acceptance` to create `GOAL.md`, `PLAN.md`, and `ACCEPTANCE.md`.
4. Use `workflow-implement` to execute the approved plan.
5. Use `workflow-review-md` for the review gate.
6. Use `workflow-diagnose` first for bug, regression, or flaky investigation.

## Visual Guides

- new feature flow: [docs/workflow-guide.png](C:/Workspace/AI-Project-Workflow-Template/docs/workflow-guide.png)
- bug fix flow: [docs/workflow-bug-guide.png](C:/Workspace/AI-Project-Workflow-Template/docs/workflow-bug-guide.png)

## See Also

- [docs/workflow-method.md](C:/Workspace/AI-Project-Workflow-Template/docs/workflow-method.md)
- [docs/signal-reactor-patterns.md](C:/Workspace/AI-Project-Workflow-Template/docs/signal-reactor-patterns.md)
- [skills/README.md](C:/Workspace/AI-Project-Workflow-Template/skills/README.md)
- [pi/README.md](C:/Workspace/AI-Project-Workflow-Template/pi/README.md)
