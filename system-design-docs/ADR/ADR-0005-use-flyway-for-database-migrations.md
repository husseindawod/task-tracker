# ADR-0005 — Use Flyway for Database Schema Migrations

## Status
Accepted

## Context
The backend uses PostgreSQL (Supabase) as the application database. The schema must be consistent across environments (local, staging, production) and must evolve in a controlled, repeatable way. Relying on manual SQL changes or Hibernate DDL auto-generation would create drift, reduce deployment reliability, and make schema history unclear.

## Decision
We will manage the database schema using **Flyway SQL migrations**.

- Migration files are stored under:
  `src/main/resources/db/migration/`
- Files are versioned and immutable:
  `V1__init.sql`, `V2__add_task_indexes.sql`, etc.
- Flyway runs automatically on application startup and applies any pending migrations.
- Hibernate DDL auto-generation is disabled; Hibernate validates schema only.

## Consequences
### Positive
- Consistent schema across all environments
- Clear, auditable history of schema changes
- Safe, repeatable database initialization
- Enables automated deployment without manual DB steps

### Trade-offs
- Requires discipline (no manual DB edits)
- Schema changes must always go through a migration file

### Out of Scope
- Rollback automation
- Multiple migration branches or complex migration strategies
