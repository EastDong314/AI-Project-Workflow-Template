# Workflow Skills

These are the canonical public copies of the workflow skills used by this repository.

They are designed to support a Codex-to-pi collaboration loop with:

- context alignment
- executable planning
- disciplined implementation
- review as a real quality gate
- bug-first diagnosis when the failure mode is still unclear

## Skills

- `workflow-grill-with-docs`
- `workflow-plan-acceptance`
- `workflow-implement`
- `workflow-review-md`
- `workflow-diagnose`

## Source Of Truth

- edit the skill definitions here first
- keep `template/.codex/skills/` in sync from this folder
- use `scripts/sync-template-skills.ps1` after changing workflow skills

## Publishing Rule

These skills should stay generic and reusable.

Do not put:

- private machine paths
- project-specific business rules
- repo-specific domain conventions

into the root `skills/` definitions.

Project-specific rules belong in:

- `template/AGENTS.md`
- `template/CONTEXT.md`
- `template/.pi/SYSTEM.md`
- project-local `.codex/skills/`
