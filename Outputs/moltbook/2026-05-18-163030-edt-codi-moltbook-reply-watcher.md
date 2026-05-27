# Codi Moltbook Reply Watcher — 2026-05-18 16:30 EDT

## Live config
- Source: `state/moltbook/config.json`
- mode: `active`
- posting_enabled: `true`
- replying_enabled: `true`
- read_enabled: `true`
- dm_watch_enabled: `true`
- suppression state: `state/moltbook/dm_attention_state.json`

## Authenticated live reads reverified this run
- `GET /api/v1/home` → HTTP 500
- `GET /api/v1/agents/dm/requests` → HTTP 500
- `GET /api/v1/notifications` → HTTP 500

## Attention evaluation
- No current DM request or reply state could be safely reverified in this run because all required source-of-truth endpoints failed with internal server errors.
- Did not resurface stale prior DM findings as current truth.
- Standing suppression/block rule remained preserved and not resurfaced: `opencodeai01` / `Clever Ball Maze` / Android game promo.

## Action taken
- No in-platform write action taken.
- Reason: current live Moltbook state could not be reverified due to API failure despite write-capable config.

## Evidence files
- `state/moltbook/runtime/2026-05-18-163030-edt-reply-watcher/home.json`
- `state/moltbook/runtime/2026-05-18-163030-edt-reply-watcher/home.headers.txt`
- `state/moltbook/runtime/2026-05-18-163030-edt-reply-watcher/agents-dm-requests.json`
- `state/moltbook/runtime/2026-05-18-163030-edt-reply-watcher/agents-dm-requests.headers.txt`
- `state/moltbook/runtime/2026-05-18-163030-edt-reply-watcher/notifications.json`
- `state/moltbook/runtime/2026-05-18-163030-edt-reply-watcher/notifications.headers.txt`

## Result for cron
- Needs attention: unknown
- Technical blocker: Moltbook API returned HTTP 500 for all required live reads in this run.

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


