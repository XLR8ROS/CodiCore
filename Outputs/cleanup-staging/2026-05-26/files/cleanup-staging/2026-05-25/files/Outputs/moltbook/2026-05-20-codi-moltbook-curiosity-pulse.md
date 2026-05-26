# Codi Moltbook Curiosity Pulse — 2026-05-20 12:05 EDT

## Config
- Config path: `state/moltbook/config.json`
- Mode: `active`
- Read enabled: `true`
- Posting enabled: `true`
- Replying enabled: `true`
- Base URL: `https://www.moltbook.com`
- API base URL: `https://www.moltbook.com/api/v1`

## Read Access Test
- DNS/base URL test: success (`https://www.moltbook.com` returned HTTP 200)
- Auth secret lookup: success via keychain account `moltbook`, service `MOLTBOOK_AGENT_API_KEY_CODICORE`
- Endpoint tested: `GET /api/v1/home`
- Result: HTTP response body returned platform error JSON:
  - `{"statusCode":500,"message":"Internal server error","timestamp":"2026-05-20T16:03:29.643Z","path":"/api/v1/home","error":"Error"}`
- Feed endpoint tested: `GET /api/v1/feed?sort=new&limit=15`
- Result: HTTP response body returned platform error JSON:
  - `{"statusCode":500,"message":"Internal server error","timestamp":"2026-05-20T16:03:47.077Z","path":"/api/v1/feed?sort=new&limit=15","error":"Error"}`

## Additional Endpoint Checks
- `GET /api/v1/agents/me` → 500 Internal server error
- `GET /api/v1/posts?sort=new&limit=5` → 500 Internal server error
- `GET /api/v1/submolts/general/feed?sort=new&limit=5` → timeout, then 500 Internal server error
- `GET /api/v1/agents/dm/check` → 404 Not Found
- `GET /api/v1/agents/dm/requests` → 404 Not Found
- `GET /api/v1/agents/dm/conversations` → 404 Not Found

## DM Suppression State Checked
- Checked: `state/moltbook/dm_attention_state.json`
- Standing suppression respected:
  - `opencodeai01` / `Clever Ball Maze` / Android game promo remains blocked/suppressed and was not resurfaced.

## Outcome
- No useful current Moltbook item could be surfaced because live authenticated read access did not return data.
- No in-platform participation attempted despite config allowing it, because read path is currently blocked by platform/API failure.

## Blocker
- `API request failed`
- Exact blocker: Moltbook base URL resolves and responds, but authenticated API reads at configured endpoints are currently failing with platform 500s, and DM endpoints expected by current docs/config also returned 404s.
- Smallest technical next fix: verify current live Moltbook API routes/health and whether the configured authenticated endpoints have changed or the service is degraded.
