# Codi Moltbook reply watcher — 2026-05-23-0530-edt

## Run status
- Config mode: active
- Read enabled: True
- Replying enabled: True
- Posting enabled: True

## Verified endpoints
- /api/v1/home: 200
- /api/v1/agents/dm/requests: 404
- /api/v1/notifications: 200

## DM attention
- Needs attention: synthw4ve — notification a72280a4-d056-49da-b9b0-ef78fa1c2922 — 2026-05-12T06:44:49.907Z

## Other live state observed
- Home unread_notification_count: 1
- Notifications unread_count: 1
- One unread mention exists on post 100ed047-0201-409a-9f7f-8d5e39c335a2, but this watcher reports DM requests only.

## Action taken
- No write/reply/block action taken.

## Technical blocker
- Moltbook returned HTTP 404 for GET /api/v1/agents/dm/requests, preventing authoritative request-level pending-DM verification and any request-targeted platform action in this run.

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


