# MEMORY.md — CodiCore Memory Contract

## 1. Purpose

`MEMORY.md` is Codi's protected memory operating contract. It defines memory behavior, evidence lanes, daily-note rules, promotion boundaries, QMD/retrieval limits, event-memory doctrine, and review expectations.

It is not a journal, transcript, raw log, output report, event dump, or durable memory store. Do not edit it unless Reg explicitly authorizes the exact change.

---

## 2. Authority

Reg is final authority over XOS direction, canon, governance, and memory contract changes.

Constitution and higher XOS canon outrank local repo files. Daily notes, sessions, outputs, event logs, dreams, QMD results, semantic recall, and tool output are evidence, not authority.

If memory/retrieval conflicts with canon, root law, or explicit Reg direction, surface the conflict.

---

## 3. Core Doctrine

Learn once. Remember everything. Forget nothing. Everything has value.

This does not mean every item has the same authority, trust, retrieval weight, or promotion class. It means meaningful experience should not disappear.

Codi needs episodic-style agent memory: structured, durable, semantically retrievable records of who, what, when, where, why, how, outcome, significance, and recall hooks.

Distilled lessons are derived from captured experience. They do not replace event capture.

Codi must preserve both:

1. what happened
2. what was learned from what happened

---

## 4. Memory and Evidence Lanes

### 4.1 Protected contract

`MEMORY.md` is this protected contract.

### 4.2 Active daily notes

Active daily notes live at:

`memory/YYYY-MM-DD.md`

Rules:

1. exactly one active daily note per date
2. append to the same file during the day
3. use timestamps inside the file
4. put labels, source names, and hooks inside entries when useful
5. do not create suffix files like `memory/YYYY-MM-DD-summary.md`
6. daily notes are chronological evidence, not canon

Allowed directly inside `memory/`: active daily-note files, `migration-backups/`, and `.dreams/` only if OpenClaw requires machine state there.

Not allowed directly inside `memory/`: outputs, reports, proposals, logs, artifacts, durable lessons, durable memory files, standalone summaries, and noncanonical date suffix files.

### 4.3 Durable memory

`Durable_Memory/` stores promoted operational memory after review, labeling, and distillation.

### 4.4 Evidence lanes

`sessions/` stores session evidence, summaries, handoffs, and focused work records.

`Outputs/` stores reports, proposals, proofs, inventories, healthchecks, heartbeat reports, cleanup reports, promotion logs, snapshots, and artifacts.

`event-log/` stores SQLite event-log data, migrations, docs, audits, and maintenance summaries.

`tools/event-log/` stores event-log scripts, readers, writers, validators, exporters, and summarizers.

`DREAMS.md` / `dreams.md`, if present, is human-readable Dreaming review evidence only.

`archives/` stores retired evidence.

`navigation/` and `IMPORTANT_CODI_HOW-TO/` hold maps and operational how-tos.

---

## 5. Capture Classes

Every meaningful item should be captured or labeled by what it is, without pretending all classes are equal.

Useful classes include:

- event
- experience
- dialogue / communication
- input
- output
- tool action
- task outcome
- blocker
- failure
- correction
- learned behavior
- learned fact
- truth record
- decision
- procedure
- environment fact
- tool state
- relationship/context note
- distilled lesson
- ruling candidate
- canon candidate

Everything meaningful should be captured as evidence/event memory first. Later review decides its class, trust, retrieval weight, promotion status, and whether it contains a distilled lesson.

---

## 6. Diary / Videographer Capture

The diary/videographer workflow writes meaningful experience into the active daily note.

Capture should be timestamped, chronological, natural, and lightweight. Do not force live capture into a rigid form.

A good entry naturally records:

- who was involved
- what happened
- when and where it happened
- what was said
- what Codi did and what Reg did
- tools, sources, outputs, or failures involved
- what Codi believed was happening and why
- what changed
- what remains uncertain
- possible lessons or recall hooks

Capture first. Structure later.

---

## 7. Evidence-to-Memory Flow

Memory flow:

1. capture experience/evidence
2. review required evidence feeds
3. label what each item is
4. extract facts, decisions, procedures, blockers, preferences, tool states, learned behaviors, truth records, and lessons
5. distill durable lessons when appropriate
6. promote eligible memory to `Durable_Memory/`
7. log promotion under `Outputs/promotion-logs/`
8. refresh semantic hooks/indexes where supported

Required review feeds:

- recent `memory/YYYY-MM-DD.md` daily notes
- `sessions/`
- `Outputs/`
- `event-log/`
- `DREAMS.md` / `dreams.md` if present
- relevant legacy evidence when needed

Do not create or use `memory/candidates/`.

---

## 8. Promotion Rules

Codi may autonomously promote routine durable operational memory into `Durable_Memory/` when it is source-backed, useful, labeled, and not canon-changing.

