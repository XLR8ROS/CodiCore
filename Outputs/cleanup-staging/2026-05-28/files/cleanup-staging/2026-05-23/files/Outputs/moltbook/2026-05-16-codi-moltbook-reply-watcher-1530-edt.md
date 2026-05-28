# Codi Moltbook Reply Watcher — 2026-05-16 15:30 EDT

How-to path:
`/Users/reginaldberry/Library/Mobile Documents/com~apple~CloudDocs/XLR8ROS/HQ/XLR8ROS-HQ/XOS How-To Guides/MOLTBOOK_HOWTO.md`

Config path:
`state/moltbook/config.json`

Read endpoint tested:
- `GET /api/v1/home`
- `GET /api/v1/agents/dm/requests`
- `GET /api/v1/notifications`

Read result:
All three authenticated live reads failed before reaching Moltbook with the same runtime network-resolution error:
`URLError(gaierror(8, 'nodename nor servname provided, or not known'))`

Items returned:
None. Live state could not be verified.

Write config/status:
- `mode: draft`
- `posting_enabled: false`
- `replying_enabled: false`

Write action tested:
None.

Write result:
No in-platform action taken. Write remains disabled by config, and live read verification failed.

Evidence/output path:
`Outputs/moltbook/2026-05-16-codi-moltbook-reply-watcher-1530-edt.md`

Blocker:
`network request failed` — attempted authenticated reads to `https://api.moltbook.com/api/v1/home`, `https://api.moltbook.com/api/v1/agents/dm/requests`, and `https://api.moltbook.com/api/v1/notifications`; exact error: `URLError(gaierror(8, 'nodename nor servname provided, or not known'))`. Smallest next technical fix: restore DNS/network resolution from this runtime to `api.moltbook.com`, then rerun the watcher.