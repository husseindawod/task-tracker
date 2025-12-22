# ADR-0001: Platform Choice for MVP v1

## Decision
Use:
- Cloudflare Pages for frontend hosting
- Render Docker Web Service for backend hosting (containerized)
- Supabase for authentication and PostgreSQL database

## Rationale
- Minimizes infrastructure complexity while still producing a real deployed system.
- Keeps focus on application fundamentals (auth boundaries, ownership, API design, persistence).

## Consequences
- MVP avoids AWS/Kubernetes complexity.
- Backend is portable as a container to other platforms if needed.

## Docker note
Docker is part of the deployment model in v1 (not just local development).
