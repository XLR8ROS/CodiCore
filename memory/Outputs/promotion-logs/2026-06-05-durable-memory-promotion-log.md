# Durable Memory Promotion Log — 2026-06-05

- run time: 2026-06-05 03:00 America/New_York
- promoted dates: 2026-06-04 reconciliation; 2026-06-05 current canonical entries
- canonical source notes: `memory/2026-06-04.md`, `memory/2026-06-05.md`
- durable targets written:
  - `Durable_Memory/2026-06-04.md`
  - `Durable_Memory/2026-06-05.md`
- active note verification:
  - canonical active note found: `memory/2026-06-04.md`
  - same-date suffix/session fragment also found for 2026-06-04: `memory/2026-06-04-0609.md`
  - canonical active note found: `memory/2026-06-05.md`
  - no same-date suffix fragments found for 2026-06-05
- workflow docs checked:
  - expected HOW-TO path from injected context unavailable at run time: `IMPORTANT_CODI_HOW-TO/XOS_Memory_Flow_HOWTO.md`
- total entries promoted this run: 28
- skipped canonical entries: none

## Entry-level promotion results
1. 2026-06-04 02:17:27 EDT — promoted from canonical daily note to `Durable_Memory/2026-06-04.md`.
2. 2026-06-04 03:02:55 EDT — promoted from canonical daily note to `Durable_Memory/2026-06-04.md`.
3. 2026-06-04 03:04:50 EDT — promoted from canonical daily note to `Durable_Memory/2026-06-04.md`.
4. 2026-06-04 03:08:48 EDT — promoted from canonical daily note to `Durable_Memory/2026-06-04.md`.
5. 2026-06-04 03:10:17 EDT — promoted from canonical daily note to `Durable_Memory/2026-06-04.md`.
6. 2026-06-04 03:10:39 EDT — promoted from canonical daily note to `Durable_Memory/2026-06-04.md`.
7. 2026-06-04 02:23:00 EDT — promoted from canonical daily note to `Durable_Memory/2026-06-04.md`.
8. 2026-06-04 03:04:00 EDT — promoted from canonical daily note to `Durable_Memory/2026-06-04.md`.
9. 2026-06-04 03:04:30 EDT — promoted from canonical daily note to `Durable_Memory/2026-06-04.md`.
10. 2026-06-04 03:04:45 EDT — promoted from canonical daily note to `Durable_Memory/2026-06-04.md`.
11. 2026-06-04 03:06:00 EDT — promoted from canonical daily note to `Durable_Memory/2026-06-04.md`.
12. 2026-06-04 03:10:00 EDT — promoted from canonical daily note to `Durable_Memory/2026-06-04.md`.
13. 2026-06-04 03:12:00 EDT — promoted from canonical daily note to `Durable_Memory/2026-06-04.md`.
14. 2026-06-04 03:15:00 EDT — promoted from canonical daily note to `Durable_Memory/2026-06-04.md`.
15. 2026-06-04 03:17:00 EDT — promoted from canonical daily note to `Durable_Memory/2026-06-04.md`.
16. 2026-06-04 03:20:35 EDT — promoted from canonical daily note to `Durable_Memory/2026-06-04.md`.
17. 2026-06-04 06:19:30 EDT — promoted from canonical daily note to `Durable_Memory/2026-06-04.md`.
18. 2026-06-04 06:23:10 EDT — promoted from canonical daily note to `Durable_Memory/2026-06-04.md`.
19. 2026-06-04 06:58:47 EDT — promoted from canonical daily note to `Durable_Memory/2026-06-04.md`.
20. 2026-06-04 07:00:55 EDT — promoted from canonical daily note to `Durable_Memory/2026-06-04.md`.
21. 2026-06-04 07:07:50 EDT — promoted from canonical daily note to `Durable_Memory/2026-06-04.md`.
22. 2026-06-04 08:00:00 EDT — promoted from canonical daily note to `Durable_Memory/2026-06-04.md`.
23. 2026-06-04 08:01:22 EDT — promoted from canonical daily note to `Durable_Memory/2026-06-04.md`.
24. 2026-06-04 11:03:00 EDT — promoted from canonical daily note to `Durable_Memory/2026-06-04.md`.
25. 2026-06-04 16:00:51 EDT — promoted from canonical daily note to `Durable_Memory/2026-06-04.md`.
26. 2026-06-04 20:03:00 EDT — promoted from canonical daily note to `Durable_Memory/2026-06-04.md`.
27. 2026-06-04 23:03:30 EDT — promoted from canonical daily note to `Durable_Memory/2026-06-04.md`.
28. 2026-06-05 00:00:57 EDT — promoted from canonical daily note to `Durable_Memory/2026-06-05.md`.

## Skipped entries
- none from canonical `memory/2026-06-04.md`
- none from canonical `memory/2026-06-05.md`
- `memory/2026-06-04-0609.md` was not promoted in this canonical-note cron pass. Reason: noncanonical same-date session fragment discovered during active-note verification; current payload scope explicitly names canonical daily notes as the promotion source. It remains a source-classification/backfill item rather than evidence loss.

## Evidence notes / retrieval notes
- Source authority for this run was direct file inspection of canonical daily notes and existing durable-memory/promotion-log files.
- QMD/semantic search was not used for candidate selection.

## QMD / indexing
- QMD/index refresh was attempted after durable writes.
- Result: `qmd update` completed for all configured collections; `qmd embed --max-docs-per-batch 128 --max-batch-mb 64` completed and embedded 751 chunks from 10 documents in 1m 38s.
- Final refresh after appending the required daily-note receipt: `qmd update` completed and `qmd embed --max-docs-per-batch 128 --max-batch-mb 64` embedded 6 chunks from 2 documents.
