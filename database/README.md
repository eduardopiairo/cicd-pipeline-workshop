# Database

PostgreSQL database with Flyway migrations for the CI/CD Pipeline Workshop.

## Prerequisites

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Running the database

From the **root of the repository**, run:

```bash
docker compose -f docker-compose.db.yml up --build
```

This will:
1. Build the database image locally from `./database`
2. Start a PostgreSQL container on port `5432`
3. Automatically run all Flyway migrations on startup

To run in the background:

```bash
docker compose -f docker-compose.db.yml up --build -d
```

## Stopping the database

```bash
docker compose -f docker-compose.db.yml down
```

To also remove the persisted data volume:

```bash
docker compose -f docker-compose.db.yml down -v
```

## Connection details

| Parameter | Value          |
|-----------|----------------|
| Host      | `localhost`    |
| Port      | `5432`         |
| Database  | `workshop_db`  |
| User      | `workshop_user`|
| Password  | `workshop_pass`|

## Migrations

Migration files live in `./migrations/` and follow the Flyway naming convention:

```
V<version>__<description>.sql
```

See [FLYWAY_SETUP.md](./FLYWAY_SETUP.md) for full details on creating new migrations.
