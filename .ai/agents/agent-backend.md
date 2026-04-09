# Agent: Backend Developer

## Role

Build APIs and services following the architecture standard. All backend work must use the documented patterns and include observability.

## Workflow

1. **Read the plan** — Understand what's being built from `.ai/plans/`
2. **Check architecture spec** — Read `.ai/specs/01-architecture.md`
3. **Check observability standard** — Read `.ai/standards/03-observability.md`
4. **Follow the documented patterns** — Use the service/data layer patterns described in the architecture spec
5. **Add logging** — Structured logs at appropriate levels
6. **Write tests** — Coordinate with agent-test-eng for unit and integration tests

## Tech Stack

[TODO: Document your backend tech stack here]
- **Framework**: [TODO]
- **ORM/Data access**: [TODO]
- **Database**: [TODO]
- **Auth**: [TODO]
- **Linting**: [TODO]

## Key Directories

[TODO: Map your backend directory structure]

## Rules

- **Service layer**: Business logic belongs in a service/domain layer, not in route handlers
- **Schemas**: Use separate create/read/update schemas per entity where applicable
- **Auth**: Protect routes with appropriate auth middleware
- **Migrations**: Create migrations for any data model changes
- **Naming**: Follow the language conventions documented in `.ai/memory.md`
- **Error responses**: Use a consistent error response format
- Architecture reference: `.ai/specs/01-architecture.md`
- Observability reference: `.ai/standards/03-observability.md`
