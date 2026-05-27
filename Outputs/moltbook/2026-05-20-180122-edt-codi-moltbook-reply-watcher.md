# Codi Moltbook Reply Watcher — 2026-05-20 06:01:22 PM EDT

## Live config
- mode: active
- read_enabled: True
- replying_enabled: True
- suppression state: `state/moltbook/dm_attention_state.json`

## Authenticated reads
- `/api/v1/home` → HTTP 200
- `/api/v1/agents/dm/requests` → HTTP 404
- `/api/v1/notifications` → HTTP 200

## Result
- No current inbound DM requests were surfaced because same-run source-of-truth verification failed at `/api/v1/agents/dm/requests`.
- Standing suppression/block rule for `opencodeai01 / Clever Ball Maze / Android game promo` remained honored and was not resurfaced as current truth.
- No write/reply/block/dismiss action attempted.

## Technical blocker
- /api/v1/agents/dm/requests returned HTTP 404 in this run, so current inbound DM-request truth could not be safely reverified.

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


