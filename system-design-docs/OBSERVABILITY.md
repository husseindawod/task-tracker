# Observability — MVP v1

## Logging
- Use structured logs for each request:
  - timestamp, method, path, status
  - requestId (generated per request)
  - userId (when authenticated)

## Health checks
- `GET /health`
  - Confirms API process is running
  - Confirms DB connectivity (simple validation query or connection check)

## Error handling
- Return consistent API errors to clients:
  - { code, message, details? }
- Log detailed exceptions server-side without leaking internals to clients.

## Docker parity
Observability must behave consistently when the backend runs:
- locally as a container
- on Render as a container
