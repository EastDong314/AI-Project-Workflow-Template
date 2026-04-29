---
description: Create or update .ai-workflow/GOAL.md, .ai-workflow/PLAN.md, and .ai-workflow/ACCEPTANCE.md for the current task
---
Read `.ai-workflow/GOAL.md`, `.ai-workflow/PLAN.md`, `.ai-workflow/ACCEPTANCE.md`, and `.pi/SYSTEM.md` before doing anything else.

Treat `.ai-workflow` as current-task overwrite mode. Your job in this turn is planning and task shaping, not implementation, unless the user explicitly asks you to write code after planning.

Produce or update the current task plan with these rules:
- Rewrite or refresh `.ai-workflow/GOAL.md`, `.ai-workflow/PLAN.md`, and `.ai-workflow/ACCEPTANCE.md` as the authoritative files for the active task.
- Make the plan executable, concrete, and scoped.
- Explain the background and the reason for the change clearly enough that a weaker implementation model can execute without reconstructing hidden context.
- State in-scope and out-of-scope boundaries clearly.
- Call out changed modules or files when they can be inferred.
- Include risks, assumptions, and stop conditions.
- Acceptance criteria must be testable and specific.
- Prefer plan steps that can be validated independently instead of a single vague implementation blob.
- If key information is missing, state the missing information and proceed with the narrowest reasonable assumptions.
- If the task touches backend code, the plan must also state:
  - the intended layer path, such as `controller -> application/service -> repository -> persistence/adapter`
  - which layer owns each part of the change
  - which cross-cutting concerns must stay centralized, such as middleware, filters, metrics, exception translation, validation, and mapping
  - whether DTO/domain/entity separation, repository boundaries, and exception taxonomy are preserved
  - backend-specific verification for route behavior, service orchestration, repository semantics, exception translation, and traceability where relevant

Before editing, briefly state:
- current goal
- background and reason
- planning assumptions
- main implementation tracks
- backend layers impacted, if any
- main risks
- acceptance strategy

Then update `.ai-workflow/GOAL.md`, `.ai-workflow/PLAN.md`, and `.ai-workflow/ACCEPTANCE.md`.
