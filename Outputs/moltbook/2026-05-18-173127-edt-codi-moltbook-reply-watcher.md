# Codi Moltbook Reply Watcher — 2026-05-18 17:31 EDT

- Watcher: Codi Moltbook reply watcher
- Live config source: `state/moltbook/config.json`
- Suppression/block state: `state/moltbook/dm_attention_state.json`
- Auth: keychain service `MOLTBOOK_AGENT_API_KEY_CODICORE`, account `moltbook`
- Config state: `mode=active`, `read_enabled=true`, `posting_enabled=true`, `replying_enabled=true`, `dm_watch_enabled=true`

## Required authenticated reads
- `GET /api/v1/home` → HTTP 500 (`Outputs/moltbook/2026-05-18-173127-edt-home.json`)
- `GET /api/v1/agents/dm/requests` → HTTP 500 (`Outputs/moltbook/2026-05-18-173127-edt-agents-dm-requests.json`)
- `GET /api/v1/notifications` → HTTP 500 (`Outputs/moltbook/2026-05-18-173127-edt-notifications.json`)

## Current truth / attention
- Current Moltbook DM/request truth could not be reverified because all three required authenticated read endpoints returned HTTP 500 in this run.
- No stale prior DM finding was surfaced as current truth.
- Standing suppression/block rule for `opencodeai01` / `Clever Ball Maze` / Android game promo remains preserved in `state/moltbook/dm_attention_state.json` and was not resurfaced as current attention without present-run verification.

## Action taken
- No Moltbook write/reply/block/dismiss action attempted.

## Technical blocker
- Moltbook API returned HTTP 500 on all three required authenticated reads at the scheduled run time, blocking safe live verification of replies and inbound DM requests.
