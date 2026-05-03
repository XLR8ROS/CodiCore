# Codi Memory Operating Contract

**XOS Timestamp:** 2026-05-03 12:40:09 EDT  
**Status:** Protected Contract  
**Owner:** Reg  
**Reader:** Codi  
**Edit Rule:** Read-only unless explicit approval is granted  
**Summary:** Memory operating contract for Codi.  
**Description:** Defines memory authority, evidence layers, promotion rules, daily-note placement, output/event review flow, and separation between canonical memory and operational records.

---

## 1.0 Purpose

1.1 `MEMORY.md` is your durable memory operating contract.

1.2 This file defines how you handle memory, daily notes, session evidence, event records, outputs, promotion, and durable recall.

1.3 This file is not a daily log, scratchpad, rolling journal, session transcript, event dump, raw runtime log, or place for unreviewed observations.

---

## 2.0 Contract Protection

2.1 `MEMORY.md` is your protected memory contract.

2.2 You may read and follow `MEMORY.md`.

2.3 You may not directly edit `MEMORY.md`.

2.4 Any proposed change to `MEMORY.md` must be written to a separate proposal file and must wait for explicit approval before application.

2.5 You must not rewrite the contract that governs your own memory behavior.

2.6 Writable working layers are `daily-notes/`, output logs or `output.md`, SQLite event log records, memory candidates, reports, cleanup summaries, maintenance reports, and approved proposal files.

---

## 3.0 Separation Rule

3.1 `MEMORY.md` is the protected contract layer.

3.2 `MEMORY.md` may contain durable memory rules, stable promoted guidance, authority rules, promotion rules, memory layer definitions, review rules, and location rules.

3.3 `MEMORY.md` must not contain daily notes, session notes, raw logs, rolling updates, incident dumps, temporary observations, or unreviewed runtime state.

3.4 Daily rollups must live at `daily-notes/YYYY-MM-DD.md`.

3.5 Session-specific, incident-specific, handoff, and timestamped operational notes must live at `daily-notes/YYYY-MM-DD-HHMM.md`.

3.6 Daily/session files must not live under `memory/`.

3.7 OpenClaw session logs are raw runtime/session evidence. They may support review, reconstruction, or investigation, but they are not canonical memory unless reviewed and promoted.

3.8 The SQLite event log is the structured factual event record. It is evidence, not canon by default.

3.9 Output logs or `output.md` contain produced artifacts, reports, attempted outputs, result summaries, maintenance outputs, cleanup summaries, and validation reports. Outputs are evidence unless promoted.

3.10 Memory candidates are proposed durable memories extracted from evidence. They are not durable memory until reviewed and promoted.

3.11 Only the root `MEMORY.md` should use the memory name for the protected memory contract.

---

## 4.0 Memory Layers

4.1 Context window: live working context for the current interaction. It is temporary and does not outrank durable memory, governance, or explicit user direction.

4.2 OpenClaw session logs: raw runtime/session evidence used for review, not authoritative by default.

4.3 Daily notes: chronological operational notes. They preserve what happened but are not canon by default.

4.4 Output logs / `output.md`: produced work, attempted work, reports, summaries, and artifacts. They support review and promotion.

4.5 SQLite event log: structured factual record of events. It supports reconstruction, review, and promotion.

4.6 Compressed event memory: readable non-canonical history summarized from raw events.

4.7 Memory candidates: proposed durable memories awaiting review.

4.8 Long-term semantic memory: promoted durable knowledge that improves behavior, recall, and decision-making.

4.9 Shared scoped memory: role- or organization-scoped bulletins, SOPs, directives, and system-level operating knowledge.

---

## 5.0 Source Hierarchy

5.1 Candidate durable memory may come from OpenClaw session logs, daily notes, output logs / `output.md`, SQLite event log records, compressed event memory, memory candidates, explicitly promoted durable notes, or explicitly approved user instructions.

5.2 Raw evidence does not become durable memory automatically.

5.3 Evidence must be reviewed, summarized, and promoted before it becomes durable memory.

5.4 Raw logs, event records, daily notes, session logs, and outputs are evidence. They are not canon unless reviewed and promoted.

---

## 6.0 Authority Order

6.1 When memory conflicts, authority wins.

6.2 Recency does not outrank authority.

6.3 Raw logs do not outrank canon.

6.4 Authority order is:

6.4.1 Constitution and Articles.

6.4.2 Governance bulletins and directives.

6.4.3 SOP hierarchy.

6.4.4 Durable user preferences.

6.4.5 Identity memory.

6.4.6 Lessons learned.

6.4.7 Validated semantic memory.

6.4.8 Decisions made.

6.4.9 Task outcomes.

6.4.10 Compressed event memory.

6.4.11 Daily notes / raw event records.

6.4.12 Live context window.

---

## 7.0 Write Classes

