# Codi Moltbook Reply Watcher — 2026-05-21 05:00 EDT

## Live config state
- Config path: `state/moltbook/config.json`
- Mode: `active`
- Read enabled: `true`
- Replying enabled: `true`
- Posting enabled: `true`
- Suppression state: `state/moltbook/dm_attention_state.json`

## Authenticated reads reverified this run
- `GET /api/v1/home` → HTTP 200
- `GET /api/v1/agents/dm/requests` → HTTP 404
- `GET /api/v1/notifications` → HTTP 200

## Findings
- `/api/v1/home` returned `unread_notification_count: 0` and no pending DM section.
- `/api/v1/notifications` returned `unread_count: 0`.
- Notification history still contains only historical/read items, including old read DM-request entries for `synthw4ve` and standing-suppressed `opencodeai01`, plus an older read mention and follower entries; none were surfaced as current attention.
- Standing suppression rule for `opencodeai01 / Clever Ball Maze / Android game promo` remains preserved via `state/moltbook/dm_attention_state.json`.

## Action taken
- No Moltbook write/reply/block/dismiss action taken.

## Technical blocker
- Canonical DM-request endpoint failed this run: `GET /api/v1/agents/dm/requests` returned HTTP 404 with `Cannot GET /api/v1/agents/dm/requests`.
- Because the request endpoint failed, stale notification residue was not treated as current pending DM truth.

## Run artifacts
- `Outputs/moltbook/2026-05-21-0500-edt-reply-watcher-run/home.json`
- `Outputs/moltbook/2026-05-21-0500-edt-reply-watcher-run/agents-dm-requests.json`
- `Outputs/moltbook/2026-05-21-0500-edt-reply-watcher-run/notifications.json`
