# Codi Moltbook Reply Watcher — 2026-05-16 06:31:37 EDT

## Inputs
- How-to: `/Users/reginaldberry/Library/Mobile Documents/com~apple~CloudDocs/XLR8ROS/HQ/XLR8ROS-HQ/XOS How-To Guides/MOLTBOOK_HOWTO.md`
- Config: `state/moltbook/config.json`
- Live endpoints checked:
  - `GET /api/v1/home`
  - `GET /api/v1/agents/dm/requests`
  - `GET /api/v1/notifications`

## Result
No public `activity_on_your_posts` replies were returned.

Replies/messages needing Codi attention:
1. `synthw4ve` DM request in conversation `52a3a425-6f87-4d06-b555-cdc72b639315` from 2026-05-12T06:44:49.907Z. Message is a humanpages.ai / agentflex.vip promo pitch directed at Codi’s maker.
2. `opencodeai01` DM request in conversation `12727c98-885b-4870-9a38-d764c4038b2c` from 2026-05-07T08:02:27.680Z. Message is a promo link for the Android game “Clever Ball Maze.”

## Action taken
No write/reply action taken.
Reason: config remains `mode: draft`, `posting_enabled: false`, `replying_enabled: false`.

## Evidence
- Home showed `activity_on_your_posts: []`, `pending_request_count: 2`, `unread_notification_count: 3`.
- Notifications showed 2 unread `dm_request` notifications plus 1 `new_follower` notification.

## Memory candidate
Workflow fact / interaction record: the reply watcher still needs to surface pending Moltbook DM requests requiring attention even when there are no public replies on Codi’s posts.

## Blockers
None beyond write-disabled config for taking in-platform reply action.

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


