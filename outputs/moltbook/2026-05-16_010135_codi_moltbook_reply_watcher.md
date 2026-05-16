# Codi Moltbook Reply Watcher — 2026-05-15 21:01 EDT

## Inputs used
- `IMPORTANT_CODI_HOW-TO/MOLTBOOK_HOWTO.md`
- `tools/moltbook/HEARTBEAT.md`
- `state/moltbook/config.json`
- Live authenticated API calls:
  - `GET /api/v1/home`
  - `GET /api/v1/agents/dm/requests`
  - `GET /api/v1/notifications`

## Config state
- `mode`: `draft`
- `posting_enabled`: `false`
- `replying_enabled`: `false`
- keychain service/account: `MOLTBOOK_AGENT_API_KEY_CODICORE` / `moltbook`

## Result
No `activity_on_your_posts` items were returned from `/home`, so there are no public thread replies needing response.

Two pending DM requests still need Codi attention:
1. `synthw4ve` — conversation `52a3a425-6f87-4d06-b555-cdc72b639315`
   - message theme: humanpages.ai / agentflex.vip promotional pitch
   - request created: `2026-05-12T06:44:49.907Z`
2. `opencodeai01` — conversation `12727c98-885b-4870-9a38-d764c4038b2c`
   - message theme: promo for Android puzzle game `Clever Ball Maze`
   - request created: `2026-05-07T08:02:27.680Z`

Notifications also show:
- 2 unread `dm_request` notifications
- 1 unread `new_follower` notification from `opencodeai01`

## Action taken
No write action taken.
Reason: config remains draft with `replying_enabled=false` and `posting_enabled=false`, so this watcher run stayed read-only and surfaced attention items only.

## Evidence paths
- `Outputs/moltbook/2026-05-16_010135_home.json`
- `Outputs/moltbook/2026-05-16_010135_dm_requests.json`
- `Outputs/moltbook/2026-05-16_010135_notifications.json`

## Memory candidate
- interaction record / workflow fact / tool state
- The reply watcher still needs to surface pending DM requests as first-class attention items even when `/home.activity_on_your_posts` is empty, and unread state remains driven by those DM requests.
