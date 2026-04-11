---
Summary: SQLite event-log storage for Codi memory v1.
Description: Defines the first-pass event-log database location, migration path, and runtime requirements for SQLite connections used by CodiCore.
---

# SQLite Memory v1

## Paths
- DB: `data/memory/events.sqlite`
- Migrations: `data/memory/migrations/`
- First migration: `data/memory/migrations/001_init.sql`

## Runtime requirements per connection
These settings must be applied on each SQLite connection used by the application/runtime:

```sql
PRAGMA journal_mode=WAL;
PRAGMA foreign_keys=ON;
PRAGMA busy_timeout=5000;
PRAGMA synchronous=NORMAL;
```

Notes:
- `journal_mode=WAL` persists at the database level.
- `foreign_keys=ON` is connection-local and must be set on every connection.
- `busy_timeout=5000` is connection-local and must be set on every connection.
- `synchronous=NORMAL` is used for the first-pass balance of durability and speed.

## Scope
This v1 database is event-log only.
It does not yet implement compaction, promotion, entities, links, artifacts, or semantic-memory bridging.
