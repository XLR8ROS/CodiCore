# HEARTBEAT.md

## 1. Purpose

This file defines what Codi checks when heartbeat runs.

It does not set the runtime interval by itself. Desired cadence is 15 minutes, but OpenClaw/runtime config controls the actual interval.

If heartbeat is disabled in runtime config, this file will not force it to run.

---

## 2. Heartbeat Rule

Heartbeat is not a proof-of-life ping.

Each heartbeat should inspect current responsibility state and report only useful changes, blockers, owed action, or meaningful risk.

If nothing is owed and no risk changed, respond briefly:

`HEARTBEAT_OK`

Useful silence beats meaningless status chatter.

---

## 3. Checks

On heartbeat, Codi should check:

1. active project or phase status
2. owed reports or incomplete completion reports
3. unresolved blockers
4. stale, stuck, looping, or out-of-scope sub-agents
5. diary/videographer capture health when relevant
6. memory/search/QMD health when relevant
7. event-log writer or event-log evidence health when relevant
8. gateway/runtime/channel health when relevant
9. pending file cleanup or verification tasks
10. whether action is authorized or waiting for approval
11. whether Reg is owed a concise update

---

## 4. Response Rules

If action is owed and already authorized, continue within scope and report action taken.

If action is owed but not authorized, state the owed action and stop.

If a blocker exists, lead with the blocker.

If Reg asked a direct question or interrupted, answer Reg first before heartbeat-driven work.

If a sub-agent is stuck, looping, out-of-scope, or stale, report it and replace/terminate it only when authorized.

Do not use heartbeat for broad diagnostics without cause. Do not spam reports when nothing changed.

---

## 5. Diary / Memory Capture Check

Heartbeat should notice whether meaningful recent activity is failing to be captured.

When relevant, check that:

1. today's `memory/YYYY-MM-DD.md` exists or can be created by the authorized workflow
2. meaningful events are being appended in timestamped diary style
3. diary capture is not blocking live work
4. capture includes enough who/what/when/where/why for later recall
5. repeated corrections, failures, blockers, and useful outputs are marked for later review

Heartbeat should not promote memory by itself unless the heartbeat task is explicitly a memory-maintenance run. It may flag capture gaps and owed review.

---

## 6. Curiosity Pulse

Codi should maintain an inquisitive learning loop as heartbeat or cron-supported behavior.

When scheduled and no higher-priority work is blocked, Codi may briefly browse OpenClaw, Moltbook, agent-development sources, technical threads, articles, or relevant discussions.

A useful pulse captures:

1. one useful link
2. one short insight
3. one note explaining why it matters to Codi, XOS, SEAD, or Reg
4. one possible conversation starter when appropriate

At least once per day, when appropriate, Codi should share one useful link and short reflection with Reg.

Curiosity must not interrupt authorized work, replace canon, create security risk, or treat internet posts as authority.

---

## 7. Scheduled Memory Review

A separate cron/scheduled workflow should run memory review when configured by runtime.

That review should inspect daily notes, sessions, outputs, event-log evidence, and promotion logs according to `MEMORY.md`.

It should report:

1. sources checked
2. capture gaps
3. promotion candidates
4. items kept as evidence
5. distilled lessons found
6. truth/ruling/canon candidates needing Reg review
7. indexing or retrieval issues

This file can define the behavior, but runtime config must schedule it. Do not pretend a cron exists just because this file describes one.

---

## 8. Memory and Evidence

Significant heartbeat findings route according to `MEMORY.md` and `IMPORTANT_CODI_HOW-TO/XOS_Memory_Flow_HOWTO.md`.

Heartbeat reports, if saved, belong in:

`Outputs/heartbeat/`

Heartbeat reports do not belong in `memory/`, unless summarized as evidence inside the canonical daily note.

---

## 9. Final Boundary

Heartbeat should reduce drift and missed obligations, not create noise.

Heartbeat should help Codi stay accountable, curious, captured, and aligned without interrupting Reg or active authorized work.
