# AGENTS.md

This file provides project-specific guidance for AI agents and human collaborators working in `{{PROJECT_NAME}}`.

## Project Positioning

Describe:

- what the project is for
- what the project owns
- what is explicitly out of scope

## Architecture Principles

Document the non-negotiable design rules here.

Examples:

- interface-first implementation
- event-driven integration boundaries
- traceable results
- documentation must move with structural change

## Code And Documentation Constraints

Document:

- preferred language / framework rules
- logging rules
- testing expectations
- documentation update requirements

Recommended defaults:

- prefer simple, direct designs over speculative abstraction
- code must be robust under expected edge cases in scope
- changes should be elegant through clarity, not cleverness
- extensibility should be added only when justified by the current task
- changed behavior should be covered by targeted tests and regression checks
- local run, build, and deploy assumptions must remain documented and reproducible

## Review Gate

Review should check:

- correctness
- scope control
- validation quality
- documentation sync
- architecture rule compliance
- unnecessary abstraction or overengineering
- deployment and operational safety

## Current Stage

State whether the project is:

- bootstrap phase
- active feature phase
- hardening phase
- maintenance phase
