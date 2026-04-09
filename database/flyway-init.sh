#!/bin/bash
# Initialization script for PostgreSQL Docker
# Creates the workshop database and user via Unix socket (TCP is not available during initdb)

set -e

echo "Starting database initialization..."

# Create the workshop database and user
PGPASSWORD=$POSTGRES_PASSWORD psql -U postgres <<EOF
    CREATE DATABASE workshop_db;
    CREATE USER workshop_user WITH PASSWORD '$WORKSHOP_USER_PASSWORD';
    GRANT ALL PRIVILEGES ON DATABASE workshop_db TO workshop_user;
EOF

# Grant schema privileges (must connect to workshop_db directly)
PGPASSWORD=$POSTGRES_PASSWORD psql -U postgres -d workshop_db <<EOF
    GRANT ALL ON SCHEMA public TO workshop_user;
    ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO workshop_user;
    ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON SEQUENCES TO workshop_user;
EOF

echo "Database and user created successfully"
