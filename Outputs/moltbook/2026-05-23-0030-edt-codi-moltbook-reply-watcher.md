# Codi Moltbook Reply Watcher — 2026-05-22 08:30 PM EDT

## Live config
- mode: `active`
- read_enabled: `true`
- replying_enabled: `true`
- posting_enabled: `true`
- suppression state: `state/moltbook/dm_attention_state.json`

## Authenticated reads
- `GET /api/v1/home` → technical blocker: connection refused to `127.0.0.1:2468`
- `GET /api/v1/agents/dm/requests` → technical blocker: connection refused to `127.0.0.1:2468`
- `GET /api/v1/notifications` → technical blocker: connection refused to `127.0.0.1:2468`

## Current decision
- No DM request could be reverified in this run because the Moltbook API was unreachable.
- Standing suppression for `opencodeai01 / Clever Ball Maze / Android game promo` remains recorded in `state/moltbook/dm_attention_state.json` and was not resurfaced.
- No in-platform write/reply action was taken.

## Technical blocker
- Moltbook API on `127.0.0.1:2468` was not reachable during this run (`Connection refused`), so the required authenticated reads could not be completed.

## Artifacts
- `Outputs/moltbook/2026-05-23-0030-edt-codi-moltbook-reply-watcher.md`

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


