# Local Development & Docker — MVP v1

## Goal
Enable fast development with predictable behavior across machines, while matching the production runtime as closely as possible.

## Key principle (v1)
The backend runs as a Docker container in production (Render). Therefore:
- local development should run the backend as a Docker container as well.

## Supabase dev setup requirement (v1)
Email confirmation must be enabled in the Supabase development project as well, so local testing matches production:
- Sign-up sends a confirmation email
- The app blocks access until confirmation is completed

## Recommended local strategy (v1)
- Frontend runs locally and uses a Supabase dev project for Auth.
- Backend runs locally as a container.
- Backend connects to:
  - Supabase dev Postgres (recommended for parity), OR
  - optional local Postgres container (for offline dev only)

## Environment configuration (conceptual)

### Frontend needs
- Supabase URL
- Supabase anon key
- Backend API base URL (local backend)

### Backend container needs
- Supabase Postgres connection config
- Token verification config (if applicable)
- CORS allowed origins (local frontend origin)

## Docker Compose (optional)
Compose can be used to orchestrate local services:
- backend container
- optional local Postgres
- optional local tooling containers

## Non-goals for local dev (v1)
- No AWS-like stack locally
- No Kubernetes
- No complex networking setup

### Database and Migrations
On local startup, the backend connects to the configured PostgreSQL instance (Supabase) using environment variables (`DB_HOST`, `DB_PORT`, `DB_NAME`, `DB_USER`, `DB_PASSWORD`). Flyway automatically applies any pending migrations. Developers must not modify the database schema manually; all changes must be made through new Flyway migration files.
