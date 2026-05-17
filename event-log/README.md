---
Summary: SQLite-backed event-log evidence lane for CodiCore memory capture.
Description: Defines the active event-log paths, canonical daily-note relationship, runtime SQLite requirements, and the relationship between event logging, daily-note journaling, and durable event promotion.
---

# CodiCore Event Log

## Purpose

The event-log lane provides structured SQLite-backed event evidence for CodiCore.

The event log supports memory capture, operational traceability, verification, and later retrieval.

The canonical daily note remains the primary human-readable memory lane.

Canonical daily notes live at:

- `memory/YYYY-MM-DD.md`

The event log supports the daily note. It does not replace daily-note journaling.

---

## Active Paths

- Event DB: `event-log/events.sqlite`
- Event-log runtime files: `event-log/run/`
- Event-log source logs: `event-log/source/`
- Event-log documentation: `event-log/README.md`

Canonical daily-note lane:

- `memory/YYYY-MM-DD.md`

---

## Daily-Note Relationship

Daily notes capture meaningful timestamped events.

Each meaningful event should capture:

- who
- what
- when
- where
- tags
- proximate why
- historical/context why when relevant
- how/method when there is an output, action, response, tool choice, or decision

Proximate why explains why the event/action happened now.

Historical/context why explains which prior canon, memory, correction, precedent, lesson, failure, or standing rule shaped the event.

How/method explains the operational method, reasoning path, tool choice, response construction, or execution path chosen for the action/output.

Submitted response by records the delivery channel or medium, such as Telegram, OpenClaw, chat, CLI, report file, or other output route.

Use approved tags only. Suggested tag changes may be proposed when a genuinely useful new tag or cleanup need is identified.

---

## Durable Event Promotion

Durable event promotion reads canonical daily notes and writes every event from the canonical daily note into durable/event memory.

Durable promotion is exhaustive event write-through.

QMD/QMB supports retrieval, chunking, semantic search, and recall. It does not decide what exists or what gets promoted.

At durable-promotion time, preserve available:

- timestamps
- tags
- proximate why
- historical/context why
- how/method details

Promotion logs should record:

- source daily-note path
- durable output path
- event count
- malformed entries needing repair
- blockers encountered during promotion

---

## Runtime Requirements Per SQLite Connection

These settings must be applied on each SQLite connection used by the runtime/application:

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
- `synchronous=NORMAL` is the current balance between durability and speed.

---

## Runtime Bootstrap

Use the runtime bootstrap module to open the SQLite DB, apply required PRAGMAs, and verify the live connection state.

```bash
node tools/sqlite_bootstrap.js
```

Expected verification output includes:

- `DB_PATH=/absolute/path/to/event-log/events.sqlite`
- `PRAGMA foreign_keys=1`

---

## Event-Log Reliability Boundary

The event log is a structured evidence lane.

Canonical daily-note journaling continues even when:

- the event-log writer is blocked
- the runtime bootstrap fails
- SQLite is unavailable
- event-log verification is incomplete
- runtime trigger paths are degraded or unverified

When event-log writing is degraded or unavailable, continue capturing meaningful events directly into the canonical daily note.

---

## Scope

The current SQLite event log is the structured operational event-evidence lane for CodiCore.

It supports:

- event evidence
- operational traceability
- retrieval support
- runtime verification
- durable event promotion support

Future ranking, weighting, semantic interpretation, lesson distillation, and retrieval priority are separate downstream systems and not part of the core event-write step.
