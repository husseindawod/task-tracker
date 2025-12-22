# Task Tracker — MVP v1

A full-stack task tracker application built as a realistic, deployable portfolio project.

## Tech Stack
- Frontend: React + TypeScript + Tailwind CSS
- Backend: Spring Boot + Hibernate (modular monolith)
- Authentication: Supabase Auth (email/password + email confirmation)
- Database: Supabase Postgres
- Hosting:
  - Frontend: Cloudflare Pages
  - Backend: Render (Docker Web Service)
- Containerization:
  - Development: Docker (recommended) + optional Docker Compose
  - Production (backend): Docker (Render runs the container)

## MVP v1 Features
- Email/password authentication with mandatory email confirmation (Supabase Auth)
- Create, read, update, and soft-delete tasks
- Task status, priority, and due dates
- Project-based task grouping
- Pagination, filtering, sorting, and search
- User data isolation (users only see their own data)
- Fully deployed frontend, backend, and database

## Docker (how it fits)
Docker is a first-class part of this MVP:
- The backend is packaged as a container image.
- The same container image format is used in both local development and production on Render.
- Environment-specific configuration is injected via environment variables (never baked into images).

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
