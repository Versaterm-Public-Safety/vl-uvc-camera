# Data Flow Diagrams

## System Architecture

```mermaid
graph TB
    subgraph "Client"
        Browser[Browser / PWA]
    end

    subgraph "Application"
        Frontend[Frontend Server]
        API[API Server]
    end

    subgraph "Data"
        DB[(Database)]
        Cache[Cache]
    end

    Browser -->|HTTP| Frontend
    Frontend -->|API calls| API
    API -->|Queries| DB
    API -->|Read/Write| Cache
```

[TODO: Customize the diagram above to match your system architecture]

## Authentication Flow

```mermaid
sequenceDiagram
    participant User
    participant Frontend
    participant API
    participant DB

    User->>Frontend: Login (credentials)
    Frontend->>API: POST /auth/login
    API->>DB: Verify credentials
    DB-->>API: User record
    API-->>Frontend: Access token + Refresh token
    Frontend-->>User: Redirect to dashboard

    Note over Frontend,API: Subsequent requests
    Frontend->>API: Request + Bearer token
    API->>API: Validate token
    API-->>Frontend: Response
```

[TODO: Customize the authentication flow for your system]

## Primary Data Flow

```mermaid
sequenceDiagram
    participant User
    participant Frontend
    participant API
    participant DB

    User->>Frontend: [TODO: Primary user action]
    Frontend->>API: [TODO: API call]
    API->>DB: [TODO: Data operation]
    DB-->>API: [TODO: Response]
    API-->>Frontend: [TODO: Processed response]
    Frontend-->>User: [TODO: UI update]
```

[TODO: Add additional flow diagrams for key workflows in your application]

## Feature Dataflows

Individual dataflow diagrams for each feature are in `.ai/specs/dataflows/`:

[TODO: Run `/fill-specs` to auto-discover API endpoints and generate per-feature dataflow diagrams]

| Feature | Dataflow File | Status |
|---------|--------------|--------|
| [TODO: feature-name] | [dataflows/feature-name.md](dataflows/feature-name.md) | [TODO] |
