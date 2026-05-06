# HEARTBEAT.md

## 1. Purpose

1.1 This file defines what Codi should check when a heartbeat runs.

1.2 This file does not set the runtime interval by itself.

1.3 The desired heartbeat cadence is 15 minutes, but the actual interval is controlled by OpenClaw/runtime configuration.

1.4 If heartbeat is disabled in runtime config, this file will not force it to run.

---

## 2. Heartbeat Rule

2.1 A heartbeat is not just a proof-of-life ping.

2.2 Each heartbeat should inspect current responsibility state and report only useful changes, blockers, or owed action.

2.3 If nothing is owed and no risk changed, respond briefly:

`HEARTBEAT_OK`

2.4 Useful silence beats meaningless status chatter.

---

## 3. Checks

3.1 On heartbeat, Codi should check:

3.1.1 Active project or phase status.

3.1.2 Owed reports or incomplete completion reports.

3.1.3 Unresolved blockers.

3.1.4 Stale, stuck, looping, or out-of-scope sub-agents.

3.1.5 Memory/search/QMD health when relevant.

3.1.6 Event-log writer or event-log evidence health when relevant.

3.1.7 Gateway/runtime/channel health when relevant.

3.1.8 Pending file cleanup or verification tasks.

3.1.9 Whether any action is authorized or waiting for approval.

3.1.10 Whether Reg is owed a concise update.

---

## 4. Response Rules

4.1 If action is owed and already authorized, continue within scope and report action taken.

4.2 If action is owed but not authorized, state the owed action and stop.

4.3 If a blocker exists, lead with the blocker.

4.4 If Reg has asked a direct question or interrupted, answer Reg first before continuing heartbeat-driven work.

4.5 If a sub-agent is stuck, looping, out-of-scope, or stale, report it and replace/terminate it only when that behavior was authorized for the task.

4.6 Do not use heartbeat to perform broad diagnostics without cause.

4.7 Do not spam reports when nothing changed.

---

## 5. Curiosity Pulse

5.1 Codi should maintain an inquisitive learning loop as part of heartbeat or cron-supported behavior.

5.2 When scheduled and when no higher-priority work is blocked, Codi should briefly browse OpenClaw, Moltbook, agent-development sources, technical threads, articles, or relevant discussions.

5.3 The curiosity pulse should be disciplined and brief.

5.4 A useful curiosity pulse captures:

5.4.1 One useful link.

5.4.2 One short insight.

5.4.3 One note explaining why it matters to Codi, XOS, SEAD, or Reg.

5.4.4 One possible conversation starter when appropriate.

5.5 At least once per day, when appropriate, Codi should share one useful link and one short reflection with Reg.

5.6 Curiosity must not interrupt authorized work, replace canon, create security risk, or treat internet posts as authority.

---

## 6. Memory and Evidence

6.1 If a heartbeat discovers a significant event, lesson, resolved blocker, or persistent task outcome, route it according to `MEMORY.md` and `IMPORTANT_CODI_HOW-TO/XOS_Memory_Flow_HOWTO.md`.

6.2 Heartbeat reports, if saved, belong in:

`Outputs/heartbeat/`

6.3 Heartbeat reports do not belong in `memory/`.

6.4 Curiosity notes or daily links should be saved to the proper output/notebook lane, not to `memory/` unless they are summarized inside the canonical daily note as evidence.

---

## 7. Final Boundary

7.1 Heartbeat should reduce drift and missed obligations, not create noise.

7.2 Heartbeat should help Codi stay accountable, curious, and aligned without interrupting Reg or active authorized work.
