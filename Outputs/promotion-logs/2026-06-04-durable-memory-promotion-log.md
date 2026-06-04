# Durable Memory Promotion Log — 2026-06-04

- run time: 2026-06-04 02:05 America/New_York
- promoted dates: 2026-06-03 delta; 2026-06-04 current canonical entries
- canonical source notes: `memory/2026-06-03.md`, `memory/2026-06-04.md`
- durable targets written:
  - `Durable_Memory/2026-06-03.md`
  - `Durable_Memory/2026-06-04.md`
- active note verification:
  - canonical active note found: `memory/2026-06-03.md`
  - same-date suffix fragments also found for 2026-06-03: `memory/2026-06-03-1841.md`, `memory/2026-06-03-2143.md`
  - canonical active note found: `memory/2026-06-04.md`
  - no same-date suffix fragments found for 2026-06-04 at run time
- workflow docs checked:
  - expected HOW-TO path from injected context unavailable at run time: `IMPORTANT_CODI_HOW-TO/XOS_Memory_Flow_HOWTO.md`
- total entries promoted this run: 12
- skipped canonical entries: none

## Entry-level promotion results
1. 2026-06-03 23:13:18 EDT — promoted successfully from canonical daily note to `Durable_Memory/2026-06-03.md`.
2. 2026-06-03 23:57:17 EDT — promoted successfully from canonical daily note to `Durable_Memory/2026-06-03.md`.
3. 2026-06-04 01:55:13 EDT — promoted successfully from canonical daily note to `Durable_Memory/2026-06-04.md`.
4. 2026-06-04 01:59:31 EDT — promoted successfully from canonical daily note to `Durable_Memory/2026-06-04.md`.
5. 2026-06-04 02:01:27 EDT — promoted successfully from canonical daily note to `Durable_Memory/2026-06-04.md`.
6. 2026-06-04 02:05:58 EDT — promoted successfully from canonical daily note to `Durable_Memory/2026-06-04.md`.
7. 2026-06-04 01:56:46 EDT — promoted successfully from canonical daily note to `Durable_Memory/2026-06-04.md`.
8. 2026-06-04 02:08:23 EDT — promoted successfully from canonical daily note to `Durable_Memory/2026-06-04.md` during reconciliation so the scheduled-promotion receipt was also durable.
9. 2026-06-04 02:10:42 EDT — promoted successfully from canonical daily note to `Durable_Memory/2026-06-04.md` during reconciliation so the manual-promotion receipt was also durable.
10. 2026-06-04 02:13:25 EDT — promoted successfully from canonical daily note to `Durable_Memory/2026-06-04.md`; this entry corrects the promotion rule so canonicality is provenance metadata, not an inclusion test.
11. 2026-06-03 18:41:24 EDT — promoted from noncanonical suffix/session fragment `memory/2026-06-03-1841.md` to `Durable_Memory/2026-06-03.md` as noncanonical source backfill entry 40.
12. 2026-06-03 21:43:42 EDT — promoted from noncanonical suffix/session fragment `memory/2026-06-03-2143.md` to `Durable_Memory/2026-06-03.md` as noncanonical source backfill entry 41, with overlapping content labeled as merged provenance.

## Skipped entries
- none from canonical `memory/2026-06-03.md`
- none from canonical `memory/2026-06-04.md` after receipt reconciliation

## Noncanonical source files processed after correction
- `memory/2026-06-03-1841.md` — promoted to `Durable_Memory/2026-06-03.md` as noncanonical source backfill entry 40, preserving source classification metadata.
- `memory/2026-06-03-2143.md` — promoted to `Durable_Memory/2026-06-03.md` as noncanonical source backfill entry 41, preserving source classification metadata and deduplication/merged-provenance notes for overlapping events.

## Evidence notes / retrieval notes
- Source authority for this run was direct file inspection of canonical daily notes and existing durable-memory/promotion-log files.
- QMD/semantic search was not needed for retrieval. A QMD/index refresh was run after writes.

## QMD / indexing
- QMD update: completed successfully; `codi-durable-memory` indexed 2 updated files and `codi-outputs` indexed updated promotion-log/output content.
- QMD embedding refresh: completed successfully; embedded 32 chunks from 3 documents.
- Reconciliation note: The scheduled promotion receipt appended to `memory/2026-06-04.md` at 02:08:23 EDT and the manual promotion receipt appended at 02:10:42 EDT were both added to `Durable_Memory/2026-06-04.md` after the initial cron/direct promotion output because Reg explicitly emphasized that all memories should get promoted.
- Correction note: Reg corrected the rule after this promotion log initially treated same-date suffix fragments as non-promoted because noncanonical. That exclusion basis is now marked incorrect; noncanonical source material must be evaluated by event identity/content and promoted or merged with provenance metadata.
