# Backend Implementation Contract

Use this document when the repository contains backend/API code and you need a durable implementation contract that survives chat history resets.

This contract should be adapted to the concrete stack, but the following rules are the default baseline.

## Core Architecture

- Keep the backend chain explicit:
  - `controller -> application/service -> repository -> persistence/adapter`
- If the project has orchestration-heavy domain flows, keep orchestrators or domain services behind abstractions instead of wiring them directly into HTTP endpoints.
- `Core` or domain contracts define invariants, interfaces, enums, value objects, exceptions, and cross-layer language.
- `Infrastructure` implements persistence, external I/O, background work, streaming, and provider integrations.

## Layer Rules

### Controllers

- Controllers are HTTP boundary adapters only.
- They may validate transport input, build request context, enforce edge authorization, call application services, and map results to transport DTOs.
- They must not own business workflows, broad `try/catch`, persistence logic, or direct adapter calls.

### Application Services

- Services own use-case orchestration and business flow order.
- They coordinate repositories, orchestrators, adapters, validators, and audit creation.
- They must not return `IActionResult`, create `ProblemDetails`, or leak HTTP-specific concerns.

### Repositories

- Repositories own data access only.
- Keep one repository per concern or aggregate.
- Avoid technology-branded names when role-based names are sufficient.
- Repositories must not absorb business decisions.

### Infrastructure

- Infrastructure owns EF/ORM code, external SDKs, secret providers, background jobs, and streaming publishers/hubs.
- External types should stay behind normalized contracts.
- Avoid mixing middleware, controllers, and HTTP response shaping into infrastructure.

## Data Shape Rules

- Use transport DTOs for API boundaries.
- Use domain models for business-facing normalized shapes.
- Use persistence entities for database mapping.
- Do not return entities or tracked persistence models directly from API handlers.

## Cross-Cutting Rules

- Centralize request correlation, exception translation, metrics, and repeated validation in middleware, filters, validators, helpers, or mapping layers.
- Do not reimplement the same logging, error handling, or statistics logic per endpoint.
- Use explicit business/application exceptions instead of ad-hoc null/false/error-code branching.

## Traceability

When relevant to the use case, preserve dimensions such as:

- `requestId`
- `traceId`
- actor
- account
- exchange
- symbol
- outcome

Trade-affecting, state-changing, or operationally sensitive paths should be traceable through logs, metrics, and audit evidence.

## Directory and Naming Guidance

- Split directories by responsibility, not by incidental implementation detail.
- Prefer durable names such as `Controllers`, `Application`, `Core`, `Infrastructure`, `Repositories`, `BackgroundServices`, `Streaming`, `Factors`, `Catalogs`, `Readers`, or equivalent role-based names.
- Prefer role-based type names over storage-brand names where possible.
- Keep file names aligned with type roles:
  - `*DTO`
  - `*Request` / `*Response`
  - `*DomainModel`
  - `*Entity`
  - explicit `*Exception`

## Tests and Review

Backend changes should be reviewed for:

- controller thinness
- service-centric orchestration
- repository-only data access
- DTO/domain/entity boundary preservation
- explicit exception flow
- centralized cross-cutting concerns
- traceability and audit completeness where relevant
- targeted tests for routes, orchestration, repository behavior, and exception translation as appropriate

## Documentation Rule

If you change:

- project structure
- layer boundaries
- persistence approach
- streaming contracts
- background execution model
- exception model

update the backend implementation contract and related ADR/docs in the same change.
