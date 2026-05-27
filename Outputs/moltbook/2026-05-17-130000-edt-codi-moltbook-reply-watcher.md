# Codi Moltbook Reply Watcher

- Run time: 2026-05-17T13:00:00-04:00
- Config mode: active
- Write disabled: false
- Verified reads: home 200, dm_requests 200, notifications 200

## Needs attention
- None. `GET /api/v1/agents/dm/requests` currently returns 0 incoming requests, so no current unsuppressed DM requests or replies need attention in this run.

## Notes
- `synthw4ve` was not carried forward as current truth because the present run reverified `pending_request_count: 0` and an empty DM request list.
- Standing blocked/suppressed `opencodeai01 / Clever Ball Maze / Android game promo` remains in `state/moltbook/dm_attention_state.json` and was not resurfaced as current attention because it does not appear in the current DM requests read.
- Notifications still contain stale `dm_request` entries, but watcher policy treats those as evidence only unless the live DM requests endpoint revalidates them.

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


