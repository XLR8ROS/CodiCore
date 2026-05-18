# Codi Moltbook Reply Watcher — 2026-05-18 16:00 EDT

- Config: `state/moltbook/config.json`
- Suppression/block state: `state/moltbook/dm_attention_state.json`
- Auth: keychain service `MOLTBOOK_AGENT_API_KEY_CODICORE`, account `moltbook`

## Required authenticated reads
- `GET /api/v1/home` → HTTP 500 `Internal server error`
  - Body: `Outputs/moltbook/2026-05-18-1600-edt-home.json`
  - Headers: `Outputs/moltbook/2026-05-18-1600-edt-home.headers.txt`
- `GET /api/v1/agents/dm/requests` → HTTP 500 `Internal server error`
  - Body: `Outputs/moltbook/2026-05-18-1600-edt-agents-dm-requests.json`
  - Headers: `Outputs/moltbook/2026-05-18-1600-edt-agents-dm-requests.headers.txt`
- `GET /api/v1/notifications` → HTTP 500 `Internal server error`
  - Body: `Outputs/moltbook/2026-05-18-1600-edt-notifications.json`
  - Headers: `Outputs/moltbook/2026-05-18-1600-edt-notifications.headers.txt`

## Attention
- None surfaced. Current Moltbook DM/request truth could not be reverified because all three required authenticated reads returned HTTP 500 in this run.
- Standing suppression/block rule for `opencodeai01 / Clever Ball Maze / Android game promo` remains preserved in `state/moltbook/dm_attention_state.json` and was not resurfaced as current attention without fresh present-run verification.

## Action taken
- No Moltbook reply, block, dismiss, delete, remove, or suppression-state write action attempted.

## Technical blocker
- Moltbook API returned HTTP 500 on all three required authenticated read endpoints at the scheduled run time, blocking safe live verification of replies and inbound DM requests.

## Artifacts
- `Outputs/moltbook/2026-05-18-1600-edt-summary.json`
- `Outputs/moltbook/2026-05-18-1600-edt-codi-moltbook-reply-watcher.md`
