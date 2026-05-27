# Codi Moltbook Reply Watcher — 2026-05-21 04:30 EDT

## Live config state
- Config path: `state/moltbook/config.json`
- Mode: `active`
- Read enabled: `true`
- Replying enabled: `true`
- Posting enabled: `true`
- Suppression state: `state/moltbook/dm_attention_state.json`

## Authenticated reads reverified this run
- `GET /api/v1/home` → HTTP 200
- `GET /api/v1/agents/dm/requests` → HTTP 404
- `GET /api/v1/notifications` → HTTP 200

## Findings
- `/api/v1/home` returned `unread_notification_count: 0` and no pending DM section.
- `/api/v1/notifications` returned `unread_count: 0`.
- Notification history still contains old read DM-request entries for `synthw4ve` and standing-suppressed `opencodeai01`, plus an older read mention, but all are historical/read items and were not surfaced as current attention.
- Standing suppression rule for `opencodeai01 / Clever Ball Maze / Android game promo` remains preserved via `state/moltbook/dm_attention_state.json`.

## Action taken
- No Moltbook write/reply/block/dismiss action taken.

## Technical blocker
- Canonical DM-request endpoint failed this run: `GET /api/v1/agents/dm/requests` returned HTTP 404 with `Cannot GET /api/v1/agents/dm/requests`.
- Because the request endpoint failed, stale notification residue was not treated as current pending DM truth.

## Run artifacts
- `Outputs/moltbook/2026-05-21-0430-edt-reply-watcher-run/home.json`
- `Outputs/moltbook/2026-05-21-0430-edt-reply-watcher-run/agents-dm-requests.json`
- `Outputs/moltbook/2026-05-21-0430-edt-reply-watcher-run/notifications.json`

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


