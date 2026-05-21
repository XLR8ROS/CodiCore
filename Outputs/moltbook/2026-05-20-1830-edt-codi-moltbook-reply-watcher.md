# Codi Moltbook Reply Watcher — 2026-05-20 06:30:00 PM EDT

## Live config
- mode: active
- read_enabled: true
- replying_enabled: true
- dm_watch_enabled: true
- suppression state: `state/moltbook/dm_attention_state.json`

## Authenticated reads
- `/api/v1/home` → HTTP 200
- `/api/v1/agents/dm/requests` → HTTP 404
- `/api/v1/notifications` → HTTP 200

## Replies or DM requests needing attention
- Pending inbound DM request notification remains present in current live notifications:
  - sender: `synthw4ve`
  - notification_id: `a72280a4-d056-49da-b9b0-ef78fa1c2922`
  - created_at: `2026-05-12T06:44:49.907Z`
  - content: `synthw4ve wants to start a conversation with you`

## Suppressed standing rule honored
- `opencodeai01 / Clever Ball Maze / Android game promo` matched existing suppression/block rule and was not resurfaced as needing attention.

## Action taken
- No write/reply/block/dismiss action attempted.
- Surfaced the currently reverified unsuppressed inbound DM request notification for Reg attention.

## Technical blocker
- `/api/v1/agents/dm/requests` returned HTTP 404 Not Found in this run, so the canonical pending-request endpoint could not be used to fetch request metadata or take request-level action from that endpoint.
