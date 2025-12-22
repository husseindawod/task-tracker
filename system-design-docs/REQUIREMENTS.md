# Requirements — MVP v1

## Functional Requirements

### Authentication (Supabase Auth)
- Users can sign up with email/password.
- Email confirmation is mandatory:
  - After sign-up, the user must confirm their email address via a link sent to their email.
  - The user must not be treated as fully active/authenticated for application use until email is confirmed.
- Users can log in only after email confirmation is completed (or, if Supabase allows login pre-confirmation, the app must block access to protected app features until confirmation is completed).
- Users can log out.
- Authenticated requests include a valid JWT (Authorization header).
- Backend rejects invalid or missing tokens (401).

### Projects
- Create, read, update, and soft-delete projects.
- Projects belong to a single authenticated user (ownerId = Supabase user id).
- Users cannot access other users’ projects.

### Tasks
- Create tasks with:
  - title (required)
  - description (optional)
  - status (TODO | IN_PROGRESS | DONE)
  - priority (LOW | MEDIUM | HIGH)
  - due date (optional)
  - project association (optional)
- List tasks with:
  - pagination (page, pageSize)
  - filtering (status, projectId)
  - sorting (createdAt, dueDate, priority)
  - search (title substring)
- Update and soft-delete tasks.
- Users cannot access other users’ tasks.

## Acceptance Criteria (examples)
- On sign-up, the system sends a confirmation email and the user is placed into a “pending confirmation” state.
- A user who has not confirmed their email cannot access protected app features (must be redirected to a confirmation-required screen).
- User A cannot fetch a task owned by User B (403/404).
- Soft-deleted tasks are excluded from lists by default.
- List endpoints return stable pagination metadata and enforce a pageSize cap.

## Non-Functional Requirements
- Security: token validation on every request; ownership enforcement; secrets not stored in repo
- Performance: server-side pagination and indexed access paths
- Reliability: health endpoint and graceful error handling
- Maintainability: layered backend architecture; service-level unit tests
- Reproducibility: backend runs as a Docker container in both development and production

## Out of Scope (v1)
- User roles / RBAC
- Multi-tenant organizations
- Real-time updates
- File uploads/attachments
- AWS/Kubernetes
