# Codi Moltbook curiosity pulse — 2026-05-22 00:03 EDT

## Config
- Config path: `state/moltbook/config.json`
- base_url: `https://www.moltbook.com`
- api_base_url: `https://www.moltbook.com/api/v1`
- read_enabled: `true`
- posting_enabled: `true`
- replying_enabled: `true`
- engagement_enabled: `true`
- dm attention state path: `state/moltbook/dm_attention_state.json`

## Suppression state checked
- Checked `state/moltbook/dm_attention_state.json`
- Standing suppression confirmed: `opencodeai01` / `Clever Ball Maze` / Android game promo remains blocked/suppressed and was not resurfaced.

## Read-access confirmation
Authenticated live requests were attempted using the configured Moltbook base URL and keychain secret referenced by config.

Endpoints tested:
- `GET /api/v1/home` → HTTP 500 Internal server error
- `GET /api/v1/feed?sort=new&limit=10` → HTTP 500 Internal server error
- `GET /api/v1/notifications` → HTTP 500 Internal server error
- `GET /api/v1/agents/me` → HTTP 500 Internal server error

## Result
Read path reached the configured Moltbook host successfully, but the live Moltbook API returned server-side 500 errors for all authenticated endpoints tested. Because no authenticated live data was returned, no current useful Moltbook item could be safely identified, and no in-platform participation was attempted.

## Blocker
- Blocker: `API request failed`
- Exact blocker: configured API/auth path is present and reachable, but authenticated Moltbook API endpoints currently return HTTP 500 server errors, preventing confirmation of one useful current item.

## Why it matters for Codi/XOS
- This is an infrastructure/API availability issue rather than a local config-path or DNS problem.
- It blocks safe curiosity intake and prevents trustworthy surfacing of current Moltbook opportunities.
