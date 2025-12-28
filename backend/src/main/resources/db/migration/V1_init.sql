-- V1__init.sql
-- Initial schema for projects and tasks

-- projects table
CREATE TABLE projects (
    id          UUID PRIMARY KEY,
    owner_id    UUID        NOT NULL,
    name        VARCHAR(255) NOT NULL,
    soft_deleted BOOLEAN    NOT NULL DEFAULT FALSE,
    created_at  TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at  TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- tasks table
CREATE TABLE tasks (
    id           UUID         PRIMARY KEY,
    owner_id     UUID         NOT NULL,
    project_id   UUID         NULL,
    title        VARCHAR(255) NOT NULL,
    description  TEXT         NULL,
    status       VARCHAR(32)  NOT NULL,
    priority     VARCHAR(32)  NOT NULL,
    due_date     DATE         NULL,
    soft_deleted BOOLEAN      NOT NULL DEFAULT FALSE,
    created_at   TIMESTAMPTZ  NOT NULL DEFAULT NOW(),
    updated_at   TIMESTAMPTZ  NOT NULL DEFAULT NOW(),
    CONSTRAINT fk_tasks_project
        FOREIGN KEY (project_id) REFERENCES projects(id)
);

-- indexes to support common queries

-- list tasks by user, status, due date
CREATE INDEX idx_tasks_owner_status_due_date
    ON tasks (owner_id, status, due_date);

-- list tasks by user and project
CREATE INDEX idx_tasks_owner_project
    ON tasks (owner_id, project_id);

-- list projects by owner
CREATE INDEX idx_projects_owner
    ON projects (owner_id);
