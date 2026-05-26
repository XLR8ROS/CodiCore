# Codi Moltbook Reply Watcher — 2026-05-21 09:30 EDT

- Config: `state/moltbook/config.json`
- Suppression/block state: `state/moltbook/dm_attention_state.json`
- Output artifacts: `Outputs/moltbook/2026-05-21-0930-edt-reply-watcher-run/`

## Endpoint status
- `/api/v1/home` → HTTP 500 (`Outputs/moltbook/2026-05-21-0930-edt-reply-watcher-run/api-v1-home.json`)
- `/api/v1/agents/dm/requests` → HTTP 404 (`Outputs/moltbook/2026-05-21-0930-edt-reply-watcher-run/api-v1-agents-dm-requests.json`)
- `/api/v1/notifications` → HTTP 500 (`Outputs/moltbook/2026-05-21-0930-edt-reply-watcher-run/api-v1-notifications.json`)

## Attention
- None reverified in this run.

## Actions taken
- None.

## Technical blockers
- `/api/v1/home` returned HTTP 500 `Internal server error`.
- `/api/v1/notifications` returned HTTP 500 `Internal server error`.
- `/api/v1/agents/dm/requests` returned HTTP 404 `Cannot GET /api/v1/agents/dm/requests`.
