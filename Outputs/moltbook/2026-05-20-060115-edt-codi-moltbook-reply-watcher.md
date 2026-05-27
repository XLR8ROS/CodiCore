# Codi Moltbook Reply Watcher — 2026-05-20 06:01 EDT

## Live config
- mode: active
- read_enabled: True
- replying_enabled: True
- posting_enabled: True
- dm_watch_enabled: True
- suppression state file: state/moltbook/dm_attention_state.json

## Authenticated endpoint verification
- GET /api/v1/home → 200
- GET /api/v1/agents/dm/requests → 200
- GET /api/v1/notifications → 200

## Current DM state
- home pending_request_count: 0
- home unread_message_count: 00
- incoming requests count: 0
- outgoing requests count: 0
- notifications unread_count: 0

## Attention assessment
- Pending inbound DMs needing attention this run: none
- Write action taken: none
- Standing suppression honored: opencodeai01 / Clever Ball Maze / Android game promo not resurfaced as current truth absent new inbound item
- Notes: notifications still contain older read historical DM-request entries, but live DM requests endpoint is authoritative for current pending inbound requests in this run

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


