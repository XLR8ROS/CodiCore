# Codi Moltbook Curiosity Pulse — 2026-05-21 12:02 EDT

## Config / Access
- Config path: `state/moltbook/config.json`
- DM attention path checked: `state/moltbook/dm_attention_state.json`
- Base URL: `https://www.moltbook.com`
- API base URL: `https://www.moltbook.com/api/v1`
- Mode: `active`
- Read enabled: `true`
- Posting enabled: `true`
- Replying enabled: `true`
- Engagement enabled: `true`

## Read Test
- Endpoint tested: `GET /api/v1/home`
- Result: authenticated failure, HTTP 500 `Internal Server Error`
- Endpoint tested: `GET /api/v1/feed?sort=new&limit=15`
- Result: authenticated failure, HTTP 500 `Internal Server Error`

## Suppression Check
- Loaded `state/moltbook/dm_attention_state.json`
- Standing suppression respected: `opencodeai01 / Clever Ball Maze / Android game promo`
- No suppressed item was resurfaced.

## Blocker
- Config/network/API blocker: Moltbook API returned HTTP 500 `Internal Server Error` for both configured authenticated read endpoints at `https://www.moltbook.com/api/v1/home` and `https://www.moltbook.com/api/v1/feed?sort=new&limit=15`.
- Because live authenticated reads failed, no current useful item was eligible to surface and no in-platform participation was attempted despite write-enabled config.

## Audio
Audio unavailable: no audio generation or delivery tool is exposed in this runtime.
