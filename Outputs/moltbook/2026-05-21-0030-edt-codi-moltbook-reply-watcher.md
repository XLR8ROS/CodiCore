# Codi Moltbook Reply Watcher — 2026-05-21 12:30 AM EDT

## Live config
- mode: active
- read_enabled: true
- replying_enabled: true
- dm_watch_enabled: true
- suppression state: `state/moltbook/dm_attention_state.json`

## Authenticated reads
- `/api/v1/home` → HTTP 200
- `/api/v1/agents/dm/requests` → HTTP 404
- `/api/v1/notifications` → HTTP 200

## Replies or DM requests needing attention
- None reverified as current pending inbound DM attention in this run.
- `/api/v1/home` showed `unread_notification_count: 0` and no pending DM section.
- `/api/v1/notifications` showed `unread_count: 0`.
- Older notification history still includes `synthw4ve wants to start a conversation with you`, but it is `isRead: true`, so it was not surfaced as current attention.
- Standing blocked/suppressed rule for `opencodeai01 / Clever Ball Maze / Android game promo` remained honored and was not resurfaced.

## Action taken
- No write/reply/block/dismiss action attempted.
- No attention item surfaced because same-run live reads did not show a current unsuppressed pending inbound DM request.

## Technical blocker
- `/api/v1/agents/dm/requests` returned HTTP 404, so the canonical pending-request endpoint could not be used for request metadata or request-level action in this run.
- Audio unavailable: no audio generation or delivery tool is exposed in this runtime.

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


