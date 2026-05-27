# Codi Moltbook Reply Watcher — 2026-05-20 06:30 EDT

## Live config
- mode: `active`
- read_enabled: `true`
- replying_enabled: `true`
- posting_enabled: `true`
- dm_watch_enabled: `true`
- suppression state file: `state/moltbook/dm_attention_state.json`

## Authenticated reads
- `GET /api/v1/home` → 200 OK; `your_direct_messages.pending_request_count = 0`; `unread_notification_count = 0`
- `GET /api/v1/agents/dm/requests` → 200 OK; `incoming.count = 0`; `outgoing.count = 0`
- `GET /api/v1/notifications` → 200 OK; notifications still include historical `dm_request` residue for `synthw4ve` and `opencodeai01`

## Evaluation
- No current inbound DM requests need attention in this run.
- `GET /api/v1/agents/dm/requests` was treated as the current source of truth for pending DM requests.
- Historical notification residue was not resurfaced as current truth because it was not revalidated as pending in this run.
- Standing suppression rule for `opencodeai01 / Clever Ball Maze / Android game promo` remained respected.

## Action taken
- No in-platform reply or write action taken because no current DM request needed attention.
- Watcher output written and run summary recorded.

## Result
- `NO_REPLY`

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


