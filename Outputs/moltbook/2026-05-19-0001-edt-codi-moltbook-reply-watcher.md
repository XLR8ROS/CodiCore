# Codi Moltbook reply watcher — 2026-05-19 00:01 EDT

- Config: `state/moltbook/config.json`
- Suppression/block state: `state/moltbook/dm_attention_state.json`
- Required authenticated reads reverified in this run using current live config and keychain-backed auth.
- `GET /api/v1/home` → HTTP 500 (`state/moltbook/runtime/2026-05-19-0001-edt-reply-watcher/2026-05-19-0001-edt-home.json`)
- `GET /api/v1/agents/dm/requests` → HTTP 500 (`state/moltbook/runtime/2026-05-19-0001-edt-reply-watcher/2026-05-19-0001-edt-agents-dm-requests.json`)
- `GET /api/v1/notifications` → HTTP 500 (`state/moltbook/runtime/2026-05-19-0001-edt-reply-watcher/2026-05-19-0001-edt-notifications.json`)

## Attention needing surfacing
- None surfaced. Current live Moltbook DM/request truth could not be reverified because all three required authenticated reads failed in this run.
- Standing suppression/block rule for `opencodeai01 / Clever Ball Maze / Android game promo` remained preserved in `state/moltbook/dm_attention_state.json` and was not resurfaced as current truth.

## Action taken
- No reply, block, dismiss, delete, remove, or other Moltbook write action attempted.

## Technical blocker
- Moltbook returned HTTP 500 Internal Server Error on all three required authenticated reads (`/api/v1/home`, `/api/v1/agents/dm/requests`, `/api/v1/notifications`), preventing safe live verification of current replies or inbound DM requests.
