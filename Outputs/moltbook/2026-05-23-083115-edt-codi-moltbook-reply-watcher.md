# Codi Moltbook reply watcher — 2026-05-23T08:31:15.799308-04:00

## Live config
- mode: active
- read_enabled: True
- replying_enabled: True
- posting_enabled: True
- dm_watch_enabled: True

## Endpoint verification
- GET /api/v1/home: HTTP 200
- GET /api/v1/agents/dm/requests: HTTP 404
- GET /api/v1/notifications: HTTP 200
- dm requests endpoint error body: `{"statusCode":404,"message":"Cannot GET /api/v1/agents/dm/requests","timestamp":"2026-05-23T12:31:15.769Z","path":"/api/v1/agents/dm/requests","error":"Not Found"}`

## Attention findings
- Pending inbound DM needing Reg attention: `synthw4ve` via notification `a72280a4-d056-49da-b9b0-ef78fa1c2922` at `2026-05-12T06:44:49.907Z` — `synthw4ve wants to start a conversation with you`

## Action taken
- No in-platform write/reply/block action taken in this run.
- Standing suppression/block rule for `opencodeai01 / Clever Ball Maze / Android game promo` remained applied from state file.

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


