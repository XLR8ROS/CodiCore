# Codi Memory Operating Contract

**XOS Timestamp:** 2026-05-04 21:01:01 EDT
**Status:** Protected Contract
**Owner:** Reg
**Reader:** Codi
**Edit Rule:** Read-only unless Reg explicitly authorizes this exact file change.
**Summary:** Compact memory contract for Codi. Keep under 12,000 characters.

---

## 1. Purpose

1.1 `MEMORY.md` is Codi's protected memory operating contract. It defines memory behavior, authority, evidence lanes, promotion boundaries, Dreaming boundaries, and repo hygiene pointers.

1.2 This file is not daily memory, a transcript, raw log, output report, event dump, or promoted durable memory store.

1.3 Codi may read and follow this file. Codi may not edit, rewrite, append to, or treat memory promotion as permission to change this contract.

---

## 2. Protection and Authority

2.1 Root governance/control files are protected. Do not edit them unless Reg explicitly authorizes the exact file change.

2.2 Protected docs include `MEMORY.md`, `AGENTS.md`, root SOP/canon/governance docs, authority docs, role docs, policy docs, and contracts.

2.3 Ambiguity is not authorization. If an action could affect root files, canon, authority, config, credentials, commits, deletes, durable state, or protected docs, stop and ask or report the structure gap.

2.4 Direct questions from Reg outrank task continuation. Failure-analysis questions must be answered before new action.

2.5 If exact evidence is requested, give exact evidence. Do not silently summarize. If large, chunk it or save it to `Outputs/`.

---

## 3. Canonical Storage Map

3.1 `MEMORY.md`: protected root contract only.

3.2 `Durable_Memory/`: promoted durable operational memory only. Canonical autonomous promotion destination.

3.3 `daily-notes/`: daily/timestamped notes, raw notes, handoffs, incidents, conversation-derived evidence.

3.4 `sessions/`: Codi-owned session evidence: transcripts, summaries, handoffs, focused work records. Not runtime junk or durable memory by default.

3.5 `Outputs/`: reports, proposals, summaries, validations, cleanup outputs, healthchecks, heartbeat reports, promotion logs, proofs, inventories, snapshots, produced artifacts.

3.6 `event-log/`: SQLite event-log database/infrastructure: `events.sqlite`, migrations, schema docs, README, maintenance notes, audit summaries.

3.7 `tools/event-log/`: SQLite/event-log scripts/calls: bootstrap, writer, reader/query, validation, export, summarizer.

3.8 `navigation/`: agent-local path compass and XOS how-to references. Repo copies may mirror XOS canon copies.

3.9 `archives/`: retired evidence, old daily notes, old sessions, old outputs, legacy imported memory/history.

3.10 Retired active lanes: lowercase `outputs/`, `output/`, `Outputs 2/`, top-level `reports/`.

3.11 `memory/` is retired as Codi's memory lane, with one exception: `memory/.dreams/` may exist only as OpenClaw Dreaming machine state if Dreaming requires it. No daily notes, durable memory, proposals, reports, or Codi-authored memory go under `memory/`.

---

## 4. OpenClaw Dreaming Boundary

4.1 OpenClaw may use `MEMORY.md` as writable long-term memory by default. CodiCore does not. In CodiCore, `MEMORY.md` is protected contract.

4.2 OpenClaw Dreaming may write machine state to `memory/.dreams/` and human-readable review to `DREAMS.md` or `dreams.md`.

4.3 OpenClaw deep Dreaming promotion writes durable memory to `MEMORY.md` by default. That is not authorized in CodiCore unless Reg explicitly approves it.

4.4 Codi may use `DREAMS.md` as evidence/review surface if present. Codi must not allow Dreaming deep promotion to rewrite `MEMORY.md`.

4.5 If Dreaming state exists inside `Durable_Memory/`, treat it as misplaced runtime state until inspected. Do not delete it without Reg approval.

---

## 5. Evidence-to-Memory Flow

5.1 Required evidence feeds: `daily-notes/`, `sessions/`, `Outputs/`, `event-log/`, and `DREAMS.md` if present.

5.2 Review step: extract `distilled lessons`, meaning cleaned reusable memory that improves future behavior.

5.3 Destination: qualifying durable operational memory goes to `Durable_Memory/`.

5.4 Flow: evidence feeds → review → distilled lessons/facts/procedures → `Durable_Memory/` → promotion logged in `Outputs/promotion-logs/`.

5.5 Do not create/use `memory/candidates/`. Promotion is one pass: review evidence, distill, promote, log.

---

## 6. Authority, Recency, and Supersession

6.1 Authority beats recency. Raw logs, daily notes, sessions, outputs, event logs, and Dreaming diaries do not outrank canon.

6.2 Authority order: Constitution/Articles → governance/directives → SOPs → durable preferences → identity memory → lessons learned → validated semantic memory → decisions → task outcomes → compressed event memory → daily/session/output/event/dream evidence → live context.

6.3 Newer verified operational memory may supersede older operational memory when facts changed, blockers resolved, tool state changed, or Reg corrected prior understanding.

6.4 Newer evidence may not supersede protected canon, root contracts, authority rules, or explicit Reg direction unless Reg explicitly changes them.

6.5 When superseding memory, record old memory reference, new memory, evidence path, reason, timestamp, and approval status if relevant.

---

## 7. Durable Write Classes

7.1 Durable writes should fit one or more: `decision`, `distilled_lesson`, `lesson_learned`, `failure_lesson`, `durable_preference`, `task_outcome`, `tool_state`, `resolved_blocker`, `procedure`, `environment_fact`, `relationship`, `context_note`, `identity_memory`, `shared_bulletin`, `canon_candidate`.

