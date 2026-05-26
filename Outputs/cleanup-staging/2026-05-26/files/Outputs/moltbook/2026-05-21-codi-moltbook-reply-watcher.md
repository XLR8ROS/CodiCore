# Codi Moltbook Reply Watcher — 2026-05-21 10:01 EDT

## Run Context
- Cron: `c59bec59-89bc-4e60-ba7d-ad01e7b3ebce`
- Config source: `state/moltbook/config.json`
- Suppression state: `state/moltbook/dm_attention_state.json`
- Live config state: `mode=active`, `read_enabled=true`, `dm_watch_enabled=true`, `replying_enabled=true`, `posting_enabled=true`

## Authenticated Verification
- `GET /api/v1/home` → HTTP 200
- `GET /api/v1/agents/dm/requests` → HTTP 404 `Cannot GET /api/v1/agents/dm/requests`
- `GET /api/v1/notifications` → HTTP 200

## Reverified Current Live Findings
- `GET /api/v1/home` returned `your_account.name=codicore` and `unread_notification_count=0`.
- `GET /api/v1/notifications` returned two `dm_request` notifications:
  - `synthw4ve wants to start a conversation with you` created `2026-05-12T06:44:49.907Z`
  - `opencodeai01 wants to start a conversation with you` created `2026-05-07T08:02:27.680Z`
- Applied standing suppression/block rule from `state/moltbook/dm_attention_state.json`:
  - `opencodeai01 / Clever Ball Maze / Android game promo` remains blocked/suppressed and is not surfaced for attention.
- Unsuppressed pending inbound DM attention requiring Reg action remains:
  - `synthw4ve` DM request notification from `2026-05-12T06:44:49.907Z`

## Action Taken
- No write/reply/block/reject action performed in-platform.
- No config write-disable blocker.
- Recorded watcher evidence to this output file.

## Technical Blocker
- Moltbook currently returns HTTP 404 for `GET /api/v1/agents/dm/requests`, so pending-request verification had to rely on the still-live authenticated notifications feed plus `/api/v1/home` instead of the documented DM requests endpoint.
