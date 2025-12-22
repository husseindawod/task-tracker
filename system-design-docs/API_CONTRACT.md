# API Contract — MVP v1

## Conventions
- Base path: `/api`
- Authorization: `Authorization: Bearer <JWT>`
- Content-Type: `application/json`
- Pagination response:
  {
    "items": [],
    "page": 1,
    "pageSize": 20,
    "totalItems": 0,
    "totalPages": 0
  }
- Error response:
  {
    "code": "STRING",
    "message": "Human readable message",
    "details": { }
  }

## Health
- `GET /health`
  - Purpose: service health check (no auth required)
  - Returns: app status and DB connectivity signal
  - Note: This endpoint must behave consistently in:
    - local Docker runs
    - Render production container runs

## Projects
- `POST /api/projects`
- `GET /api/projects`
- `GET /api/projects/{id}`
- `PUT /api/projects/{id}`
- `DELETE /api/projects/{id}` (soft delete)

## Tasks
- `POST /api/tasks`
- `GET /api/tasks`
- `GET /api/tasks/{id}`
- `PUT /api/tasks/{id}`
- `DELETE /api/tasks/{id}` (soft delete)

### Query Parameters (GET /api/tasks)
- `page` (default 1)
- `pageSize` (default 20, capped)
- `status` (optional)
- `projectId` (optional)
- `search` (optional; title substring)
- `sort` (optional; e.g., `dueDate,asc`)

## Authorization Rule (v1)
All project and task access must satisfy:
- `resource.ownerId == authenticatedUserId` (authenticated user id from JWT)

## Docker parity requirement
- All endpoint behavior (status codes, error shape, pagination semantics) must be identical when running as a container locally and when running as a container on Render.
