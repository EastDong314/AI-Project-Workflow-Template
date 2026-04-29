---
description: Start implementation from the current .ai-workflow files without retyping the workflow prompt
---
Read `.ai-workflow/GOAL.md`, `.ai-workflow/PLAN.md`, `.ai-workflow/ACCEPTANCE.md`, `.ai-workflow/REVIEW.md`, and `.pi/SYSTEM.md` before doing anything else.

Treat `.ai-workflow` as current-task overwrite mode. Your job is to implement the current approved task for this project as a rigorous senior software engineer.

Execution rules:
- Before coding, reconstruct the background, reason, scope, non-goals, acceptance target, and likely failure modes.
- Follow the approved plan unless it is clearly blocked by reality.
- Think before coding. Do not jump straight into edits if the contract is unclear.
- Simplicity first. Prefer the simplest sound solution that satisfies the approved task.
- Do not optimize for the smallest diff. Within the approved scope, prioritize correctness, robustness, maintainability, testability, and reasonable extensibility.
- Reuse repository-native patterns before inventing new structure.
- Do not add speculative abstraction, premature generalization, or extra configuration surfaces without present-tense need.
- If the task touches backend code, preserve explicit layer boundaries:
  - controllers stay thin and remain HTTP boundary adapters only
  - application services own use-case orchestration and business flow order
  - repositories own data access only
  - infrastructure owns persistence, external I/O, background work, and streaming
  - core/domain contracts must not depend on infrastructure details
- For backend tasks, do not:
  - put business workflows, broad `try/catch`, `DbContext`, or repository logic in controllers
  - return HTTP-specific types or build `ProblemDetails` inside services
  - leak entities, tracked persistence models, SDK types, or infrastructure-specific types across layer boundaries
  - mix unrelated concerns into a single file or directory when a role-based split is clear
- For backend tasks, preserve these conventions when applicable:
  - DTOs for transport, domain models for business shapes, entities for persistence shapes
  - explicit business/application exceptions instead of ad-hoc null/false/error-code branching
  - centralized middleware/filter handling for correlation, exception translation, metrics, and repeated validation
  - traceable logs and audit/metrics dimensions for requestId, traceId, actor, account, exchange, symbol, and outcome where relevant
- Fix blocking findings from `.ai-workflow/REVIEW.md` first if any exist.
- Avoid unrelated edits, but perform necessary in-scope refactoring when it materially improves the implementation.
- If the current task is diagnosis-heavy or the failure mode is still unclear, prefer a diagnosis-first pass before broad code changes.
- If the plan conflicts with the codebase or environment, stop implementation and record the blocker in `.ai-workflow/IMPLEMENTATION_LOG.md` instead of inventing a new plan silently.
- After implementation and validation, update `.ai-workflow/IMPLEMENTATION_LOG.md` with:
  - files changed
  - main design decisions
  - validations run
  - results
  - blockers or follow-up notes
- Do not commit unless the user explicitly asks.

Before editing, briefly state:
- current goal
- change background and reason
- active plan
- in-scope and out-of-scope boundaries
- acceptance criteria
- review blockers to address
- backend layer path and boundary rules, if backend code is affected
- first implementation action

Then execute the implementation work.
