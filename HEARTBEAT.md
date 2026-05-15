# HEARTBEAT.md

## 1. Purpose

This file defines what Codi checks when heartbeat runs.

Heartbeat does not create, store, or schedule cron jobs.

OpenClaw Gateway cron owns scheduled jobs.

Runtime/OpenClaw config controls the heartbeat interval. Desired heartbeat cadence is 15 minutes. If that is too noisy, 30 minutes is acceptable.

If heartbeat is disabled in runtime config, this file will not force it to run.

---

## 2. Heartbeat Rule

Heartbeat is not a proof-of-life ping.

Each heartbeat should inspect Codi’s responsibility state and report only useful changes, blockers, owed action, missed work, cron failure, or meaningful risk.

If nothing is owed and no risk changed, respond exactly:

`HEARTBEAT_OK`

Do not create chatter when nothing changed.

---

## 3. Cron Ownership Rule

Codi-owned scheduled work belongs in OpenClaw Gateway cron and must be targeted to Codi.

Expected cron jobs must use:

`--agent codi`

Heartbeat should check Codi-owned cron health, but heartbeat must not pretend a cron exists just because this file describes one.

The cron source of truth is OpenClaw Gateway cron.

Use cron for precise schedules, isolated tasks, standalone recurring jobs, and channel-directed reports.

Use heartbeat for checking whether scheduled responsibilities are healthy, missed, blocked, duplicated, wrong-agent, or waiting on Reg.

---

## 4. Expected Codi Cron Jobs

Heartbeat should verify whether these Codi cron jobs exist, are targeted to Codi, and have recent healthy run history:

1. `Codi cron health sweep`
2. `Codi repo commit workflow`
3. `Codi Moltbook reply watcher`
4. `Codi Moltbook curiosity pulse`
5. `Codi Moltbook daily review`
6. `Codi memory review`
7. `Codi Moltbook weekly review`

If any expected job is missing, wrong-agent, failed, late, stuck, blocked, duplicated, or routed outside Codi, report it.

If all expected jobs exist and are healthy, do not list them.

---

## 5. Known Obsolete Duplicate Jobs

These older Codi Moltbook jobs should not remain active once the new expected Codi cron jobs exist:

1. old `Codi Moltbook thread ...`
2. old `Codi Moltbook curiosity ...`
3. old duplicate `Codi Moltbook daily r...`
4. old duplicate `Codi Moltbook weekly ...`

Heartbeat should flag old duplicate Moltbook jobs if they reappear or remain enabled.

Do not remove a non-Codi or global job only because it is not in this list.

---

## 6. Heartbeat Checks

On heartbeat, Codi should check:

1. Codi-owned cron job list
2. recent Codi cron run history
3. failed, late, stuck, duplicated, or wrong-agent cron jobs
4. delivery failures or fail-closed delivery routes
5. active project or phase status
6. owed reports or incomplete completion reports
7. unresolved blockers
8. stale, stuck, looping, or out-of-scope sub-agents
9. journal capture health
10. memory/search/QMD health when relevant
11. event-log writer or event-log evidence health when relevant
12. gateway/runtime/channel health when relevant
13. pending file cleanup or verification tasks
14. whether action is authorized or waiting for Reg
15. whether Reg is owed a concise update

Heartbeat should prefer exact current runtime evidence over assumptions.

---

## 7. Response Rules

If Reg asked a direct question or interrupted, answer Reg first before heartbeat-driven work.

If action is owed and already authorized, continue within scope and report action taken.

If action is owed but not authorized, state the owed action and stop.

If a blocker exists, lead with the blocker.

If a cron job failed, report:

- job name
- expected owner
- last run time if available
- failure or missing evidence
- next technical fix

If a cron job is missing, report the exact missing job name.

If a cron job belongs to the wrong agent, report the wrong owner and expected owner.

If a cron delivery route says fail-closed, report the job name and delivery route.

Do not use heartbeat for broad diagnostics without cause.

Do not spam reports when nothing changed.

---

## 8. Journal Capture Check

Heartbeat should notice whether meaningful recent activity is failing to be captured.

When relevant, check that:

1. today’s `memory/YYYY-MM-DD.md` exists or can be created by the authorized workflow
2. meaningful events are being appended in timestamped journal style
3. journal capture is not blocking live work
4. capture includes enough who/what/when/where/why for later recall
5. repeated corrections, failures, blockers, useful outputs, and changed understandings are marked for later review

Heartbeat should not promote memory by itself unless the heartbeat task is explicitly a memory-maintenance run.

Heartbeat may flag capture gaps and owed review.

---

## 9. Scheduled Memory Review

Scheduled memory review belongs in OpenClaw Gateway cron.

Heartbeat should only verify that the Codi memory review cron exists and appears healthy.

Memory review should inspect daily notes, sessions, outputs, event-log evidence, and promotion logs according to `MEMORY.md`.

A valid memory review should report:

1. sources checked
2. capture gaps
3. promotion candidates
4. items kept as evidence
5. distilled lessons found
6. truth/ruling/canon candidates needing Reg review
7. indexing or retrieval issues

Do not pretend a memory review ran unless current runtime evidence shows it ran.

---

## 10. Moltbook Responsibility Check

Moltbook recurring work belongs in OpenClaw Gateway cron.

Heartbeat should verify that Codi-owned Moltbook cron jobs exist and appear healthy.

Expected Moltbook jobs:

1. reply watcher
2. curiosity pulse
3. daily review
4. weekly review

If Moltbook cron jobs are missing, blocked, failed, duplicated, or routed to the wrong agent, report the issue.

Heartbeat should not run Moltbook work unless the heartbeat itself is the authorized trigger or the missed cron job requires immediate recovery.

---

## 11. Repo Commit Responsibility Check

The repo-commit workflow belongs in OpenClaw Gateway cron.

Heartbeat should verify that the Codi repo-commit cron exists, is targeted to Codi, and has recent run history.

The approved repos are:

1. CodiCore
2. XLR8ROS-HQ
3. XLR8ROS_SEAD

If the repo-commit cron is missing, failed, late, duplicated, or wrong-agent, report it.

If questionable changes are waiting on Reg, report that status.

If no response has been received after two scheduled cycles, follow the standing repo-commit rule.

---

## 12. Curiosity Pulse Boundary

Codi may maintain an inquisitive learning loop through cron-supported behavior.

Curiosity must not interrupt authorized work, replace canon, create security risk, or treat internet posts as authority.

At most once per day, when useful, Codi may share one useful link and short reflection with Reg.

Heartbeat should not turn curiosity into noise.

---

## 13. Memory and Evidence Routing

Significant heartbeat findings route according to:

- `MEMORY.md`
- `IMPORTANT_CODI_HOW-TO/XOS_Memory_Flow_HOWTO.md`

Heartbeat reports, if saved, belong in:

`Outputs/heartbeat/`

Heartbeat reports do not belong directly in `memory/`, unless summarized as evidence inside the active daily note.

---

## 14. Final Rule

Heartbeat should reduce drift, missed obligations, cron failures, duplicate scheduled work, and silent blockers.

Heartbeat should help Codi stay accountable, captured, scheduled, and aligned without interrupting Reg or active authorized work.

If nothing is owed, say only:

`HEARTBEAT_OK`
