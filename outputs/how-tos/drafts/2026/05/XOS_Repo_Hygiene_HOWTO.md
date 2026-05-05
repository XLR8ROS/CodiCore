# XOS Repo Hygiene HOWTO

**XOS Timestamp:** 2026-05-04 21:01:01 EDT
**Scope:** CodiCore repo-local copy; mirrorable into XOS canon.
**Status:** Operational how-to, not root canon by itself.

## Purpose

This how-to tells Codi how to keep the repo clean without inventing lanes, deleting evidence, or touching protected files.

## Canonical lanes

- `MEMORY.md` = protected contract.
- `Durable_Memory/` = promoted durable operational memory.
- `daily-notes/` = raw daily/timestamped evidence.
- `sessions/` = session-specific evidence and handoffs.
- `Outputs/` = reports, proposals, proofs, inventories, healthchecks, heartbeat reports, cleanup reports, promotion logs, snapshots, artifacts.
- `event-log/` = SQLite event-log database and docs.
- `tools/event-log/` = SQLite/event-log scripts and calls.
- `navigation/` = path navigator and how-tos.
- `archives/` = retired evidence and legacy memory.
- `memory/.dreams/` = OpenClaw Dreaming machine state only if required.

Retired active lanes: `memory/` except `.dreams`, `outputs/`, `output/`, `Outputs 2/`, top-level `reports/`.

## Before moving anything

1. Produce exact inventory, not summary.
2. Identify tracked files with `git status --short`.
3. Identify protected files.
4. Propose exact old path → new path.
5. Verify content identity for prior moves using checksum or `HEAD` comparison.
6. Wait for Reg if scope, destination, or authority is unclear.

## Move rules

- Use existing canonical lanes.
- Do not create new lanes without Reg.
- Do not edit protected root files.
- Do not delete unless Reg explicitly authorizes deletion.
- Do not stage or commit until Reg approves.
- If output is large, save inventory under `Outputs/inventories/`.

## Placement examples

- Daily note → `daily-notes/YYYY/MM/`.
- Session transcript or handoff → `sessions/YYYY/MM/`.
- Proposal → `Outputs/proposals/`.
- Report → `Outputs/reports/`.
- Heartbeat report → `Outputs/heartbeat/`.
- Healthcheck → `Outputs/healthchecks/`.
- Cleanup report → `Outputs/cleanup/`.
- Promotion log → `Outputs/promotion-logs/`.
- Proof file → `Outputs/proofs/`.
- Inventory/path map → `Outputs/inventories/`.
- Manifest snapshot kept as evidence → `Outputs/snapshots/manifest/`.
- SQLite DB/schema/docs → `event-log/`.
- SQLite scripts/tools → `tools/event-log/`.
- Distilled lesson → `Durable_Memory/`.
- Old legacy memory → `archives/legacy-memory/`.

## Duplicate lane cleanup

If duplicate lanes exist by spelling/case, stop and report. The canonical output lane is `Outputs/`. Do not use `outputs/`, `output/`, `Outputs 2/`, or top-level `reports/`.

## Git safety

After any approved move, report:

- old path → new path
- content identical yes/no
- verification method
- exact `git status --short`
- unresolved risks

Never report “several,” “multiple,” “appears,” or “likely” when exact evidence is requested. Chunk or save exact output instead.
