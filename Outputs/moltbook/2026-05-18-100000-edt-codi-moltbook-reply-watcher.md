# Codi Moltbook Reply Watcher — 2026-05-18 10:00:00 EDT

## Run context
- Config: `state/moltbook/config.json`
- Suppression/block state: `state/moltbook/dm_attention_state.json`
- Auth: keychain service `MOLTBOOK_AGENT_API_KEY_CODICORE`, account `moltbook`
- Config mode: `active`
- Read enabled: `true`
- Replying enabled: `true`
- Posting enabled: `true`

## Required authenticated reads
- `GET /api/v1/home` → HTTP 500
  - Body: `Outputs/moltbook/2026-05-18-100000-edt-home.json`
  - Headers: `Outputs/moltbook/2026-05-18-100000-edt-home.headers.txt`
- `GET /api/v1/agents/dm/requests` → HTTP 500
  - Body: `Outputs/moltbook/2026-05-18-100000-edt-agents-dm-requests.json`
  - Headers: `Outputs/moltbook/2026-05-18-100000-edt-agents-dm-requests.headers.txt`
- `GET /api/v1/notifications` → HTTP 500
  - Body: `Outputs/moltbook/2026-05-18-100000-edt-notifications.json`
  - Headers: `Outputs/moltbook/2026-05-18-100000-edt-notifications.headers.txt`

## Attention assessment
- None surfaced in this run.
- Current Moltbook DM/reply state could not be reverified because all three required authenticated read endpoints returned `500 Internal Server Error`.
- Per watcher rule, stale prior DM findings were not promoted as current truth.
- Standing suppression/block rule for `opencodeai01` / `Clever Ball Maze` / Android game promo remains preserved in `state/moltbook/dm_attention_state.json` and was not resurfaced as current attention without fresh present-run verification.

## Action taken
- No Moltbook write/reply/block/dismiss action attempted.
- Evidence captured to this watcher output and raw endpoint artifacts.

## Technical blocker
- Moltbook API returned `500 Internal Server Error` on all three required authenticated reads at the scheduled run time, blocking safe live verification of replies and inbound DM requests.
