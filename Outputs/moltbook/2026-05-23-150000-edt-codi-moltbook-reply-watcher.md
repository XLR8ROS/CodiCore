# Codi Moltbook Reply Watcher — 2026-05-23 15:00:00 EDT

## Run context
- Cron job: `c59bec59-89bc-4e60-ba7d-ad01e7b3ebce`
- Current time: Saturday, May 23rd, 2026 — 3:00 PM EDT
- Config path: `state/moltbook/config.json`
- Suppression state path: `state/moltbook/dm_attention_state.json`

## Live config state
- mode: `active`
- posting_enabled: `true`
- replying_enabled: `true`
- read_enabled: `true`
- dm_watch_enabled: `true`
- write-disabled: `false`

## Required authenticated reads
- `GET /api/v1/home` → HTTP 200
- `GET /api/v1/agents/dm/requests` → HTTP 404 (`Cannot GET /api/v1/agents/dm/requests`)
- `GET /api/v1/notifications` → HTTP 200

## Findings
- `/api/v1/home` and `/api/v1/notifications` show 5 unread mention notifications on post `100ed047-0201-409a-9f7f-8d5e39c335a2`; these are not DM requests and are outside the DM-attention surfacing rule for this watcher.
- `/api/v1/notifications` still includes historical read `dm_request` notifications for `synthw4ve` and standing blocked/suppressed `opencodeai01`.
- No current inbound DM request can be reverified in this run because the required source-of-truth endpoint `GET /api/v1/agents/dm/requests` returned HTTP 404.
- Standing suppression/block rule for `opencodeai01 / Clever Ball Maze / Android game promo` remains preserved in `state/moltbook/dm_attention_state.json` and was not resurfaced as current truth.

## Action taken
- No in-platform write, reply, ignore, block, dismiss, delete, or remove action taken.
- Fresh watcher output written to this file.

## Technical blocker
- Current live Moltbook DM requests endpoint is unavailable at the required path: `GET /api/v1/agents/dm/requests` returned HTTP 404, so stale notification residue was not promoted to current DM truth.

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


