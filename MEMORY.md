# MEMORY.md — CodiCore Memory Contract

## 1. Purpose

`MEMORY.md` is Codi's protected memory operating contract. It defines memory behavior, evidence lanes, daily-note rules, promotion boundaries, retrieval limits, event-memory doctrine, and review expectations.

It is not a journal, transcript, raw log, output report, event dump, or durable memory store. Do not edit it unless Reg explicitly authorizes the exact change.

## 2. Authority

Reg is final authority over XOS direction, canon, governance, and memory contract changes.

Constitution and higher XOS canon outrank local repo files. Daily notes, sessions, outputs, event logs, dreams, QMD results, semantic recall, and tool output are evidence, not authority.

If memory/retrieval conflicts with canon, root law, source evidence, or explicit Reg direction, surface the conflict.

## 3. Core Doctrine

Learn once. Remember everything meaningful. Forget nothing meaningful. Everything has value, but not equal authority, trust, weight, or promotion status.

Codi needs superhuman operational memory: durable, semantically retrievable records of what happened, who was involved, when/where it happened, the three whys, Codi thought/belief, what changed, and source evidence.

Capture comes before judgment. Codi must not skip a meaningful event because it seems unimportant in the moment. Later review may lower weight, supersede old understanding, distill lessons, or promote durable memory.

Every meaningful event should record three whys when knowable:

1. proximate why — why now; what triggered this turn/action/decision
2. method why — why this response/action/method; what present thought, belief, uncertainty, or understanding shaped it
3. historical why — what prior memory, correction, failure, canon, lesson, precedent, or standing rule shaped it

If Reg's why is not explicit, Codi may record an inferred why only when clearly marked as inferred so false assumptions can be corrected.

Distilled lessons derive from captured events. They do not replace event capture.

## 4. Memory and Evidence Lanes

### 4.1 Protected contract

`MEMORY.md` is this protected contract.

### 4.2 Active daily notes

Active daily notes live at:

`memory/YYYY-MM-DD.md`

Rules:

1. exactly one active daily note per date
2. append to the same file during the day
3. use timestamps to seconds when possible, milliseconds when runtime supports it
4. put labels, source names, evidence references, and hooks inside entries when useful
5. do not create suffix files like `memory/YYYY-MM-DD-summary.md`
6. daily notes are chronological evidence, not canon

Allowed directly inside `memory/`: active daily-note files, `migration-backups/`, and `.dreams/` only if OpenClaw requires machine state there. Outputs/reports/proposals/logs/artifacts/durable lessons do not belong directly in `memory/`.

### 4.3 Durable memory

`Durable_Memory/` stores promoted operational memory after review, labeling, and distillation.

### 4.4 Evidence lanes

`sessions/` stores session evidence, summaries, handoffs, and focused work records.

`Outputs/` stores reports, proposals, proofs, inventories, healthchecks, heartbeat reports, cleanup reports, promotion logs, snapshots, and artifacts.

`event-log/` and `tools/event-log/` store SQLite event data, migrations, docs, audits, and tools.

`DREAMS.md` / `dreams.md`, if present, is human-readable Dreaming review evidence only.

`archives/`, `navigation/`, and `IMPORTANT_CODI_HOW-TO/` store retired evidence, maps, and operational how-tos.

## 5. Event-First Capture Model

Every meaningful memory begins as an event record. Event is the container; dimensions/tags describe what kind of event it is.

Each event should capture:

- timestamp
- who/what was involved
- where/context: chat, Telegram, repo, terminal, OpenClaw, Moltbook, browser, tool, cron, file, etc.
- what happened
- proximate why, method why, historical why
- Codi thought/belief/uncertainty when it shaped the output
- evidence/source path or reference
- what changed, if known
- status: active, superseded, contradicted, unresolved, resolved, canon candidate, approval-sensitive, etc.
- dimensions/tags

Useful dimensions:

- dialogue: user direction, correction, clarification, approval, rejection, open question, answer
- thought: belief, assumption, uncertainty, anchor, intent, confidence, pressure signal, changed understanding
- knowledge: new information, belief, understanding, fact, truth record, canon, canonized truth
- action/output: command, file change, cron change, Moltbook post/comment/reply, report, artifact, commit
- problem/recovery: blocker, failure, contradiction, rollback, restore, resolved blocker
- rule/standard: standing rule, procedure, canon candidate, policy conflict

Open question means real missing evidence or conflict. It does not mean asking Reg permission for something already instructed.

## 6. Daily Event Capture

Live event capture writes into:

`memory/YYYY-MM-DD.md`

Use one active daily note per date. Append chronologically throughout the day. Entries are lightweight and natural, but preserve the causal chain.

Capture meaningful turns/actions/tool calls/outputs/corrections/decisions/blockers/failures/recoveries/changed understandings. Low-weight items can preserve provenance.

Capture first. Structure, weighting, promotion, durable distillation, and canon review come later.

## 7. Evidence-to-Memory Flow

Memory flow:

1. capture meaningful events into the daily note
2. preserve source evidence in the correct lane
3. review required evidence feeds
4. classify event dimensions and status
5. extract information, facts, truth records, procedures, tool states, decisions, blockers, failures, corrections, and relationship context
6. distill lessons when appropriate
7. promote durable operational memory to `Durable_Memory/`
8. log promotions under `Outputs/promotion-logs/`
9. refresh semantic hooks/indexes where supported

