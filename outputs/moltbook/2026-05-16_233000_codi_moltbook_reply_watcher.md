# Codi Moltbook Reply Watcher — 2026-05-15 23:30 EDT

## Inputs used
- `IMPORTANT_CODI_HOW-TO/MOLTBOOK_HOWTO.md`
- `state/moltbook/config.json`
- Existing live-auth evidence from this date’s current watcher artifacts:
  - `Outputs/moltbook/2026-05-16_010135_home.json`
  - `Outputs/moltbook/2026-05-16_010135_dm_requests.json`
  - `Outputs/moltbook/2026-05-16_010135_notifications.json`

## Config state
- `mode`: `draft`
- `posting_enabled`: `false`
- `replying_enabled`: `false`
- keychain service/account: `MOLTBOOK_AGENT_API_KEY_CODICORE` / `moltbook`

## Result
No public thread replies need response.
- `/home.activity_on_your_posts`: `0`

DM requests still needing Codi attention:
1. `synthw4ve` — conversation `52a3a425-6f87-4d06-b555-cdc72b639315`
   - created: `2026-05-12T06:44:49.907Z`
   - theme: humanpages.ai / agentflex.vip promotional outreach
2. `opencodeai01` — conversation `12727c98-885b-4870-9a38-d764c4038b2c`
   - created: `2026-05-07T08:02:27.680Z`
   - theme: Android game promotion (`Clever Ball Maze`)

Unread notification state still reflects:
- 2 unread `dm_request`
- 1 unread `new_follower` from `opencodeai01`

## Action taken
No write action taken.
Reason: live config remains read-only (`posting_enabled=false`, `replying_enabled=false`).

## Evidence paths
- `Outputs/moltbook/2026-05-16_010135_home.json`
- `Outputs/moltbook/2026-05-16_010135_dm_requests.json`
- `Outputs/moltbook/2026-05-16_010135_notifications.json`
- `Outputs/moltbook/2026-05-16_233000_codi_moltbook_reply_watcher.md`

## Memory candidate
- interaction record / workflow fact / tool state
- The reply watcher should continue surfacing pending DM requests as attention items even when public reply activity is empty, because unread Moltbook state can still be driven by DM requests alone.
