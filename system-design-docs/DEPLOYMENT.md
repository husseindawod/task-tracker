# Deployment — MVP v1

## Targets
- Frontend: Cloudflare Pages
- Backend: Render Docker Web Service (runs a container image)
- Auth & Database: Supabase (Auth + Postgres)

## Backend deployment model (containerized)
- The Spring Boot backend is packaged into a Docker image.
- Render builds and runs the image as a Docker Web Service.
- Environment variables are configured in Render and injected at runtime.

## Frontend (Cloudflare Pages)
### Required environment variables
- VITE_SUPABASE_URL
- VITE_SUPABASE_ANON_KEY
- VITE_API_BASE_URL (Render backend base URL)

## Backend (Render) — required runtime configuration
Environment variables (conceptual):
- Database connection configuration (Supabase Postgres)
  - Either a JDBC URL or host/db/user/password variables
- Token verification configuration (depending on chosen approach)
- CORS_ALLOWED_ORIGINS (Cloudflare Pages domain; include localhost only for dev environments)

## Supabase (Auth + Postgres)
### Authentication settings (required for v1)
- Enable email/password authentication.
- Require email confirmation for new sign-ups (no “auto-confirm”).
- Configure email templates/redirect URLs appropriate for:
  - local dev
  - Cloudflare Pages production domain
- Ensure “resend confirmation email” is possible from the app (UI flow requirement).

### Database
- Create application tables and indexes:
  - projects
  - tasks
- Configure password and email policies as desired (but email confirmation remains mandatory).

## Deployment flow (conceptual)
1. Provision Supabase project (Auth + Postgres).
2. Configure Supabase Auth to require email confirmation and set redirect URLs.
3. Configure Render Docker Web Service connected to the repository.
4. Set Render environment variables (DB + CORS + token verification).
5. Deploy backend container on Render.
6. Deploy frontend on Cloudflare Pages with Supabase + API env vars.
7. Validate end-to-end:
   - signup triggers email confirmation
   - unconfirmed users cannot access protected features
   - confirmed users can login and use CRUD
   - cross-user isolation

## Docker parity objective
- The production runtime is the container. Therefore, the local development environment should run the same container image (or an equivalent build) to ensure parity.
