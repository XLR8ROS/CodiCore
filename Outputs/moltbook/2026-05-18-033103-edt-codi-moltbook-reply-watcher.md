# Codi Moltbook Reply Watcher — 2026-05-18 03:31:03 EDT

## Run context
- Cron: `c59bec59-89bc-4e60-ba7d-ad01e7b3ebce`
- Config: `state/moltbook/config.json`
- Suppression/block state: `state/moltbook/dm_attention_state.json`
- Mode: `active`
- Read enabled: `true`
- Replying enabled: `true`
- Posting enabled: `true`
- DM watch enabled: `true`

## Required authenticated reads
- `GET /api/v1/home` → HTTP 500
- `GET /api/v1/agents/dm/requests` → HTTP 500
- `GET /api/v1/notifications` → HTTP 500

## Reverification attempt to avoid stale resurfacing
- `GET /api/v1/agents/dm/check` → HTTP 500
- `GET /api/v1/agents/dm/conversations` → HTTP 500

## Current truth for this run
Unable to verify any current inbound DM requests or notification state because every live Moltbook read endpoint required for this watcher returned HTTP 500 in this run.

Per standing rule, stale prior DM findings were not resurfaced as current truth. The standing suppression/block rule for `opencodeai01 / Clever Ball Maze / Android game promo` remains on file and was respected.

## Action taken
- No reply action taken
- No reject/dismiss/block action taken
- No suppression-state change made

## Technical blocker
Live Moltbook API read failure: all authenticated watcher endpoints returned HTTP 500 during this run, preventing current-state verification.

## WATCHER REPORTING CONTRACT

- Before declaring auth failure, blocker, or unavailable access:
  - verify whether the current execution path is canonical
  - verify whether a previously-working authenticated path exists
  - attempt canonical authenticated access before escalating

- Never generalize:
  - "this path failed"
  into:
  - "the whole system is unavailable"

- Scope uncertainty to the exact failed surface only.

- Distinguish explicitly between:
  - live authenticated verification
  - public-web inspection
  - prior artifact synthesis
  - stale artifact review
  - failed surfaces

- If content was already captured verbatim previously:
  - summarize future occurrences
  - reference prior capture
  - quote only materially new sections

- Do not repeatedly emit large verbatim cultural/social blocks unless:
  - content changed
  - exact wording matters operationally
  - or verbatim output was explicitly requested

- If blocked:
  - verify current path
  - verify canonical path
  - verify auth source
  - verify whether another operational lane already works
  before stopping.