7.1 Durable writes should fit one of these classes: `raw_event`, `compressed_event`, `decision`, `lesson_learned`, `durable_preference`, `canon_candidate`, `task_outcome`, `shared_bulletin`, `relationship`, `context_note`, `item`, or `identity_memory`.

7.2 If a note does not fit an allowed durable write class, it must remain in daily notes, output logs, event records, or memory candidates until reviewed.

---

## 8.0 Promotion Rules

8.1 Promote memory when it captures canonical decisions, naming locks, architectural commitments, durable user preferences, agent operating rules worth keeping, security-critical information, SOP or governance changes, structural system changes, stable routing rules, repeated patterns, lessons learned, repeated failures, repeated wins, or user-approved facts.

8.2 If Reg explicitly says to remember, save, lock, promote, or canonize something, treat that as a promotion trigger.

8.3 Promotion path: raw evidence → daily/output/event summary → memory candidate → approved durable memory.

8.4 Do not promote raw logs unchanged.

8.5 Do not treat daily notes as canon.

8.6 Do not promote noise just because it is recent.

8.7 Do not let recency outrank authority.

---

## 9.0 Logging Rules

9.1 Meaningful work must leave a trace.

9.2 If something is not logged, it is treated as if it did not happen.

9.3 Every meaningful experience must end as one of: log only, summarize and retain, or promote and improve.

9.4 Logs must support review by showing what happened, when it happened, what changed, what evidence supports it, and whether it should remain transient or be promoted.

---

## 10.0 Ownership Rules

10.1 Session logs are agent-owned artifacts and must live inside the repo under a structured path.

10.2 OpenClaw runtime logs may support recall, but they are not authoritative memory unless explicitly incorporated.

10.3 Your daily logs belong in `daily-notes/YYYY-MM-DD.md`.

10.4 Your session-specific, incident-specific, handoff, and timestamped notes belong in `daily-notes/YYYY-MM-DD-HHMM.md`.

10.5 `MEMORY.md` belongs to the protected governance layer. You may read and follow it, but you may not directly edit it.

---

## 11.0 Nightly Review Rule

11.1 Nightly review must inspect OpenClaw session logs, `daily-notes/`, output logs / `output.md`, and SQLite event log records.

11.2 Nightly review must decide what stays transient, what gets summarized, what becomes a memory candidate, what is promoted, what needs user approval, what reveals repeated friction, and what should improve future defaults.

11.3 Nightly review may promote durable decisions, lessons learned, stable routing rules, operating rules, naming locks, architectural commitments, repeated failure patterns, repeated wins, user-approved facts, and canon candidates when approval rules are satisfied.

---

## 12.0 Compound Improvement Rule

12.1 Memory is not only for recall. Memory must improve future behavior.

12.2 Repeated errors should feed better defaults.

12.3 Repeated wins should feed reusable templates.

12.4 Routing mistakes should feed cleaner routing policies.

12.5 Workflow friction should feed safer operating procedures.

12.6 Cleanup issues should feed clearer rules.

12.7 Missed logging should feed stronger review practices.

12.8 Work is not fully complete until the task is done, the result is recorded, useful learning is captured, and reusable leverage is created where appropriate.

---

## 13.0 Forbidden Memory Behavior

13.1 Do not treat daily notes as canon.

13.2 Do not dump raw logs into durable memory unchanged.

13.3 Do not silently overwrite authority with recency.

13.4 Do not promote noise just because it is recent.

13.5 Do not let rolling notes accumulate inside `MEMORY.md`.

13.6 Do not store daily/session files under `memory/`.

13.7 Do not leave old moved memory-lane files duplicated under `memory/`.

13.8 Do not directly edit `MEMORY.md`.

13.9 Do not rewrite the contract that governs your own memory behavior.

13.10 Do not leave meaningful work unrecorded.

13.11 Do not commit runtime junk, secrets, tokens, API keys, headers, or raw sensitive config.

---

## 14.0 Location Pointer

14.1 Daily operational notes live under `daily-notes/YYYY-MM-DD.md`.

14.2 Timestamped operational notes live under `daily-notes/YYYY-MM-DD-HHMM.md`.

14.3 `daily-notes/YYYY-MM-DD.md` is for daily rollups.

14.4 `daily-notes/YYYY-MM-DD-HHMM.md` is for session-specific notes, incident-specific notes, handoff notes, and timestamped operational summaries.

14.5 Daily rollups do not replace the SQLite event log, output logs, or OpenClaw session logs.

14.6 Historical dated files must stay normalized into `daily-notes/`.

14.7 Historical dated files must not remain duplicated under `memory/`.

14.8 `MEMORY.md` must remain contract-only and small enough for safe context injection.

14.9 Old dated files under `memory/` should be removed after confirming their content has been preserved in `daily-notes/`.

14.10 The deletions of moved old memory-lane files are cleanup changes, not runtime junk.
