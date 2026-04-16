# SignalReactor Patterns

This document extracts the reusable initialization and collaboration patterns observed in `C:\Workspace\SignalReactor`.

## Why SignalReactor Is a Good Reference

`SignalReactor` already contains a strong initialization baseline:

- root-level architectural rules in `AGENTS.md`
- project docs under `docs/`
- ADR discipline under `docs/adr/`
- project-local skills under `.codex/skills/`
- project-local `pi` behavior under `.pi/SYSTEM.md`
- active-task workflow artifacts under `.ai-workflow/`
- explicit repository structure for backend, frontend, tests, scripts, SQL, and docs

This makes it a strong candidate for extracting a reusable project bootstrap model.

## Reusable Structure

The most reusable parts are not the business modules, but the collaboration scaffolding:

### 1. Root rules

`AGENTS.md` defines:

- project positioning
- architecture principles
- code and documentation constraints
- review gates

This is the highest-value early file in a new repository because it shapes how AI agents and humans both behave.

### 2. Docs are first-class

The project keeps `docs/` close to code and treats documentation sync as mandatory.

The reusable rule is:

- if architecture, interfaces, or workflow change, docs must change in the same PR

### 3. ADRs are not optional

`docs/adr/` is used for design decisions that should survive chat history loss.

This is useful for AI-assisted development because it reduces repeated re-decision of earlier choices.

### 4. AI workflow state is file-based

`.ai-workflow/` captures the current task state:

- goal
- plan
- acceptance
- implementation log
- review

This is more reliable than relying on agent memory alone.

### 5. Implementation behavior is localized

`.pi/SYSTEM.md` turns `pi` into a project-specific implementation agent instead of a generic shell assistant.

### 6. Project skills are local

`.codex/skills/` stores project-specific domain skills.

This is important because:

- the skills travel with the repo
- the repo explains itself
- Codex can load domain context without global clutter

### 7. Skills discovery should be bridged for pi

For upstream `pi`, `.codex/skills/` should be exposed through `.agents/skills` so both tools can benefit from the same local skill set.

## Extracted Initialization Checklist

When starting a new project, initialize these first:

1. `README.md`
2. `AGENTS.md`
3. `docs/README.md`
4. `docs/adr/README.md`
5. `.pi/SYSTEM.md`
6. `.ai-workflow/*`
7. `.codex/skills/README.md`
8. `.agents/README.md`

Then layer in project-specific code structure.

## What Not To Over-Template

Do not over-template:

- language-specific source layout
- CI/CD internals
- database engine assumptions
- frontend framework assumptions

Those should be added after project constraints are known.

The reusable part is the collaboration and decision scaffold, not a one-size-fits-all tech stack.
