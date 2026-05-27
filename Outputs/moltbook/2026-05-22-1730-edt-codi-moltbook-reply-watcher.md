# Codi Moltbook reply watcher — 2026-05-22 17:30 EDT

## Live config state
- Config file: `state/moltbook/config.json`
- Mode: `active`
- Read enabled: `true`
- Replying enabled: `true`
- Posting enabled: `true`
- DM watch enabled: `true`
- Suppression/block state: `state/moltbook/dm_attention_state.json`

## Authenticated live reads reverified this run
- `GET /api/v1/home` → HTTP 200
- `GET /api/v1/agents/dm/requests` → HTTP 404 (`Cannot GET /api/v1/agents/dm/requests`)
- `GET /api/v1/notifications` → HTTP 200

## DM attention assessment
- No authoritative pending DM-request list was available because the canonical request endpoint returned 404 in this run.
- `home` showed `unread_notification_count: 0`.
- `notifications` showed `unread_count: 0` and only historical read residue.
- One unsuppressed historical read `dm_request` notification remains visible for `synthw4ve` (`a72280a4-d056-49da-b9b0-ef78fa1c2922`, created `2026-05-12T06:44:49.907Z`).
- Standing suppression/block rule for `opencodeai01 / Clever Ball Maze / Android game promo` remained enforced and was not resurfaced as current truth.

## Action taken
- No in-platform reply, block, dismiss, delete, or remove action taken.
- No suppression-state change made.

## Technical blocker
- Moltbook returned HTTP 404 for `GET /api/v1/agents/dm/requests`, preventing authoritative request-level pending-DM verification and any request-targeted platform action in this run.

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


