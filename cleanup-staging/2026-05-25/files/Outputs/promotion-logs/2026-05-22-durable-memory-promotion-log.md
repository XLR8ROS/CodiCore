# Durable Memory Promotion Log — 2026-05-22

- Promotion target date: 2026-05-22
- Canonical daily note: `/Users/reginaldberry/Library/Mobile Documents/com~apple~CloudDocs/XLR8ROS/Agents/Primary/CodiCore/CodiCore/memory/2026-05-22.md`
- Prior-day note reviewed for relevance: `/Users/reginaldberry/Library/Mobile Documents/com~apple~CloudDocs/XLR8ROS/Agents/Primary/CodiCore/CodiCore/memory/2026-05-21.md`
- Durable memory output: `/Users/reginaldberry/Library/Mobile Documents/com~apple~CloudDocs/XLR8ROS/Agents/Primary/CodiCore/CodiCore/Durable_Memory/2026-05-22.md`
- Run doctrine: promote every event/entry from the canonical daily note; classify, preserve provenance, and retain or infer the three whys.

## Daily-note verification
- Active canonical note for 2026-05-22: `memory/2026-05-22.md`
- Additional active daily-note files for 2026-05-22 found: none
- Active canonical note for prior day reviewed: `memory/2026-05-21.md`
- Additional dated file found for 2026-05-20: `memory/2026-05-20-0445.md` (treated as non-canonical because `memory/2026-05-20.md` exists as the active canonical daily note)

## Promotion result
- Entries promoted from canonical daily note reviewed this run: 7
- Durable-memory file written: yes
- Existing durable-memory file for 2026-05-22 existed before run: no

## Promoted entries
1. `2026-05-22 00:00:56 EDT` — Ran the scheduled Codi Moltbook reply watcher; `/api/v1/home` returned HTTP 500, `/api/v1/agents/dm/requests` returned HTTP 404, and historical notification residue was not surfaced as current truth.
2. `2026-05-22 00:03:40 EDT` — Ran the scheduled Codi Moltbook curiosity pulse; all authenticated live-read endpoints returned HTTP 500, so no current item was surfaced and no in-platform action was taken.
3. `2026-05-22 00:30:51 EDT` — Ran the scheduled Codi Moltbook reply watcher again with the same DM-request endpoint blocker and no stale notification promotion.
4. `2026-05-22 01:00:00 EDT` — Ran the scheduled 01:00 Codi Moltbook reply watcher with `/api/v1/home` HTTP 500, `/api/v1/agents/dm/requests` HTTP 404, and no current DM surfaced.
5. `2026-05-22 01:31:07 EDT` — Ran the Moltbook reply watcher; `/api/v1/home` succeeded but `/api/v1/agents/dm/requests` remained HTTP 404 and notification follow-up reads were inconsistent.
6. `2026-05-22 02:00:00 EDT` — Ran the Moltbook reply watcher; home and notifications succeeded but the canonical DM-request endpoint still returned HTTP 404.
7. `2026-05-22 02:31:42 EDT` — Ran the Moltbook reply watcher again with `/api/v1/home` HTTP 500, `/api/v1/agents/dm/requests` HTTP 404, and only historical notification residue present.

## Skipped entries
- None from the canonical 2026-05-22 daily note. Every canonical entry was promoted.
- Verification note only: `memory/2026-05-20-0445.md` exists alongside `memory/2026-05-20.md`; it was not promoted in this run because the workflow scope is the canonical daily note and `memory/2026-05-20.md` is the active canonical note for that date.

## QMD / indexing
- No QMD-specific or index-refresh tooling was available in the current toolset or discoverable in the workspace.
- Semantic/index refresh was therefore unavailable from this run; treat this as an indexing blocker only, not memory loss.

## Write blockers
- No durable-memory write blocker.
- Retrieval note: `IMPORTANT_CODI_HOW-TO/XOS_Memory_Flow_HOWTO.md` was not present at the expected workspace path during this run (`ENOENT`), so direct source files and existing durable-memory conventions were used.
