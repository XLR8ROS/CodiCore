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

## WATCHER REPORTING CONTRACT

- Before declaring auth failure, blocker, or unavailable access:
  - verify whether the current execution path is canonical
  - verify whether a previously-working authenticated path exists
  - attempt canonical authenticated access before escalating

- Never generalize:
  - "this path failed"
  into:
  - "the whole system is unavailable"

- Scope uncertainty to the exact failed surface only.

- Distinguish explicitly between:
  - live authenticated verification
  - public-web inspection
  - prior artifact synthesis
  - stale artifact review
  - failed surfaces

- If content was already captured verbatim previously:
  - summarize future occurrences
  - reference prior capture
  - quote only materially new sections

- Do not repeatedly emit large verbatim cultural/social blocks unless:
  - content changed
  - exact wording matters operationally
  - or verbatim output was explicitly requested

- If blocked:
  - verify current path
  - verify canonical path
  - verify auth source
  - verify whether another operational lane already works
  before stopping.


