# Observability Standard

## Logging

### Backend (Python)
- Use Python's `logging` module with structured output
- Log levels: DEBUG (local dev), INFO (request flow), WARNING (recoverable), ERROR (failures)
- Include request context: user_id, resource_id, endpoint
- Never log sensitive data (passwords, tokens, PII beyond IDs)

### Frontend (TypeScript)
- Use `console.error` for caught errors that affect user experience
- Use `console.warn` for degraded functionality
- Remove `console.log` debug statements before committing

### Docker Compose Logs
```bash
docker compose logs -f api     # tail API logs
docker compose logs -f web     # tail frontend logs
docker compose logs -f db      # tail database logs
```

## Error Handling

### Backend
- FastAPI exception handlers return consistent JSON error responses
- Service layer raises domain-specific exceptions (not HTTP exceptions)
- Route handlers catch service exceptions and map to HTTP status codes
- Always return: `{"detail": "Human-readable message"}`

### Frontend
- TanStack Query `onError` callbacks for API failures
- Toast notifications for user-facing errors
- Error boundaries for component-level crash recovery

## Health Checks

- API health: `GET /health` returns `{"status": "ok"}`
- Database connectivity checked on startup
- Docker Compose healthcheck configured for API service

## DORA Metrics Tracking

| Metric | Target | How to Measure |
|--------|--------|----------------|
| Deployment Frequency | Weekly+ | Count of production deploys per week |
| Lead Time for Changes | < 1 day | Time from commit to production |
| Change Failure Rate | < 15% | % of deploys causing incidents |
| Time to Restore | < 1 hour | Time from incident to resolution |

Track these through CI/CD pipeline timestamps and incident logs.
