# AI Project Workflow Template

Reusable project initialization template for AI-assisted development with:

- project-level architecture and collaboration rules
- Codex-to-pi planning / implementation / review loop
- `.ai-workflow` task artifacts
- project-level `.pi` implementation-agent behavior
- local `.codex/skills` convention plus `pi` discovery compatibility
- repo-portable workflow skills for `plan`, `implement`, and `review`

This template was extracted from a working setup used in `SignalReactor` and generalized for reuse across new repositories.

## What This Repository Contains

- `docs/`
  - explanation of the extracted structure and workflow method
- `template/`
  - files and folders to copy into a new project
- `scripts/init-project.ps1`
  - bootstrap script to copy the template into a target repository
- `scripts/link-codex-skills.ps1`
  - helper script to bridge `.codex/skills` into `.agents/skills` for upstream `pi`

## Core Idea

Split responsibilities clearly:

- `Codex`
  - planning
  - acceptance definition
  - review
  - optional coding when explicitly requested
- `pi`
  - implementation
  - validation
  - fixing review findings
  - commit execution

Project state should be carried by files, not just by chat history.

The workflow also assumes three portable skills with a fixed summary format:

- `workflow-plan-acceptance`
- `workflow-implement`
- `workflow-review-md`

## Template Contents

Inside `template/`:

- `AGENTS.md`
- `.pi/SYSTEM.md`
- `.ai-workflow/GOAL.md`
- `.ai-workflow/PLAN.md`
- `.ai-workflow/ACCEPTANCE.md`
- `.ai-workflow/IMPLEMENTATION_LOG.md`
- `.ai-workflow/REVIEW.md`
- `.codex/skills/README.md`
- `.codex/skills/workflow-plan-acceptance/SKILL.md`
- `.codex/skills/workflow-implement/SKILL.md`
- `.codex/skills/workflow-review-md/SKILL.md`
- `.agents/README.md`
- `docs/README.md`
- `docs/adr/README.md`
- `README.md`

## Recommended Usage

### Option 1: Copy manually

Copy the contents of `template/` into a new repository and replace `{{PROJECT_NAME}}` placeholders.

### Option 2: Use the bootstrap script

```powershell
pwsh ./scripts/init-project.ps1 -TargetPath "C:\Workspace\MyProject" -ProjectName "MyProject"
```

Or in Windows PowerShell:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\init-project.ps1 -TargetPath "C:\Workspace\MyProject" -ProjectName "MyProject"
```

If you also want upstream `pi` to discover the same project-local skills kept in `.codex/skills`, enable the bridge during bootstrap:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\init-project.ps1 -TargetPath "C:\Workspace\MyProject" -ProjectName "MyProject" -CreatePiSkillsBridge
```

For an existing project, run:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\link-codex-skills.ps1 -ProjectPath "C:\Workspace\MyProject"
```

## Recommended Lifecycle

1. Create repository and copy the template in.
2. Fill `AGENTS.md` with project-specific architecture and guardrails.
3. Add or refine project-local skills in `.codex/skills/`.
4. Start each task by generating:
   - `.ai-workflow/GOAL.md`
   - `.ai-workflow/PLAN.md`
   - `.ai-workflow/ACCEPTANCE.md`
5. Let `pi` implement against the active task files and keep `.ai-workflow/IMPLEMENTATION_LOG.md` current.
6. Let `Codex` review and write `.ai-workflow/REVIEW.md`.
7. Let `pi` fix issues, revalidate, and update `.ai-workflow/IMPLEMENTATION_LOG.md`.

## Notes on Skills

`Codex` can use project-local skills from `.codex/skills/`.

Upstream `pi` does not automatically scan `.codex/skills/`, so the recommended compatibility pattern is:

- keep project-local skills in `.codex/skills/`
- expose them to `pi` via `.agents/skills` (junction or copy)

This template now includes workflow skill copies in `.codex/skills/` so the repository can carry its own planning, implementation, and review contracts.

See:

- `docs/workflow-method.md`
- `template/.agents/README.md`

## See Also

- `docs/signal-reactor-patterns.md`
- `docs/workflow-method.md`
