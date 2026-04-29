# Project Local Skills

Put project-specific Codex skills here.

Recommended usage:

- keep the workflow skills in this folder if you want the repo to be self-contained:
  - `workflow-grill-with-docs`
  - `workflow-plan-acceptance`
  - `workflow-implement`
  - `workflow-review-md`
  - `workflow-diagnose`
- keep domain skills in `.codex/skills/`
- keep global generic skills in the user-level Codex skills directory
- avoid putting project-specific domain logic into global skills

Examples:

- domain policy skill
- event contract guard
- docs sync enforcer
- frontend stack conventions
- backend architecture conventions
- context-alignment skill
- diagnosis/debug skill

If you want upstream `pi` to use these same skills, expose this folder through `.agents/skills`.
