# XOS Memory Flow HOWTO

**XOS Timestamp:** 2026-05-05
**Scope:** CodiCore repo-local copy; mirrorable into XOS canon after review.
**Status:** Operational how-to, not root canon by itself.

## 1. Purpose

This how-to explains how Codi turns evidence into durable operational memory without editing protected root files or confusing retrieval with truth.

This file holds detailed memory procedure so `MEMORY.md` can stay a protected compact contract and point here for operational steps.

## 2. Authority boundary

- Higher XOS canon, Constitution/Articles, approved SOPs, and explicit Reg direction outrank this how-to.
- `MEMORY.md` is a protected memory contract, not a journal, raw note, vector index, or promotion target.
- Do not edit protected root docs, canon, role definitions, SOP/governance docs, policy, or operating doctrine without exact Reg approval.
- Daily notes, sessions, outputs, event logs, Dreaming diaries, and QMD results are evidence. They are not canon.

## 3. Evidence feeds

Review these feeds for memory promotion:

1. `memory/YYYY-MM-DD.md` — active OpenClaw daily-note lane; raw chronological evidence.
2. `sessions/` — session-specific records, handoffs, transcripts, summaries, focused work blocks.
3. `Outputs/` — proposals, reports, proofs, healthchecks, heartbeat reports, cleanup reports, inventories, snapshots, generated artifacts.
4. `event-log/` — structured SQLite event ledger and related evidence.
5. `DREAMS.md` or `dreams.md` — OpenClaw Dreaming review diary if present.
6. `daily-notes/` — legacy/retired daily-note source only if old notes still exist there.
7. `archives/` — older reviewed evidence when a task requires historical lookup.

`memory/.dreams/` is machine state, not human memory. Do not promote raw `.dreams` state.

## 4. Daily-note rule

Active daily notes live at:

`memory/YYYY-MM-DD.md`

Rules:
- exactly one active daily-note file per date
- append during the day
- put times, labels, and sources inside the file as headings
- do not create `memory/YYYY-MM-DD-something.md`
- do not store outputs, reports, proposals, logs, scripts, or distilled lessons directly in `memory/`

Daily notes are evidence for review, not durable memory and not canon.

## 5. Promotion flow

Evidence feeds → review → distill → write durable memory to `Durable_Memory/` → log promotion in `Outputs/promotion-logs/`.

No `memory/candidates/` folder. Promotion is one reviewed pass:
1. inspect evidence
2. identify candidates
3. distill into reusable memory
4. write to `Durable_Memory/`
5. log what was promoted and why

Do not call something promoted unless it is persisted to `Durable_Memory/`.

## 6. What qualifies

Promote when remembering it would reduce future friction, prevent repeated mistakes, improve routing, preserve a resolved blocker, document stable tool state, improve safety/speed, or preserve a durable user correction.

Qualifying memory types include:
- distilled lessons
- failure lessons
- user corrections
- stable procedures
- resolved blockers
- tool/environment facts
- durable preferences
- decisions/conventions
- “do not repeat this” lessons
- approval-sensitive canon candidates

## 7. What does not qualify unchanged

Do not promote raw evidence unchanged:
- raw daily notes
- raw logs
- raw reports
- raw proposals
- raw sessions
- raw event dumps
- raw Dreaming diary output
- raw QMD results

Distill first. Keep source paths.

## 8. QMD / retrieval rule

QMD is a retrieval/index tool, not a source of authority.

Use QMD when:
- recall is needed across durable memory or older evidence
- the relevant source path is unknown
- the task requires searching accumulated memory beyond injected context

Do not use QMD when:
- the answer is already in injected context
- Reg provided the file/path
- the task scope is a known folder
- direct file inspection is required for exact evidence
- canon/authority must be checked from source files

If QMD times out or fails:
1. report the retrieval failure briefly
2. continue with direct file inspection if paths are known
3. do not present QMD failure as proof that memory does not exist

QMD output cannot override Constitution, canon, `AGENT.md`, `AGENTS.md`, `MEMORY.md`, explicit Reg direction, direct source files, or official documentation.

For promotion, QMD may help locate candidates, but final promotion requires direct evidence paths.

## 9. Event-log use

The event-log is structured evidence for verifying timelines, task events, failures, state changes, and memory-review coverage.

Use event-log to:
- confirm whether an event occurred
- verify timestamps
- cross-check daily notes and outputs
- support promotion evidence
- detect gaps in logging

Do not treat event-log entries as canon. Event-log evidence must still be interpreted under authority rules.

When writing code against the event-log, use the repo’s canonical event-log tooling and bootstrap path if defined by `AGENT.md` or `tools/event-log/`.

## 10. Distillation examples

Bad raw memory:
“Reg got mad because Codi messed up inventory.”

Good distilled lesson:
“When Reg requests exact filesystem inventory, provide exact paths or chunk/save full output. Do not silently summarize.”

Bad raw memory:
“Codi edited MEMORY.md.”

Good distilled lesson:
“Memory promotion never authorizes editing protected root files such as MEMORY.md.”

Bad raw memory:
“QMD timed out.”

Good distilled lesson:
“If QMD retrieval times out, report the timeout and fall back to direct source files when paths are known. Do not loop on QMD.”

## 11. Approval boundary

Codi does not need Reg approval for routine durable operational memory promotion into `Durable_Memory/`.

Codi does need exact Reg approval before editing:
- protected docs
- canon
- authority rules
- role definitions
- policy
- SOP/governance docs
- operating doctrine
- root contracts

A memory may mention canon-sensitive material without changing canon. If a proposed memory would change canon, store it as an approval-sensitive candidate or create a proposal, not a root-doc edit.

## 12. Recency and supersession

Authority beats recency.

Newer verified operational memory may supersede older operational memory when:
- facts changed
- a blocker resolved
- a tool state changed
- Reg corrected old understanding
- a procedure was replaced by a better verified procedure

Newer evidence does not override protected canon or explicit Reg direction unless Reg explicitly changes it.

When superseding, record:
- old memory reference
- new memory
- source/evidence path
- reason
- timestamp
- approval status if relevant

## 13. Review cadence and hot window

For ordinary maintenance, start with the recent hot window:
- today and yesterday daily notes in `memory/`
- recent `sessions/`
- recent `Outputs/`
- recent event-log entries

Older evidence should be reached through `Durable_Memory/`, QMD, event-log queries, or archives when needed.

Cron/nightly review must report what sources were checked. “No candidates found” is valid only if required sources were actually inspected.

## 14. Dreaming boundary

OpenClaw Dreaming may produce `DREAMS.md` and machine state under `memory/.dreams/`.

Use `DREAMS.md` as evidence if present.
Do not promote raw `.dreams` machine state.
Do not allow Dreaming deep promotion to write into CodiCore `MEMORY.md` unless Reg explicitly authorizes it, because CodiCore uses `MEMORY.md` as protected contract.

## 15. Promotion log minimum

Each promotion log must include:

- sources reviewed
- source/evidence paths
- promoted memory summary
- destination path in `Durable_Memory/`
- qualification reason
- rejected items if relevant
- approval-sensitive items
- timestamp
- reviewer/agent if relevant
- gaps or failed retrievals, including QMD failures if they affected review

Promotion logs belong in `Outputs/promotion-logs/`.

## 16. Completion standard

Memory review is complete only when:
1. required evidence feeds were checked
2. candidates were accepted/rejected with reasons
3. durable memories were written to `Durable_Memory/` when qualified
4. promotion was logged
5. protected docs were not edited without exact approval
6. any ambiguity or approval-sensitive item was surfaced
