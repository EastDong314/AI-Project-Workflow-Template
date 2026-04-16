# Project Local Skills

Put project-specific Codex skills here.

Recommended usage:

- keep domain skills in `.codex/skills/`
- keep global generic skills in the user-level Codex skills directory
- avoid putting project-specific domain logic into global skills

Examples:

- domain policy skill
- event contract guard
- docs sync enforcer
- frontend stack conventions
- backend architecture conventions

If you want upstream `pi` to use these same skills, expose this folder through `.agents/skills`.
