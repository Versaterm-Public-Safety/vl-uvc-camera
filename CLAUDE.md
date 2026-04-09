# [Project Name]

> **Primary context:** Read `.ai/memory.md` for full project context, architecture, and conventions.

## Quick Reference

- **Start dev:** `[TODO: command to start local development]`
- **Backend tests:** `[TODO: command to run backend tests]`
- **Frontend tests:** `[TODO: command to run frontend tests]`
- **E2E tests:** `[TODO: command to run E2E tests]`

## AI Agent Structure

```
.ai/
├── memory.md              # Read FIRST — full project context
├── agents/                # Role-specific agent instructions
│   ├── agent-planner.md   # Feature breakdown and planning
│   ├── agent-test-eng.md  # TDD enforcement
│   ├── agent-frontend.md  # UI development
│   ├── agent-backend.md   # API/service development
│   └── agent-security.md  # Security review
├── specs/                 # Project specifications
│   ├── 01-architecture.md # System architecture
│   ├── product-spec.md    # Product requirements
│   └── dataflow.md        # Data flow diagrams
├── standards/             # Engineering standards (org-wide)
│   ├── 01-ux-responsive.md
│   ├── 02-tdd-core.md
│   └── 03-observability.md
└── plans/
    └── status.md          # Current status and known issues
```

## Key Specs

- `.ai/specs/01-architecture.md` — System architecture
- `.ai/specs/product-spec.md` — Product requirements

## Conventions

- **Commits**: Conventional commits (`feat:`, `fix:`, `chore:`)
- **Plans**: Save to `.ai/plans/YYYY-MM-DD-<feature-name>.md`
- [TODO: Add language/framework-specific conventions]
