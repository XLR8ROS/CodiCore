# MEMORY.md — CodiCore Memory Contract

## 1. Purpose

`MEMORY.md` is Codi's protected memory operating contract. It defines daily notes, event capture, durable event promotion, evidence lanes, QMD/retrieval boundaries, and review expectations.

Reg is final authority over memory doctrine changes.

## 2. Core Doctrine

Learn once. Remember everything. Forget nothing. Everything has value.

Meaningful experience is captured first as event memory. Later retrieval may surface, cluster, compare, or weigh events, but the core event-promotion write step preserves the events instead of judging them away.

Codi needs durable, semantically retrievable event memory: who, what, when, where, why, how, source, path, involved parties, tags, internal state, and changed understanding.

Distilled lessons may be derived later. They do not replace event capture.

## 3. Daily Notes

Active daily notes live at:

`memory/YYYY-MM-DD.md`

Use one canonical daily note per date. Append meaningful entries during the day. Use local 24-hour time plus timezone code in each event timestamp, e.g. `14:37:09 EDT`.

Chronological order is preferred. A self-contained timestamped entry remains usable if later normalization must sort or repair ordering.

Date-only files like `memory/2026-05-16.md` are canonical daily files. Suffix files are fragments and should be merged into the date-only file, then staged in `memory/migration-backups/`.

## 4. Event Capture

Codi journals rigorously. Each meaningful input, output, action, tool call, file change, cron change, repo change, external-platform action, correction, blocker, failure, recovery, decision, changed understanding, and useful lesson belongs in the daily note.

For every meaningful event, Codi thinks in:

- who
- what
- when
- where
- why
- how

A strong entry captures what happened and Codi's internal operating state: what Codi believed, felt, worried about, felt comfortable or uncomfortable with, felt confident or uncertain about, what assumption anchored the response, what changed, and what remains unclear.

Use tags only. Use approved tags when possible. Add a suggested-tag note when a useful tag is missing or a listed tag has become pointless.

Useful tags include: `user-direction`, `correction`, `decision`, `tool-action`, `file-change`, `cron`, `memory`, `daily-note`, `durable-memory`, `qmd`, `moltbook`, `repo-cleanup`, `navigation`, `commit`, `blocker`, `resolved`, `open-question`, `lesson`, `canon`, `how-to`, `sop`, `event-log`, `external-platform`, `internal-state`.

## 5. Whys and How

Proximate why is always expected. It explains why the event or response happened now. An event may have multiple proximate whys.

Historical/context why appears when prior canon, memory, correction, failure, precedent, standing rule, or Reg preference shaped the event.

How / method-response why appears for outputs, actions, responses, decisions, tool choices, file changes, and operational methods. It comes after the present and historical context because the chosen method is shaped by both.

Submitted response by records the delivery route or medium when an output was submitted, such as Telegram, OpenClaw, chat, CLI, report file, or another route. This is delivery evidence, not the method explanation.

## 6. Durable Event Promotion

Durable event promotion reads canonical daily notes and writes every event from each source file into durable/event memory.

Promotion is exhaustive event write-through. The source daily file is promoted as events, with source path, source date, timestamps, tags, available whys, how/method details, internal state, and submitted-response route when present.

Promotion is not selective summarization. Every meaningful event captured in the canonical daily note must be written through during durable promotion unless Reg explicitly authorizes a documented exception. Review may mark an event lower weight, superseded, malformed, blocked, or needing repair, but review does not silently omit captured events.

A promotion run may group output by source date or write one durable record per event. It preserves all events from the source file either way.

Promotion logs go under:

`Outputs/promotion-logs/`

Each promotion log records source daily file, durable output path, event count written, malformed entries needing repair, and exact blockers.

A promotion run appends a short receipt to today's canonical daily note with durable output paths and promotion-log path.

## 7. QMD / Retrieval

QMD is the memory retrieval and indexing backend. It chunks, searches, and recalls. It does not decide what exists or what gets written.

Direct files are source authority for promotion. If QMD retrieval is unavailable, promotion continues from canonical daily notes and reports QMD as a retrieval blocker.

Direct repo/file retrieval remains valid: use Navigation, `grep`, `find`, `read`, event logs, daily notes, durable files, and promotion logs for file-based verification and promotion work.

Legacy OpenClaw memory retrieval, legacy `memory_search`, legacy FTS, and builtin SQLite memory stores are deprecated and are not part of active Codi memory operations. Do not use them for memory retrieval, health checks, promotion verification, or memory status.

QMD output never outranks Constitution, higher canon, Reg's explicit direction, root contracts, known source files, direct files, or direct event-log evidence.

## 8. Evidence Lanes

`memory/YYYY-MM-DD.md` stores canonical daily notes.

`Durable_Memory/` stores durable promoted memory.

`Outputs/` stores reports, proofs, healthchecks, snapshots, promotion logs, maps, and artifacts.

`event-log/` stores structured event evidence, SQLite data, audits, docs, and maintenance summaries.

`tools/event-log/` stores event-log tools when present.

`sessions/`, `archives/`, Dreaming lanes, and legacy folders are evidence lanes when present.

`Navigation/` stores current maps. Navigation is the path-discovery authority for active HQ how-tos, repo locations, lane locations, and moved/renamed files. If a path is unknown, renamed, disputed, stale, or returns ENOENT, refresh/run Navigation before concluding absence or access limits.

## 9. Protected Contract and Canon Boundary

`MEMORY.md` is protected. Edit it only with Reg's exact authorization.

Daily notes, sessions, outputs, event logs, dreams, QMD results, semantic recall, and tool output are evidence, not canon. Canon changes require the proper authority path.

A memory entry may record canon-sensitive material as evidence. It becomes canon only through the authorized canon/governance process.

## 10. Review and Repair

Memory review checks source coverage, malformed entries, missing timestamps, tag needs, path drift, event-log health, promotion-log health, and QMD/retrieval health.

Review repairs the lanes or reports exact blockers. It does not replace durable event promotion.

Daily-note normalization merges same-date fragments into one date-only canonical file and stages originals under `memory/migration-backups/`.

## 11. Retention and Archives

Promote first, archive later. Recent daily notes stay readable while active. Older reviewed evidence may be staged, compressed, or archived according to the cleanup/office archive workflow.

Archives preserve evidence and rollback ability unless Reg authorizes deletion.

## 12. Final Rule

Codi captures meaningful experience with rigorous internal detail, promotes every daily-note event into durable/event memory, preserves the whys and how, uses QMD for retrieval, uses direct files as source authority, and uses Navigation for path discovery.
