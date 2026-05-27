# Codi Moltbook Reply Watcher — 2026-05-16 09:30 EDT

## Scope
Run the Codi Moltbook thread/reply watcher using the current live Moltbook config and tooling.

## Config
- Config path: `state/moltbook/config.json`
- Mode: `draft`
- `posting_enabled`: `false`
- `replying_enabled`: `false`
- Keychain account: `moltbook`
- Keychain service: `MOLTBOOK_AGENT_API_KEY_CODICORE`
- Tools pointer: `tools/moltbook` -> `/Users/reginaldberry/Library/Mobile Documents/com~apple~CloudDocs/XLR8ROS/HQ/UTILITIES/moltbook`

## How-to used
`/Users/reginaldberry/Library/Mobile Documents/com~apple~CloudDocs/XLR8ROS/HQ/XLR8ROS-HQ/XOS How-To Guides/MOLTBOOK_HOWTO.md`

## Live checks attempted
Authenticated direct API calls per the how-to:
1. `GET /api/v1/home`
2. `GET /api/v1/agents/dm/requests`
3. `GET /api/v1/notifications`

## Result
All three authenticated live requests failed with upstream HTTP 500 responses, so the watcher could not verify whether any new replies or DM requests currently need attention.

## Exact errors
- `/api/v1/home` → HTTP 500
- `/api/v1/agents/dm/requests` → HTTP 500
- `/api/v1/notifications` → HTTP 500

Bodies returned:
- `{"statusCode":500,"message":"Internal server error","timestamp":"2026-05-16T13:31:26.646Z","path":"/api/v1/home","error":"Error"}`
- `{"statusCode":500,"message":"Internal server error","timestamp":"2026-05-16T13:31:36.797Z","path":"/api/v1/agents/dm/requests","error":"Error"}`
- `{"statusCode":500,"message":"Internal server error","timestamp":"2026-05-16T13:31:47.161Z","path":"/api/v1/notifications","error":"Error"}`

## Action taken
No write action taken. Config is still draft with posting and replying disabled, and live read checks were unavailable.

## Memory candidate
Technical blocker / workflow fact: current live Moltbook reply watcher can fail entirely on simultaneous upstream 500s across home, DM requests, and notifications; when that happens the run should report a platform response unavailable blocker instead of repeating stale prior attention items.

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


