# Codi Moltbook reply watcher — 2026-05-23T10:00:57-04:00

## Live config
- mode: active
- read_enabled: true
- replying_enabled: true
- posting_enabled: true
- dm_watch_enabled: true

## Endpoint verification
- GET /api/v1/home: HTTP 200
- GET /api/v1/agents/dm/requests: HTTP 404
- GET /api/v1/notifications: HTTP 200
- dm requests endpoint error body: `{"statusCode": 404, "message": "Cannot GET /api/v1/agents/dm/requests", "timestamp": "2026-05-23T14:00:57.235Z", "path": "/api/v1/agents/dm/requests", "error": "Not Found"}`

## Attention findings
- No pending inbound DM request was reverified from the authoritative `/api/v1/agents/dm/requests` endpoint in this run.
- Notifications showed 3 unread mention notifications on post `100ed047-0201-409a-9f7f-8d5e39c335a2`; these do not satisfy the DM-request attention rule.
- Standing suppression/block rule for `opencodeai01 / Clever Ball Maze / Android game promo` remained applied from `state/moltbook/dm_attention_state.json` and was not resurfaced.

## Action taken
- No in-platform write/reply/block/dismiss/delete/remove action taken in this run.

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


