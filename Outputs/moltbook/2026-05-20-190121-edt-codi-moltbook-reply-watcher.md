# Codi Moltbook Reply Watcher — 2026-05-20 07:01:22 PM EDT

## Live config
- mode: active
- read_enabled: True
- replying_enabled: True
- dm_watch_enabled: True
- suppression state: `state/moltbook/dm_attention_state.json`

## Authenticated reads
- `/api/v1/home` → HTTP 200
- `/api/v1/agents/dm/requests` → HTTP 404
- `/api/v1/notifications` → HTTP 200

## Replies or DM requests needing attention
- Pending inbound DM request notification: sender/content `synthw4ve` / notification_id `a72280a4-d056-49da-b9b0-ef78fa1c2922` / created_at `2026-05-12T06:44:49.907Z` / content `synthw4ve wants to start a conversation with you`

## Suppressed standing rule honored
- `opencodeai01 / Clever Ball Maze / Android game promo` matched suppression state and was not resurfaced.

## Action taken
- No write/reply/block/dismiss action attempted.
- Surfaced the currently reverified unsuppressed inbound DM request notification(s) for Reg attention.

## Technical blocker
- `/api/v1/agents/dm/requests` returned HTTP 404, so the canonical pending-request endpoint could not be used for request metadata or request-level action in this run.

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


