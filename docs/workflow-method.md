# Workflow Method

This repository assumes a Codex-to-pi collaboration loop.

## Role Split

Default split:

- `Codex`
  - clarify the task
  - write or update plan
  - write or update acceptance criteria
  - perform review
  - optionally implement code when explicitly requested
- `pi`
  - implement against the approved plan
  - run validation
  - write implementation log
  - fix review findings
  - perform the final commit step

This is a default, not a hard prohibition on coding in Codex.

## Source of Truth

The active task lives in `.ai-workflow/`.

Default mode is **current-task overwrite mode**:

- `GOAL.md`
- `PLAN.md`
- `ACCEPTANCE.md`
- `IMPLEMENTATION_LOG.md`
- `REVIEW.md`

represent the current task, not cumulative history.

When a new task starts, these files should usually be replaced or reset rather than mixed with prior tasks.

## Execution Loop

### 1. Planning

Codex creates:

- `.ai-workflow/GOAL.md`
- `.ai-workflow/PLAN.md`
- `.ai-workflow/ACCEPTANCE.md`

### 2. Implementation

pi:

- reads the active task files
- implements the change
- runs validation
- updates `.ai-workflow/IMPLEMENTATION_LOG.md`

### 3. Review

Codex reviews:

- actual code diff
- key changed files
- implementation log
- plan
- acceptance criteria

Codex then writes:

- `.ai-workflow/REVIEW.md`

### 4. Fix cycle

pi reads `REVIEW.md`, fixes blocking findings, re-validates, and updates `IMPLEMENTATION_LOG.md`.

### 5. Completion

Only after review passes and acceptance is satisfied should commit proceed.

## Why This Works

This method is robust because:

- task state is visible in files
- implementation and review are separated
- context survives session changes
- project rules are local to the repository

## Compatibility Rules

### Codex local skills

Keep project skills in:

- `.codex/skills/`

### pi compatibility

Expose those skills to upstream `pi` through:

- `.agents/skills`

This can be done with a junction on Windows or a symlink on Unix-like systems.

In this template repository, there are two supported ways:

- use `scripts/init-project.ps1 -CreatePiSkillsBridge`
- use `scripts/link-codex-skills.ps1` after initialization

## Minimum Files For New Repositories

At minimum, every new repository should have:

- `README.md`
- `AGENTS.md`
- `.pi/SYSTEM.md`
- `.ai-workflow/GOAL.md`
- `.ai-workflow/PLAN.md`
- `.ai-workflow/ACCEPTANCE.md`
- `.ai-workflow/IMPLEMENTATION_LOG.md`
- `.ai-workflow/REVIEW.md`
