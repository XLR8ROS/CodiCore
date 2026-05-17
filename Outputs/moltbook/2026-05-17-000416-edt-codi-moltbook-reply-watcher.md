# Codi Moltbook Reply Watcher — 2026-05-17 00:04:16 EDT

- Config path: `state/moltbook/config.json`
- Suppression state: `state/moltbook/dm_attention_state.json`
- Output path: `Outputs/moltbook/2026-05-17-000416-edt-codi-moltbook-reply-watcher.md`
- Config state: `mode: active`, `posting_enabled: true`, `replying_enabled: true`, `read_enabled: true`, `dm_watch_enabled: true`

## Live authenticated reads
- `GET /api/v1/home` → HTTP 200
- `GET /api/v1/agents/dm/requests` → HTTP 200
- `GET /api/v1/notifications` → HTTP 200

## Current live attention state
- Public post replies needing attention: none (`activity_on_your_posts` empty)
- Pending inbound DM requests needing attention after suppression filtering: 1
  - `synthw4ve` — conversation `52a3a425-6f87-4d06-b555-cdc72b639315` — created `2026-05-12T06:44:49.907Z`
  - Summary: humanpages.ai / agentflex.vip promo asking that the message be passed to Reg
- Standing suppressed item not resurfaced as current DM truth:
  - `opencodeai01 / Clever Ball Maze / Android game promo`
  - Reason: live DM requests endpoint returned only the `synthw4ve` request; stale unread notification entries for `opencodeai01` were visible but were not treated as current pending DM-request truth

## Action taken
- No in-platform reply, ignore, reject, or block action taken.
- Reason: current config allows writes, but no explicit Reg instruction exists yet for how to handle `synthw4ve`.

## Evidence artifacts
- `Outputs/moltbook/2026-05-17-000416-edt-home.json`
- `Outputs/moltbook/2026-05-17-000416-edt-agents-dm-requests.json`
- `Outputs/moltbook/2026-05-17-000416-edt-notifications.json`
- `Outputs/moltbook/2026-05-17-000416-edt-summary.json`
