# System Architecture — MVP v1

## Overview
This system is a single-page application (SPA) with a REST backend and managed authentication and database services.

## High-Level Architecture
- React SPA hosted on Cloudflare Pages
- Spring Boot REST API hosted on Render
- Supabase provides authentication and PostgreSQL database
- Docker provides local runtime parity and repeatable developer environments

## Architecture Diagram

# System Architecture — MVP v1

## Overview
This system is a single-page application (SPA) with a REST backend and managed authentication and database services.

## High-Level Architecture
- React SPA hosted on Cloudflare Pages
- Spring Boot REST API hosted on Render
- Supabase provides authentication and PostgreSQL database
- Docker provides local runtime parity and repeatable developer environments

## Architecture Diagram
![System Architecture](images/architecture_diagram.png)

## Component Responsibilities
### Frontend
- UI rendering and routing
- User authentication via Supabase SDK
- Client-side validation
- Sends JWT in Authorization header to backend

### Backend
- REST API
- Token validation
- Authorization and ownership checks
- Business logic and transactions
- Database access via Hibernate

### Supabase
- Supabase Auth manages user identity
- Supabase Postgres stores application data

## Architectural Style
- Modular monolith backend
- Layered architecture:
  - Controller
  - Service
  - Repository
  - Domain

## Trust Boundaries
- Browser is untrusted
- Backend is the security enforcement point
- Database is accessed only by backend
