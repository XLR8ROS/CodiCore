# Durable Memory Promotion Log — 2026-06-03

- run time: 2026-06-03 23:13:18 America/New_York
- promoted date: 2026-06-03
- canonical source note: `memory/2026-06-03.md`
- prior-day note checked: no canonical `memory/2026-06-02.md` file found in `memory/` at run time
- workflow docs checked:
  - `MEMORY.md`
  - expected HOW-TO paths from injected context were unavailable at run time: `IMPORTANT_CODI_HOW-TO/XOS_Memory_Flow_HOWTO.md` and `HQ/XLR8ROS-HQ/XOS How-To Guides/XOS_Memory_Flow_HOWTO.md`
- active note verification:
  - canonical active note found: `memory/2026-06-03.md`
  - same-date suffix fragments also found: `memory/2026-06-03-1841.md`, `memory/2026-06-03-2143.md`
  - suffix files were not treated as canonical active daily notes for this promotion run; later normalization/staging should decide whether they are session fragments or migration candidates
- total canonical entries promoted: 37
- durable target written: `Durable_Memory/2026-06-03.md`

## Entry-level promotion results
1. 19:08:37 EDT — promoted successfully from canonical daily note to durable memory.
2. 19:10:30 EDT — promoted successfully from canonical daily note to durable memory.
3. 19:10:58 EDT — promoted successfully from canonical daily note to durable memory.
4. 19:11:20 EDT — promoted successfully from canonical daily note to durable memory.
5. 19:13:44 EDT — promoted successfully from canonical daily note to durable memory.
6. 19:16:12 EDT — promoted successfully from canonical daily note to durable memory.
7. 19:17:25 EDT — promoted successfully from canonical daily note to durable memory.
8. 19:18:33 EDT — promoted successfully from canonical daily note to durable memory.
9. 19:19:08 EDT — promoted successfully from canonical daily note to durable memory.
10. 19:20:01 EDT — promoted successfully from canonical daily note to durable memory.
11. 19:20:49 EDT — promoted successfully from canonical daily note to durable memory.
12. 19:24:01 EDT — promoted successfully from canonical daily note to durable memory.
13. 19:30:00 EDT — promoted successfully from canonical daily note to durable memory.
14. 19:33:44 EDT — promoted successfully from canonical daily note to durable memory.
15. 19:38:31 EDT — promoted successfully from canonical daily note to durable memory.
16. 19:44:41 EDT — promoted successfully from canonical daily note to durable memory.
17. 20:01:37 EDT — promoted successfully from canonical daily note to durable memory.
18. 20:06:15 EDT — promoted successfully from canonical daily note to durable memory.
19. 20:07:41 EDT — promoted successfully from canonical daily note to durable memory.
20. 20:09:25 EDT — promoted successfully from canonical daily note to durable memory.
21. 20:11:11 EDT — promoted successfully from canonical daily note to durable memory.
22. 20:11:51 EDT — promoted successfully from canonical daily note to durable memory.
23. 20:12:56 EDT — promoted successfully from canonical daily note to durable memory.
24. 20:17:54 EDT — promoted successfully from canonical daily note to durable memory.
25. 2026-06-03T20:45:22-04:00 — promoted successfully from canonical daily note to durable memory.
26. 20:56:55 EDT — promoted successfully from canonical daily note to durable memory.
27. 2026-06-03T21:00:36-04:00 — promoted successfully from canonical daily note to durable memory.
28. 21:08:59 EDT — promoted successfully from canonical daily note to durable memory.
29. 21:15:19 EDT — promoted successfully from canonical daily note to durable memory.
30. 21:34:37 EDT — promoted successfully from canonical daily note to durable memory.
31. 21:36:38 EDT — promoted successfully from canonical daily note to durable memory.
32. 21:45:40 EDT — promoted successfully from canonical daily note to durable memory.
33. 21:52:49 EDT — promoted successfully from canonical daily note to durable memory.
34. 2026-06-03 22:00:25 EDT — promoted successfully from canonical daily note to durable memory.
35. 22:05:10 EDT — promoted successfully from canonical daily note to durable memory.
36. 22:51:00 EDT — promoted successfully from canonical daily note to durable memory.
37. 22:53:26 EDT — promoted successfully from canonical daily note to durable memory.

## Skipped entries
- none from canonical `memory/2026-06-03.md`

## Noncanonical files not promoted in this run
- `memory/2026-06-03-1841.md` — same-date suffix file; appears to be a session/context fragment, not the date-only canonical daily note.
- `memory/2026-06-03-2143.md` — same-date suffix file; appears to be a session/context fragment, not the date-only canonical daily note.
- `memory/2026-06-02.md` — not present; no prior-day canonical note available to promote/check.

## Evidence notes / retrieval notes
- Source authority for this run was the canonical daily note `memory/2026-06-03.md` and direct file inspection.
- Semantic `memory_search` was unavailable because OpenAI embedding auth is missing in Codi's agent auth profile.
- QMD was available as local retrieval/indexing support. `qmd update` succeeded and indexed current memory, durable memory, outputs, and navigation collections.
- `qmd embed --max-docs-per-batch 200 --max-batch-mb 10` was attempted after update; it produced no log output and was killed by timeout/SIGKILL before completion. Treat this as an indexing/vector-refresh blocker only, not as memory loss.

## QMD / indexing
- QMD update: completed successfully.
- QMD embedding refresh: blocked/incomplete; process killed by timeout/SIGKILL with no output recorded.
- OpenClaw semantic memory search: unavailable due to missing OpenAI embedding auth for Codi agent profile.
