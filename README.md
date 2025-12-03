# Bike Stores Database

## Overview
A small SQL-based project with schema and sample data for a bike retail store. It provides DDL and DML to create tables, seed example data, and run analytics queries.

**Repository Contents**
- `docker-compose.yml`: Docker Compose file to run a database service (used for local development).
- `initialize/`: SQL and helper scripts to create, seed, and drop the database.
- `scripts/`: Helper or example SQL queries (analytics, maintenance, etc.).

**Key files**
- `initialize/create-tables.sql`: Schema (tables, constraints, indexes).
- `initialize/insert-data.sql`: Sample data to populate the database.
- `initialize/drop-db.sql`: Script to drop the database/tables for a clean reset.
- `initialize/init-db.sh`: Script that runs the create + seed scripts (helps with initialization).
- `scripts/analyze.sql`: Example analytics queries you can run against the populated data.

## Prerequisites
- Docker & Docker Compose (recommended for quick local setup) or a running SQL Server instance.
- A SQL client that can connect to your database (e.g., `sqlcmd`, Azure Data Studio, DBeaver).

## Quick Start (Docker)
1. Copy `.env.example` to `.env` and edit credentials if needed.

2. Start the database container:

```bash
docker-compose up -d
```

3. Initialize the database (run the helper script in `initialize/`). From the repo root:

```bash
chmod +x initialize/init-db.sh
./initialize/init-db.sh
```

The `init-db.sh` script runs the schema and seed scripts (`create-tables.sql` and `insert-data.sql`). If the script requires container readiness, consider re-running it or inspecting the container logs.

## Manual Initialization (without `init-db.sh`)
You can also run SQL scripts manually with a SQL client. Example using `sqlcmd`:

```bash
# adjust host, port, user, and password to your setup
sqlcmd -S localhost,1433 -U sa -P '<YourPassword>' -i initialize/create-tables.sql
sqlcmd -S localhost,1433 -U sa -P '<YourPassword>' -i initialize/insert-data.sql
```

## Common Workflows
- Reset database: run `initialize/drop-db.sql` (careful — destructive), then re-run initialization.
- Run analytics: open `scripts/analyze.sql` in your SQL client and execute the queries against the database.

## Development Notes
- Add new schema or seed files under `initialize/` and update `init-db.sh` if you want them included automatically.
- Keep `scripts/` for frequently run queries and one-off maintenance tasks.

## Contributing
- Open an issue or submit a pull request with improvements to scripts or documentation.

## Contact
If you need help, open an issue in this repository.
