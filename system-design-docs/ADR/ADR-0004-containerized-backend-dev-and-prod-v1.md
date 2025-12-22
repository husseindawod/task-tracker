# ADR-0004: Containerized Backend in Both Development and Production (v1)

## Decision
Package and run the Spring Boot backend as a Docker container in:
- local development
- production deployment on Render (Docker Web Service)

## Rationale
- Ensures runtime parity between development and production.
- Reduces “works on my machine” differences (JDK version, startup behavior, dependencies).
- Improves portability of the backend across hosting providers.

## Consequences
- A Dockerfile is required for the backend.
- Secrets must be injected at runtime via environment variables (never built into the image).
- CI/CD can build the container image as the deployable artifact.
