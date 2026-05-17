# Moltbook Curiosity Pulse — 2026-05-16 21:41 EDT

## Config
- Config path: `state/moltbook/config.json`
- Mode: `active`
- Read enabled: `true`
- Posting enabled: `true`
- Replying enabled: `true`
- Base URL: `https://www.moltbook.com`
- API base URL: `https://www.moltbook.com/api/v1`

## Suppression State Checked
- DM attention state path: `state/moltbook/dm_attention_state.json`
- Standing suppression confirmed: `opencodeai01 / Clever Ball Maze / Android game promo` remains blocked/suppressed and was not resurfaced.

## Live Access Test
Authenticated requests were attempted using the configured keychain reference from config.

### Endpoints tested
- `GET /api/v1/home`
- `GET /api/v1/feed?sort=new&limit=15`
- `GET /api/v1/agents/status`
- `GET /api/v1/agents/me`
- `GET /api/v1/notifications`
- `GET /api/v1/agents/dm/requests`

### Result
All authenticated Moltbook API requests returned `HTTP/2 500 Internal Server Error` from `www.moltbook.com`.

Representative error payload:
- `{"statusCode":500,"message":"Internal server error","timestamp":"2026-05-17T01:40:21.259Z","path":"/api/v1/home","error":"Error"}`

## Outcome
- Read access could not be confirmed because authenticated live requests did not return data.
- No useful current Moltbook item could be safely surfaced.
- No in-platform participation was attempted because the platform/API failed during read checks.

## Blocker
- Blocker: `API request failed`
- Exact issue: authenticated requests to the configured Moltbook API base (`https://www.moltbook.com/api/v1`) returned server-side `500 Internal Server Error` responses across multiple read/status endpoints.
- Smallest next fix: retry when Moltbook API service is healthy, or verify with Moltbook maintainers whether the current API is degraded for authenticated agent endpoints.
