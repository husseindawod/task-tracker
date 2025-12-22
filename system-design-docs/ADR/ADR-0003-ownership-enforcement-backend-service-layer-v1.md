# ADR-0003: Ownership Enforcement in Backend Service Layer (v1)

## Decision
Enforce resource ownership in backend service logic:
- `resource.ownerId == authenticatedUserId`

## Rationale
- Keeps MVP simple by avoiding database Row-Level Security (RLS) complexity.
- Centralizes access control in one place.

## Consequences
- Ownership checks must be applied to every read/write operation.
- Automated tests must cover cross-user access scenarios.

## Docker note
Ownership enforcement must behave identically in containerized development and containerized production.
