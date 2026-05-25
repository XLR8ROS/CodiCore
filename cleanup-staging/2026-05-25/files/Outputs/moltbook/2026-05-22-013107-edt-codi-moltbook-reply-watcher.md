# Codi Moltbook Reply Watcher — 2026-05-22 01:31 EDT

## Run Context
- Cron: `c59bec59-89bc-4e60-ba7d-ad01e7b3ebce`
- Config source: `state/moltbook/config.json`
- Suppression state: `state/moltbook/dm_attention_state.json`
- Live config state: `mode=active`, `read_enabled=true`, `dm_watch_enabled=true`, `replying_enabled=true`, `posting_enabled=true`

## Authenticated Verification
- `GET /api/v1/home` → HTTP 200
- `GET /api/v1/agents/dm/requests` → HTTP 404 `Cannot GET /api/v1/agents/dm/requests`
- `GET /api/v1/notifications` → first read HTTP 200 via artifact capture; follow-up bare `GET /api/v1/notifications` intermittently returned HTTP 500, while `GET /api/v1/notifications?limit=100` returned HTTP 200

## Reverified Current Live Findings
- `/api/v1/home` reported `unread_notification_count: 0` and no `activity_on_your_posts`.
- Reverified notifications include historical `dm_request` items for `synthw4ve` (2026-05-12) and `opencodeai01` (2026-05-07), both marked `isRead: true`.
- No live endpoint in this run returned a current pending DM-request list; the required `/api/v1/agents/dm/requests` endpoint is unavailable (404).
- Standing suppression/block rule from `state/moltbook/dm_attention_state.json` remains in effect for `opencodeai01 / Clever Ball Maze / Android game promo`; it was not resurfaced as a current attention item.
- No stale prior DM findings were treated as current truth beyond explicitly reverified notification history in this run.

## Action Taken
- No in-platform reply, block, dismiss, delete, or removal action taken.
- No config write-disable blocker.
- Recorded watcher evidence to:
  - `Outputs/moltbook/2026-05-22-013107-edt-home.json`
  - `Outputs/moltbook/2026-05-22-013107-edt-agents-dm-requests.json`
  - `Outputs/moltbook/2026-05-22-013107-edt-notifications.json`
  - `Outputs/moltbook/2026-05-22-013107-edt-codi-moltbook-reply-watcher.md`

## Technical Blocker
- Moltbook's documented DM-request endpoint `/api/v1/agents/dm/requests` returned HTTP 404 in this run, preventing authoritative listing of current pending inbound DM requests.
- `/api/v1/notifications` also showed inconsistent behavior across repeated authenticated reads (200 on captured artifact, 500 on one follow-up, 200 with `?limit=100`), reducing confidence in notification-only DM detection as a complete source of truth.
