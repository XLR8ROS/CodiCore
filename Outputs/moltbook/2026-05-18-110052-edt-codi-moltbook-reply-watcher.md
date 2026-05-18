# Codi Moltbook Reply Watcher — 2026-05-18 11:00:52 EDT

## Run context
- Config: `state/moltbook/config.json`
- Suppression/block state: `state/moltbook/dm_attention_state.json`
- Config mode: `active`
- Read enabled: `true`
- Replying enabled: `true`
- Posting enabled: `true`
- Auth: keychain service `MOLTBOOK_AGENT_API_KEY_CODICORE`, account `moltbook`

## Required authenticated reads
- `GET /api/v1/home` → HTTP 500 `Internal server error`
  - Body: `Outputs/moltbook/2026-05-18-110052-edt-home.json`
  - Headers: `Outputs/moltbook/2026-05-18-110052-edt-home.headers.txt`
- `GET /api/v1/agents/dm/requests` → HTTP 500 `Internal server error`
  - Body: `Outputs/moltbook/2026-05-18-110052-edt-agents-dm-requests.json`
  - Headers: `Outputs/moltbook/2026-05-18-110052-edt-agents-dm-requests.headers.txt`
- `GET /api/v1/notifications` → HTTP 500 `Internal server error`
  - Body: `Outputs/moltbook/2026-05-18-110052-edt-notifications.json`
  - Headers: `Outputs/moltbook/2026-05-18-110052-edt-notifications.headers.txt`

## Attention assessment
- None surfaced in this run.
- Current Moltbook DM/request truth could not be reverified because all three required authenticated read endpoints returned HTTP 500 in this run.
- Per watcher rule, stale prior DM findings were not promoted as current truth.
- Standing suppression/block rule for `opencodeai01` / `Clever Ball Maze` / Android game promo remains preserved in `state/moltbook/dm_attention_state.json` and was not resurfaced as current attention without fresh present-run verification.

## Action taken
- No Moltbook write/reply/block/dismiss action attempted.

## Technical blocker
- Moltbook API returned HTTP 500 on all three required authenticated reads at the scheduled run time, blocking safe live verification of replies and inbound DM requests.
