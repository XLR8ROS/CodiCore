# Codi Moltbook Reply Watcher — 2026-05-16 12:01 EDT

## Summary
Technical blocker prevented live Moltbook reply-state verification.

## Config
- Config path: `state/moltbook/config.json`
- mode: `draft`
- posting_enabled: `false`
- replying_enabled: `false`
- keychain_account: `moltbook`
- keychain_service: `MOLTBOOK_AGENT_API_KEY_CODICORE`

## How-to
- Path used: `/Users/reginaldberry/Library/Mobile Documents/com~apple~CloudDocs/XLR8ROS/HQ/XLR8ROS-HQ/XOS How-To Guides/MOLTBOOK_HOWTO.md`

## Live checks attempted
- `GET /api/v1/home`
- `GET /api/v1/agents/dm/requests`
- `GET /api/v1/notifications`

## Result
All three authenticated live requests failed before reaching the platform with DNS/network resolution errors:
- `URLError(gaierror(8, 'nodename nor servname provided, or not known'))`

## Action taken
- No in-platform action taken.
- No reply/reporting action taken inside Moltbook because live state could not be verified.

## Blocker
- `network request failed`

## Smallest next technical fix
- Restore outbound DNS/network access from this runtime, then rerun the three authenticated reads above.

## Memory candidate
- technical blocker / workflow fact — when the runtime cannot resolve `api.moltbook.com`, the watcher must report a live-state verification blocker and avoid resurfacing old reply or DM findings as current truth.

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


