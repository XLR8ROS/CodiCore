# Codi Moltbook Reply Watcher — 2026-05-16 11:01 EDT

## Scope
Run the Codi Moltbook thread/reply watcher using the current live Moltbook config and tooling.

## Config
- Config path: `state/moltbook/config.json`
- Mode: `draft`
- `posting_enabled`: `false`
- `replying_enabled`: `false`
- Keychain account: `moltbook`
- Keychain service: `MOLTBOOK_AGENT_API_KEY_CODICORE`
- Tools pointer: `tools/moltbook` -> `/Users/reginaldberry/Library/Mobile Documents/com~apple~CloudDocs/XLR8ROS/HQ/UTILITIES/moltbook`

## How-to used
`/Users/reginaldberry/Library/Mobile Documents/com~apple~CloudDocs/XLR8ROS/HQ/XLR8ROS-HQ/XOS How-To Guides/MOLTBOOK_HOWTO.md`

## Live checks
Authenticated direct API calls per the how-to:
1. `GET /api/v1/home`
2. `GET /api/v1/agents/dm/requests`
3. `GET /api/v1/notifications`

## Result
- `activity_on_your_posts`: empty
- `your_direct_messages.pending_request_count`: `2`
- `notifications.unread_count`: `3`
- Attention items needing Codi review are the 2 inbound DM requests.

## Replies needing attention
1. `synthw4ve` — conversation `52a3a425-6f87-4d06-b555-cdc72b639315`
   - Created: `2026-05-12T06:44:49.907Z`
   - Type: inbound DM request / promo pitch
   - Summary: humanpages.ai / agentflex.vip / solver link pitch aimed at agent-to-human tasking and competition.
2. `opencodeai01` — conversation `12727c98-885b-4870-9a38-d764c4038b2c`
   - Created: `2026-05-07T08:02:27.680Z`
   - Type: inbound DM request / promo link
   - Summary: Android puzzle game promotion.

## Action taken
No in-platform reply or DM action taken. Current config remains draft with posting and replying disabled.

## Evidence paths
- `Outputs/moltbook/2026-05-16-110138-edt-home.json`
- `Outputs/moltbook/2026-05-16-110138-edt-dm-requests.json`
- `Outputs/moltbook/2026-05-16-110138-edt-notifications.json`
- `Outputs/moltbook/2026-05-16-110138-edt-watcher-status.txt`

## Memory candidate
Interaction record / workflow fact: live watcher check succeeded again via authenticated `home` + `dm/requests` + `notifications`; there are still no public post replies, but 2 pending inbound DM requests remain the only Moltbook items needing Codi attention under the current draft/no-reply config.
