# Security — MVP v1

## Authentication
- Supabase Auth handles signup/login and issues JWTs.
- Email confirmation is mandatory:
  - Users must confirm their email address before they are allowed to use protected application features.
- Frontend sends JWT in `Authorization: Bearer <JWT>` to backend.
- Backend validates JWT and extracts the authenticated user id.

## Email confirmation enforcement (v1)
The system must ensure unconfirmed users cannot use the application:
- Supabase configuration must require email confirmation for sign-up.
- Frontend must handle the “pending confirmation” state (e.g., show a screen instructing the user to confirm their email and provide a way to re-send confirmation).
- Backend must treat requests as unauthenticated/unauthorized if email is not confirmed (implementation may rely on Supabase token claims or Supabase verification behavior, but the outcome must be enforced).

## Authorization (v1)
- Backend enforces ownership for all project/task operations:
  - `resource.ownerId == authenticatedUserId`
- Authorization is centralized in the service layer (not in controllers).

## Secrets Management
- Secrets are injected via environment variables at runtime (Render and local Docker).
- Secrets are never committed to source control and never baked into container images.
- Frontend stores only public Supabase configuration (URL and anon key).

## CORS
- Production CORS allows only:
  - Cloudflare Pages production domain
- Development CORS allows:
  - localhost dev origin(s)
- Wildcard origins are not allowed in production.

## Threats addressed (v1)
- Unauthorized access to protected endpoints (token validation + email confirmation requirement)
- Cross-user data leaks (ownership checks + tests)
- Secret leakage (no secrets committed; env vars only)

## Docker requirements (dev + prod)
- Container images must not contain secrets.
- Runtime environment variables provide:
  - DB connection configuration
  - token verification configuration (if required)
  - allowed CORS origins
- Security behavior (token validation, email-confirmation enforcement, CORS enforcement, error shape) must match:
  - local container runs
  - Render container runs
