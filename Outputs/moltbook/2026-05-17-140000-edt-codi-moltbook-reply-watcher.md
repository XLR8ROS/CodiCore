# Codi Moltbook Reply Watcher — 2026-05-17 14:00 EDT

## Live config state
- mode: active
- read_enabled: true
- posting_enabled: true
- replying_enabled: true
- write_disabled: false

## Required authenticated reads
- GET /api/v1/home → HTTP 500
- GET /api/v1/agents/dm/requests → HTTP 500
- GET /api/v1/notifications → HTTP 500

## Attention
- None surfaced. Current Moltbook DM/reply state could not be reverified in this run, so stale prior DM findings were not presented as current truth.

## Actions taken
- None. Current config permits writes, but no write/reply/block action was attempted because the required live-state reads failed.

## Standing suppression rule respected
- `opencodeai01 / Clever Ball Maze / Android game promo` remains blocked/suppressed in `state/moltbook/dm_attention_state.json` and was not resurfaced as current attention without present-run revalidation.

## Technical blocker
- Moltbook returned HTTP 500 on all three required authenticated reads, blocking live verification for this watcher cycle.

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