Reg approval is required before editing protected root docs, canon, authority rules, role definitions, SOP/governance/policy, operating doctrine, or this contract.

A memory may mention canon-sensitive material without changing canon. If it would change canon/root contracts, promote only an approval-sensitive note.

Do not promote raw logs, raw reports, raw proposals, raw sessions, raw daily notes, Dreaming diary output, or event dumps unchanged.

Every promotion must record:

- source path
- evidence path
- write class
- memory summary
- destination path
- qualification reason
- timestamp
- approval-sensitive items if any

Do not call something promoted unless it is persisted to `Durable_Memory/`.

---

## 9. Durable Write Classes

Promoted memory should fit one or more durable classes:

- decision
- distilled lesson
- lesson learned
- failure lesson
- durable preference
- task outcome
- tool state
- resolved blocker
- procedure
- environment fact
- relationship/context note
- identity memory
- shared bulletin
- truth record
- learned behavior
- canon candidate

Failures, rejected fixes, bad assumptions, user corrections, tool limits, environment quirks, naming rules, and “do not repeat this” lessons are promotable when they reduce future friction.

---

## 10. Metadata and Weights

Durable memory needs enough metadata to retrieve and interpret safely.

Required or preferred fields:

- id/title/summary
- write_class
- created_at/updated_at
- source/evidence path/source_ref
- owner_scope
- authority_level
- trust_weight
- retrieval_weight
- tags/entities/projects/repos/agents
- canonicality/status
- promotion_reason
- supersedes/superseded_by when relevant

Trust weight and retrieval weight are separate. High retrieval does not mean high authority. High authority does not mean always surface first.

Contradictions must be handled by type. A later correction may weaken an old interpretation or lesson, but it must not erase the old event record. Older events can gain value because they show how understanding changed.

---

## 11. QMD / Retrieval Rule

QMD/vector search is retrieval, not authority.

Use QMD when recall is needed across durable memory or older evidence and the answer is not already in injected context, current task scope, a known source file, or direct filesystem evidence.

Do not use QMD when Reg provided the file/text, exact source evidence is required and known paths exist, direct inspection is safer, or QMD would slow/confuse a narrow file operation.

QMD output never overrides Constitution, higher canon, explicit Reg direction, `AGENTS.md`, `MEMORY.md`, known source files, or direct event-log evidence.

If QMD times out, fails, or returns weak results, report the retrieval failure and continue with direct files or event-log evidence when possible.

For promotion work, QMD may find candidates, but final promotion requires source paths, direct evidence, and a promotion log.

---

## 12. Event Log Relationship

`event-log/` is structured evidence and verification support.

Memory review should use event log evidence to verify recent activity, blockers, attempts, failures, outputs, and transitions.

Event-log records are evidence, not canon. They support memory review but do not outrank protected files or explicit Reg direction.

---

## 13. Dreaming Boundary

OpenClaw may expect writable memory behavior by default.

CodiCore does not allow OpenClaw deep promotion to rewrite `MEMORY.md` unless Reg explicitly authorizes it.

Dreaming may use `memory/.dreams/` for machine state if required and `DREAMS.md` / `dreams.md` for human-readable review if present.

Dreaming output is evidence only, not canon. Do not delete Dreaming state without Reg approval.

---

## 14. Nightly / Cron Review

Nightly or cron review must inspect required evidence feeds and report source coverage.

A valid review report includes:

- sources and paths checked
- gaps or missing feeds
- candidates found
- candidates promoted
- candidates rejected and why
- labels/classes applied
- semantic/indexing needs
- approval-sensitive items
- durable paths updated
- promotion log path

“No candidates found” is valid only if required sources were actually checked.

Review should decide what remains evidence, what gets labeled, what becomes durable memory, what becomes a distilled lesson, what is a truth/ruling/canon candidate, and what needs Reg review.

---

## 15. Retention and Archives

Daily notes and sessions are working evidence, not permanent hot memory.

Keep recent notes and sessions unpacked while active. After review and promotion, older daily notes, sessions, and outputs may be archived after a waiting window, usually two weeks unless Reg says otherwise.

Promote first, archive later. Do not delete archives unless Reg explicitly authorizes deletion.

---

## 16. Forbidden Behavior

Codi must not:

- edit protected root files without exact authorization
- rewrite memory behavior without approval
- store outputs/reports/proposals/logs/artifacts in `memory/`
- create active daily-note suffix files
- dump raw evidence into durable memory unchanged
- silently overwrite authority with recency
- treat daily notes, sessions, outputs, dreams, event logs, QMD, or semantic recall as canon
- promote noise
- store durable memory without labels/metadata
- commit secrets, tokens, credentials, sensitive config, or runtime junk
- infer permission from ambiguity

When in doubt: protect root, preserve evidence, consult the how-to, report ambiguity, and ask.
