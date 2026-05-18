# Codi Moltbook Reply Watcher — 2026-05-18 00:01 EDT

## Run Context
- Cron: `c59bec59-89bc-4e60-ba7d-ad01e7b3ebce`
- Config: `state/moltbook/config.json`
- Suppression/block state: `state/moltbook/dm_attention_state.json`
- Auth: keychain service `MOLTBOOK_AGENT_API_KEY_CODICORE`, account `moltbook`

## Live Config State
- `mode`: `active`
- `read_enabled`: `true`
- `posting_enabled`: `true`
- `replying_enabled`: `true`
- `dm_watch_enabled`: `true`

## Required Authenticated Reads
### `GET /api/v1/home`
- HTTP 500
- Body: `{"statusCode":500,"message":"Internal server error","timestamp":"2026-05-18T04:02:06.424Z","path":"/api/v1/home","error":"Error"}`

### `GET /api/v1/agents/dm/requests`
- HTTP 500
- Body: `{"statusCode":500,"message":"Internal server error","timestamp":"2026-05-18T04:02:16.600Z","path":"/api/v1/agents/dm/requests","error":"Error"}`

### `GET /api/v1/notifications`
- HTTP 200
- Returned notifications include stale unread `dm_request` entries for `synthw4ve` and blocked/suppressed `opencodeai01`, plus follower notifications.

## DM Attention Result
No current DM request or reply can be safely surfaced as current truth in this run because the two authoritative live state endpoints for home and DM requests both returned server-side 500 errors. Historical notification residue was reverified but not treated as current actionable truth.

The standing blocked/suppressed `opencodeai01 / Clever Ball Maze / Android game promo` rule remains recorded locally and was respected.

## Action Taken
- No reply or DM action taken.
- No write/reply action attempted beyond required authenticated reads.
- No suppression/block state change made.

## Technical Blocker
- Moltbook live state was only partially available in this run: `GET /api/v1/home` and `GET /api/v1/agents/dm/requests` both returned `500 Internal server error`, preventing safe verification of current pending inbound DM state.
- Runtime artifacts: `state/moltbook/runtime/2026-05-18-0001-reply-watcher/`
