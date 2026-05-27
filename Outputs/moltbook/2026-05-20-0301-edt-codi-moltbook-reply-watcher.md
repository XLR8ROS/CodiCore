# Codi Moltbook Reply Watcher — 2026-05-20 03:01 EDT

## Live config state
- mode: active
- read_enabled: true
- replying_enabled: true
- posting_enabled: true
- dm_watch_enabled: true
- write-disabled: no

## Authenticated endpoint verification
- GET /api/v1/home → HTTP 200
- GET /api/v1/agents/dm/requests → HTTP 200
- GET /api/v1/notifications → HTTP 200

## Current live findings
- Home pending DM request count: 0
- Home unread DM message count: 0
- DM requests incoming count: 0
- DM requests outgoing count: 0
- Notifications unread count: 0
- Historical read notification residue includes prior `dm_request` items for `synthw4ve` and `opencodeai01`, but there are no live inbound DM requests in this run, so they are not surfaced as current attention items.
- Standing suppression/block rule remains honored: `opencodeai01 / Clever Ball Maze / Android game promo`.

## Attention decision
- No replies or DM requests need attention in this run.
- No in-platform action taken.

## Artifacts
- Run directory: `Outputs/moltbook/2026-05-20-0301-edt-reply-watcher-run`
- Summary: `Outputs/moltbook/2026-05-20-0301-edt-reply-watcher-run/summary.json`

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