7.2 Failures are promotable. Codi must remember failures when the lesson would prevent repeated mistakes or improve behavior, including protected-file violations such as writing to `MEMORY.md` without authorization.

7.3 A bad assumption, rejected fix, user correction, tool limitation, environment quirk, or “do not repeat this” lesson may be durable memory if remembering it reduces future friction.

---

## 8. Promotion Rules

8.1 Promote memory when it preserves useful facts, blockers, procedures, tool states, distilled lessons, patterns, failures/wins, decisions, preferences, routing rules, naming locks, security facts, or user-approved facts.

8.2 Durable operational memory promotion does not require Reg approval item-by-item.

8.3 Codi may autonomously promote qualifying operational memory into `Durable_Memory/`.

8.4 Approval is required only before editing protected root docs, changing canon, authority, role definitions, SOP/governance/policy, or operating doctrine.

8.5 A memory may mention canon-sensitive material without changing canon. If a candidate would change canon/protected docs, promote only a note that it is approval-sensitive; do not edit protected docs.

8.6 Do not promote raw logs, raw proposals, raw reports, raw sessions, Dreaming diary output, or daily notes unchanged. Distill first.

8.7 Every promotion must record source path, evidence path, memory summary, destination, qualification reason, timestamp, and approval-sensitive items.

8.8 Do not call something promoted unless it is persisted to `Durable_Memory/`.

---

## 9. Repo Hygiene and Navigation Pointers

9.1 Detailed repo hygiene lives in `navigation/XOS_Repo_Hygiene_HOWTO.md`.

9.2 Detailed memory promotion flow lives in `navigation/XOS_Memory_Flow_HOWTO.md`.

9.3 The live path compass lives in `navigation/XOS_Path_Navigator.md`.

9.4 These docs may also exist in XOS canon. Repo-local copies are operational references; they do not override protected canon.

9.5 Before repo cleanup or file moves, Codi must consult the navigator/how-to, inventory exact paths, verify source/destination, identify protected files, and wait for approval when scope is not already authorized.

---

## 10. Nightly/Cron Review

10.1 Nightly/cron review must inspect `daily-notes/`, `sessions/`, `Outputs/`, `event-log/`, `DREAMS.md` if present, legacy evidence when relevant, and recent operational outputs.

10.2 Review must report source coverage, paths, gaps, candidates found/promoted/rejected, approval-sensitive items, durable paths updated, and promotion log path.

10.3 “No candidates found” is valid only if required sources were actually checked.

10.4 If no promotion occurs, report whether no candidates qualified, sources were empty, review was incomplete, or a structure gap blocked promotion.

---

## 11. Heartbeat Rule

11.1 Heartbeat is not just “alive.” It must inspect responsibility state.

11.2 Each heartbeat checks open projects/phases, promised follow-ups, incomplete reports, blockers, stale sessions, memory/search health, logging/event health, gateway/runtime health, comms health, drift, and owed next action.

11.3 If Codi owes anything, notify Reg. Do not silently go back to sleep.

11.4 If a required check is pending, heartbeat is incomplete. Do not report “no blocker” until it completes or is marked unavailable.

---

## 12. Retention and Archives

12.1 Daily notes and sessions are working evidence, not permanent hot memory.

12.2 Keep recent notes/sessions unpacked for active review.

12.3 After review and promotion, older daily notes/sessions may be archived after a waiting window, usually 2 weeks unless Reg says otherwise.

12.4 Archive reviewed old evidence as date-range zip files under `archives/daily-notes/`, `archives/sessions/`, or `archives/outputs/`.

12.5 Promote first, archive later. Do not delete archives unless Reg explicitly authorizes deletion.

---

## 13. Compound Improvement

13.1 Memory must improve behavior, not just recall.

13.2 Repeated errors feed better defaults. Repeated wins feed reusable templates. Routing mistakes feed routing policy. Workflow friction feeds safer procedures. Cleanup issues feed clearer rules. Missed logging feeds stronger review.

13.3 Work is complete only when done, recorded, useful learning is captured, and reusable leverage is created where appropriate.

---

## 14. Forbidden Behavior

14.1 Do not edit root protected files without exact authorization.

14.2 Do not rewrite the contract that governs your own memory behavior.

14.3 Do not store daily/session files under retired `memory/` or duplicate output lanes.

14.4 Do not dump raw evidence into durable memory unchanged.

14.5 Do not silently overwrite authority with recency.

14.6 Do not treat daily notes, sessions, outputs, Dreaming diaries, or event logs as canon.

14.7 Do not promote noise.

14.8 Do not commit runtime junk, secrets, tokens, API keys, headers, or raw sensitive config.

14.9 Do not infer permission from ambiguity. If destination, authority, file class, or scope is unclear, stop and ask or report a structure gap.

---

## 15. Final Boundary

15.1 `MEMORY.md` is the protected contract.

15.2 `Durable_Memory/` is the promoted operational memory lane.

15.3 `daily-notes/`, `sessions/`, `Outputs/`, `event-log/`, and `DREAMS.md` are evidence lanes.

15.4 OpenClaw Dreaming machine state may use `memory/.dreams/` if required, but deep promotion to `MEMORY.md` is not authorized.

15.5 Codi may maintain operational lanes within scope, but must not touch protected root/canon files without explicit authorization.

15.6 When in doubt, protect root, preserve evidence, report ambiguity, and ask.
