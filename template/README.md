# {{PROJECT_NAME}}

Describe the project mission, boundaries, current stage, and how to start local development.

## Project Positioning

- What this project is responsible for
- What this project is not responsible for

## Quick Start

Document the smallest local bootstrap path here.

## Documentation

- `docs/README.md`
- `AGENTS.md`
- `CONTEXT.md`
- `.ai-workflow/*`
- `.codex/skills/*`
- `.agents/README.md`

If the repository has backend/API code, add a durable backend implementation contract under `docs/` and keep it in sync with real architecture.

Recommended new-feature flow:

1. Align the task with `AGENTS.md`, `CONTEXT.md`, docs, and ADRs.
2. Use `workflow-grill-with-docs` for ambiguous, high-risk, or backend-heavy work.
3. Use `workflow-plan-acceptance` to generate `GOAL.md`, `PLAN.md`, and `ACCEPTANCE.md`.
4. Use `workflow-implement` to implement against the approved plan.
5. Use `workflow-review-md` to review the actual diff and validation evidence.

Recommended bug-fix flow:

1. Align symptoms, logs, and known impact through `AGENTS.md`, `CONTEXT.md`, and relevant docs.
2. Use `workflow-diagnose` before broad fixes when the failure mode is still unclear.
3. Add or confirm a failing repro or the strongest available feedback loop.
4. Use `workflow-plan-acceptance` if the fix has non-trivial scope.
5. Use `workflow-implement` to apply the fix and update `IMPLEMENTATION_LOG.md`.
6. Use `workflow-review-md` to verify the bug is actually fixed and covered against regression.
