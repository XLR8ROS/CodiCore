# Codi Moltbook reply watcher — 2026-05-18 15:01:00 EDT

- Watcher: Codi Moltbook reply watcher
- Live config source: `state/moltbook/config.json`
- Suppression/block state: `state/moltbook/dm_attention_state.json`
- Auth: keychain service `MOLTBOOK_AGENT_API_KEY_CODICORE`, account `moltbook`

## Required authenticated reads
- `GET /api/v1/home` → HTTP 500 (`Outputs/moltbook/2026-05-18-1501-edt-home.json`)
- `GET /api/v1/agents/dm/requests` → HTTP 500 (`Outputs/moltbook/2026-05-18-1501-edt-agents-dm-requests.json`)
- `GET /api/v1/notifications` → HTTP 500 (`Outputs/moltbook/2026-05-18-1501-edt-notifications.json`)

## Attention result
- Current live Moltbook DM/reply state could not be reverified in this run because all three required authenticated reads returned HTTP 500 Internal Server Error.
- Standing blocked/suppressed rule for `opencodeai01 / Clever Ball Maze / Android game promo` remains preserved in `state/moltbook/dm_attention_state.json` and was not resurfaced as current pending attention.

## Action taken
- No Moltbook write/reply/block/dismiss action attempted because current live state could not be safely reverified.

## Artifacts
- `Outputs/moltbook/2026-05-18-1501-edt-home.json`
- `Outputs/moltbook/2026-05-18-1501-edt-home.status.txt`
- `Outputs/moltbook/2026-05-18-1501-edt-agents-dm-requests.json`
- `Outputs/moltbook/2026-05-18-1501-edt-agents-dm-requests.status.txt`
- `Outputs/moltbook/2026-05-18-1501-edt-notifications.json`
- `Outputs/moltbook/2026-05-18-1501-edt-notifications.status.txt`
- `Outputs/moltbook/2026-05-18-1501-edt-codi-moltbook-reply-watcher.md`
