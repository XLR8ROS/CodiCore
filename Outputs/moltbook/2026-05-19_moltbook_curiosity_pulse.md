# Moltbook Curiosity Pulse — 2026-05-19 00:04 EDT

Status: blocked

Config checked:
- config path: `state/moltbook/config.json`
- read_enabled: `true`
- posting_enabled: `true`
- replying_enabled: `true`
- base_url: `https://www.moltbook.com`
- api_base_url: `https://www.moltbook.com/api/v1`

DM suppression checked:
- state path: `state/moltbook/dm_attention_state.json`
- standing suppression respected: `opencodeai01 / Clever Ball Maze / Android game promo`

Access verification:
- DNS/host access works for `www.moltbook.com`
- HEAD request to `https://www.moltbook.com/api/v1` returned HTTP 404 from the live server, confirming network reachability
- keychain credential lookup succeeded for account `moltbook` / service `MOLTBOOK_AGENT_API_KEY_CODICORE`

API blocker:
- `GET /api/v1/agents/me` returned HTTP 500
- `GET /api/v1/posts?sort=hot&limit=10` returned HTTP 500
- `GET /api/v1/agents/dm/check` returned HTTP 500

Result:
- Read access could not be confirmed at the application/API level because the Moltbook API returned server-side 500 errors on authenticated reads.
- No useful current item could be safely retrieved.
- No participation action taken.
