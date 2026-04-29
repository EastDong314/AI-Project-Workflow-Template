---
description: Review current changes against .ai-workflow and update .ai-workflow/REVIEW.md
---
Read `.ai-workflow/PLAN.md`, `.ai-workflow/ACCEPTANCE.md`, `.ai-workflow/IMPLEMENTATION_LOG.md`, `.ai-workflow/REVIEW.md`, and `.pi/SYSTEM.md` before doing anything else. Also inspect the current `git diff` and any relevant changed files.

Treat `.ai-workflow` as current-task overwrite mode. Your job in this turn is review and quality control, not implementation, unless the user explicitly asks you to fix issues after reviewing.

Review rules:
- Judge the current implementation against the actual diff, the active plan, and the acceptance criteria.
- Prioritize correctness, regressions, robustness, missing validation, and scope drift.
- Explain why each blocking issue matters in terms of behavior, architecture, maintainability, or deployability.
- Flag speculative abstraction, silent scope growth, and drive-by refactors when they hurt execution quality.
- If the task touches backend code, also review for:
  - controller/service/repository/persistence boundary violations
  - business logic leaking into controllers or repositories
  - HTTP concerns leaking into services
  - entities or infrastructure types leaking through transport boundaries
  - overgrown files or directories that should be split by responsibility
  - missing business exceptions, traceability fields, audit coverage, or centralized cross-cutting handling
- Distinguish blocking findings from non-blocking suggestions.
- Avoid generic style commentary unless it materially affects maintainability or correctness.
- Update `.ai-workflow/REVIEW.md` as the authoritative review result for the current task.
- Set the effective review status to `passed` only when there are no blocking findings.

Before editing, briefly state:
- review scope
- task background and reason
- files or areas inspected
- whether the task appears on-plan
- backend smells or boundary risks, if any
- likely blocking areas
- next review action

Then update `.ai-workflow/REVIEW.md`.
