# ADR-0002: Authentication via Supabase Auth; Backend Validates Tokens

## Decision
- Frontend authenticates with Supabase Auth (email/password).
- Email confirmation is mandatory for new sign-ups.
- Frontend attaches JWT to requests to the backend.
- Backend validates token and extracts the Supabase user id for authorization decisions.

## Rationale
- Avoids custom auth implementation for MVP.
- Standard SPA pattern with a clear security boundary: backend remains authoritative for authorization.
- Email confirmation reduces the risk of fake or mistyped emails and aligns with common production expectations.

## Consequences
- The application must support a “pending confirmation” UX after sign-up.
- Backend must implement robust token validation and consistent 401/403 handling.
- Authorization tests are mandatory to prevent cross-user data leaks.

## Docker note
Token validation and email-confirmation enforcement must match in local container runs and Render container runs.
No secrets are baked into container images; environment variables are injected at runtime.
