---
Summary: Memory operating contract for Codi.
Description: Defines the durable memory contract, authority order, promotion rules, and separation between canonical memory and daily notes.
---

# Codi Memory Operating Contract

## Purpose
`MEMORY.md` is the durable memory contract for Codi.
It is not a daily log, scratchpad, or rolling journal.

## Separation Rule
- `MEMORY.md` = contract, durable memory rules, and stable promoted guidance only.
- `daily-notes/YYYY-MM-DD.md` = daily logs, session notes, incident notes, and rolling observations.
- Raw runtime logs, SQLite event logs, and output artifacts remain separate supporting records.

Only the root `MEMORY.md` should use the memory name for canonical memory.
Daily files must live under `daily-notes/` and use date-only naming.

## Memory Layers
1. **Context window** — live working context for the current interaction.
2. **Daily notes** — raw chronological notes of what happened.
3. **Compressed event memory** — summarized non-canonical historical memory.
4. **Long-term semantic memory** — promoted durable knowledge.
5. **Shared scoped memory** — role- or organization-scoped bulletins, SOPs, and directives.

## Source Hierarchy
Candidate durable memory may come from:
1. daily notes
2. session notes / session logs
3. output logs
4. event log records
5. explicitly promoted durable notes

## Authority Order
When memory conflicts, authority wins.

1. Constitution and Articles
2. Governance bulletins and directives
3. SOP hierarchy
4. Durable user preferences
5. Identity memory
6. Lessons learned
7. Validated semantic memory
8. Decisions made
9. Task outcomes
10. Compressed event memory
11. Daily notes / raw event records
12. Live context window

Recency does not outrank authority.
Raw logs do not outrank canon.

## Write Classes
All durable writes should fit one of these classes:
- raw_event
- compressed_event
- decision
- lesson_learned
- durable_preference
- canon_candidate
- task_outcome
- shared_bulletin
- relationship
- context_note
- item
- identity_memory

## Promotion Rules
Promote memory when it captures:
- canonical decisions
- naming locks
- architectural commitments
- durable user preferences
- agent operating rules worth keeping
- security-critical information
- SOP or governance changes
- structural system changes
- stable routing rules
- repeated patterns that should improve future behavior

If Reg explicitly says to remember, save, lock, promote, or canonize something, treat that as a promotion trigger.

## Logging Rules
Meaningful work must leave a trace.
Every meaningful experience should end as one of:
1. log only
2. summarize and retain
3. promote and improve

If something is not logged, it is treated as if it did not happen.

## Ownership Rules
- Session logs are agent-owned artifacts.
- Agent-owned logs must live inside the repo under a structured path.
- OpenClaw runtime logs may support recall, but they are not authoritative memory unless explicitly incorporated.
- For Codi, daily logs belong in `daily-notes/`.

## Nightly Review Rule
Nightly review should inspect:
1. daily notes
2. session notes / session logs
3. output logs
4. event log records

The review must decide what stays transient, what is summarized, and what is promoted.

## Compound Improvement Rule
Memory is not only for recall.
It should improve future behavior.
Repeated errors, repeated wins, routing mistakes, and workflow friction should feed better defaults, clearer rules, and stronger reusable templates.

## What Must Not Happen
- Do not treat daily notes as canon.
- Do not dump raw logs into durable memory unchanged.
- Do not let rolling notes accumulate inside `MEMORY.md`.
- Do not silently overwrite authority with recency.
- Do not promote noise just because it is recent.
- Do not leave meaningful work unrecorded.

## Location Pointer
Daily operational notes now live under:
- `daily-notes/YYYY-MM-DD.md`

Historical dated files were normalized into that location to keep `MEMORY.md` contract-only and within context-injection limits.
