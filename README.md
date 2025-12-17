# Task Tracker — MVP v1

A full-stack task tracker application built as a realistic, deployable portfolio project.

## Tech Stack
- Frontend: React + TypeScript + Tailwind CSS
- Backend: Spring Boot + Hibernate (modular monolith)
- Authentication: Supabase Auth
- Database: Supabase Postgres
- Hosting:
  - Frontend: Cloudflare Pages
  - Backend: Render (Web Service)
- Local dev & parity: Docker (recommended) + optional Docker Compose

## MVP v1 Features
- Email/password authentication (Supabase Auth)
- Create, read, update, and soft-delete tasks
- Task status, priority, and due dates
- Project-based task grouping
- Pagination, filtering, sorting, and search
- User data isolation (users only see their own data)
- Fully deployed frontend, backend, and database

## Docker (how it fits)
Docker is used to make local development reproducible and production-like:
- Run backend in a container locally to match Render runtime assumptions
- Optionally run a local Postgres container for offline dev (Supabase remains the source of truth for deployed v1)
- Standardize environment variables and startup behavior across machines

## Documentation
- Architecture: `ARCHITECTURE.md`
- Requirements: `REQUIREMENTS.md`
- API Contract: `API_CONTRACT.md`
- Data Model: `DATA_MODEL.md`
- Security: `SECURITY.md`
- Deployment: `DEPLOYMENT.md`
- Local Development & Docker: `LOCAL_DEV.md`
- Observability: `OBSERVABILITY.md`
- Architecture Decisions: `ADR/`

## Non-Goals (v1)
- User roles / RBAC
- Real-time collaboration
- File attachments
- AWS or Kubernetes infrastructure
