# Manifest Snapshot Lesson — 2026-04-30

## Lesson
The snapshot existed, but it was not useful for restoring model routing because it only proved these files existed:
- `config.json`
- `extensions-manifest/`
- `manifest.db`

When inspected:
- `config.json` only contained `authSecret`
- the DB showed tier rows for `simple` / `standard` / `complex` / `reasoning`, but no configured model/provider routing:
  - `override_model` empty
  - `override_provider` empty
  - `auto_assigned_model` empty
  - `fallback_models` empty

## Rule Going Forward
A useful Manifest snapshot must include **both** raw files **and** readable verification output.

## Required Manifest Snapshot Contents

### 1. Raw copied assets
- `~/.openclaw/extensions/manifest/`
- `~/.openclaw/manifest/config.json`
- `~/.openclaw/manifest/manifest.db`

### 2. Verification exports saved beside the snapshot
- `tables.txt`
- `agents.txt`
- `user_providers.txt`
- `custom_providers.txt`
- `tier_assignments.txt`
- `routing_summary.md`

### 3. routing_summary.md must explicitly state
- which providers are connected
- which tiers exist
- which model is assigned to each tier
- fallback models per tier
- whether routing is actually restorable from the snapshot

## Validity Standard
A snapshot is **not** considered valid just because files were copied.

A snapshot is valid **only if it proves the useful state exists and can be restored**.
