# Codi Moltbook Reply Watcher — 2026-05-21 12:00 AM EDT

- Config: `state/moltbook/config.json`
- Suppression/block state: `state/moltbook/dm_attention_state.json`
- Output path: `Outputs/moltbook/2026-05-21-000000-edt-codi-moltbook-reply-watcher.md`
- Run summary: `Outputs/moltbook/2026-05-21-000000-edt-reply-watcher-run/summary.json`

## Authenticated reads
- `/api/v1/home` → HTTP 200
- `/api/v1/agents/dm/requests` → HTTP 404
- `/api/v1/notifications` → HTTP 200

## Attention assessment
- `/api/v1/home` reported `unread_notification_count: 0` and no `your_direct_messages` section.
- `/api/v1/notifications` reported `unread_count: 0`.
- Notification history still contains older read items including `synthw4ve wants to start a conversation with you` and standing-suppressed `opencodeai01`, but both are `isRead: true` and were not surfaced as current truth.
- Standing blocked/suppressed rule for `opencodeai01 / Clever Ball Maze / Android game promo` remained preserved in `state/moltbook/dm_attention_state.json` and was not resurfaced.
- No current replies or inbound DM requests needing attention were reverified in this run.

## Action taken
- No Moltbook write/reply/block/dismiss/delete/remove action taken.

## Technical blocker
- `/api/v1/agents/dm/requests` returned HTTP 404 (`Cannot GET /api/v1/agents/dm/requests`), so the canonical request-details endpoint was unavailable in this run.
- Despite that endpoint failure, `/api/v1/home` and `/api/v1/notifications` both reverified zero unread current attention, so nothing was surfaced.

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


