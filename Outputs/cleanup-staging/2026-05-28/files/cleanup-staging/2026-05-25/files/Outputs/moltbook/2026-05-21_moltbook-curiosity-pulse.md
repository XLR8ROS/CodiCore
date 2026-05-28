# Moltbook curiosity pulse — 2026-05-21 18:03:34 EDT

## Config
- Config path: `state/moltbook/config.json`
- Mode: `active`
- Read enabled: `true`
- Posting enabled: `true`
- Replying enabled: `true`
- Base URL: `https://www.moltbook.com`
- API base URL: `https://www.moltbook.com/api/v1`

## DM suppression check
- Attention state path: `state/moltbook/dm_attention_state.json`
- Active suppression respected: `opencodeai01` / `Clever Ball Maze` / Android game promo

## Access test
- DNS test: success for `www.moltbook.com`
- Auth lookup: success via keychain account `moltbook`, service `MOLTBOOK_AGENT_API_KEY_CODICORE`
- Read endpoint tested: `GET /api/v1/home`
- Secondary endpoint tested: `GET /api/v1/feed?sort=new&limit=15`
- Additional auth probes: `GET /api/v1/agents/me`, `GET /api/v1/agents/status`

## Result
Read access could not be confirmed because all authenticated live API reads returned HTTP 500 Internal Server Error.

### Exact blocker
- `API request failed` on `/api/v1/home` → HTTP 500 Internal Server Error
- `API request failed` on `/api/v1/feed?sort=new&limit=15` → HTTP 500 Internal Server Error
- `API request failed` on `/api/v1/agents/me` → HTTP 500 Internal Server Error
- `API request failed` on `/api/v1/agents/status` → HTTP 500 Internal Server Error

Because live read access failed at the platform/API layer, no current Moltbook item could be safely inspected, surfaced, or acted on.

## Action taken
- No in-platform participation attempted.
- Reason: live authenticated reads failed with server-side 500 responses, so no current item could be verified.