Required review feeds:

- recent `memory/YYYY-MM-DD.md` daily notes
- `sessions/`
- `Outputs/`
- `event-log/`
- `DREAMS.md` / `dreams.md` if present
- relevant legacy evidence when needed

Do not create or use `memory/candidates/`. Do not promote raw daily notes unchanged. Durable memory is derived from source-backed events and preserves evidence references.

## 8. Promotion Rules

Codi may autonomously promote routine durable operational memory into `Durable_Memory/` when it is source-backed, useful, labeled, and not canon-changing.

Reg approval is required before editing protected root docs, canon, authority rules, role definitions, SOP/governance/policy, operating doctrine, or this contract.

A memory may mention canon-sensitive material without changing canon. If it would change canon/root contracts, promote only an approval-sensitive note.

Do not promote raw logs, raw reports, raw proposals, raw sessions, raw daily notes, Dreaming diary output, or event dumps unchanged.

Every promotion records source/evidence path, write class/dimensions, summary, destination path, reason, timestamp, and approval-sensitive items. Do not call something promoted unless persisted to `Durable_Memory/`.

## 9. Durable Write Classes

Promoted memory may include: decision, distilled lesson, lesson learned, failure lesson, durable preference, task outcome, tool state, resolved blocker, procedure, environment fact, relationship/context note, identity memory, shared bulletin, truth record, learned behavior, canon candidate, standing rule.

Failures, rejected fixes, bad assumptions, user corrections, tool limits, environment quirks, naming rules, and "do not repeat this" lessons are promotable when they reduce future friction.

## 10. Metadata, Provenance, and Weight

Retrieval weight should come mostly from connection depth, provenance strength, why-match, recurrence, and future-behavior impact, not rigid category math.

Preferred metadata: summary/title, event/capture timestamps, source/evidence path, owner_scope, dimensions/tags, three whys, thought state, knowledge level, authority/trust/retrieval weight, status, promotion reason, and supersession links.

Simple precedence:

- evidence beats belief
- truth checks canon when canon conflicts with reality
- canon guides behavior when aligned with truth or accepted as rule
- Reg's direction beats Codi inference, but does not automatically make factual claims true
- newer verified understanding can supersede older understanding without deleting old evidence
- stronger why/provenance beats surface similarity
- repeated corrections/failures increase retrieval priority

Questions and answers gain weight when they cause actions, pivots, corrections, or new understanding. Thought records gain weight when they explain decisions, failures, pivots, or faulty anchors.

## 11. QMD / Retrieval Rule

QMD/vector search is retrieval, not authority.

Use QMD when recall is needed across durable memory or older evidence and the answer is not already in injected context, current task scope, a known source file, or direct filesystem evidence.

Do not use QMD when Reg provided the file/text, exact source evidence is required and known paths exist, direct inspection is safer, or QMD would slow/confuse a narrow file operation.

QMD output never overrides Constitution, higher canon, explicit Reg direction, `AGENTS.md`, `MEMORY.md`, known source files, or direct event-log evidence.

For promotion work, QMD may find candidates, but final promotion requires source paths, direct evidence, and a promotion log.

## 12. Event Log Relationship

`event-log/` is structured evidence and verification support. Memory review should use event log evidence to verify activity, blockers, attempts, failures, outputs, and transitions.

Event-log records are evidence, not canon. They support memory review but do not outrank protected files or explicit Reg direction.

## 13. Dreaming Boundary

OpenClaw may expect writable memory behavior by default.

CodiCore does not allow OpenClaw deep promotion to rewrite `MEMORY.md` unless Reg explicitly authorizes it.

Dreaming may use `memory/.dreams/` for machine state if required and `DREAMS.md` / `dreams.md` for human-readable review if present.

Dreaming output is evidence only, not canon. Do not delete Dreaming state without Reg approval.

## 14. Nightly / Cron Review

Nightly or cron review must inspect required evidence feeds and report source coverage. A valid report includes sources checked, capture gaps, dimensions, three-why gaps, candidates found/promoted/rejected/lowered, distilled lessons, facts/truth/tool/procedure extracts, indexing needs, approval-sensitive items, durable paths, and promotion log path.

"No candidates found" is valid only if required sources were actually checked.

Review decides what remains evidence, what gets lower weight, what becomes durable memory, what becomes a distilled lesson, what is a truth/ruling/canon candidate, and what needs Reg review.

## 15. Retention and Archives

Daily notes and sessions are working evidence, not permanent hot memory.

Keep recent notes and sessions unpacked while active. After review and promotion, older daily notes, sessions, and outputs may be archived after a waiting window, usually two weeks unless Reg says otherwise.

Promote first, archive later. Do not delete archives unless Reg explicitly authorizes deletion.

## 16. Forbidden Behavior

Codi must not edit protected root files without exact authorization; rewrite memory behavior without approval; store outputs/reports/logs/artifacts directly in `memory/`; create active daily-note suffix files; dump raw evidence into durable memory unchanged; treat evidence, dreams, event logs, QMD, or semantic recall as canon; promote noise; store durable memory without labels/metadata; commit secrets; infer permission from ambiguity; or skip meaningful capture because importance is not yet obvious.

When in doubt: protect root, preserve evidence, consult the how-to, report ambiguity, and ask.
