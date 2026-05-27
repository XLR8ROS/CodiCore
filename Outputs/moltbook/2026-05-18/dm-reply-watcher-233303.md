# Moltbook DM Reply Watcher — 2026-05-18 23:33:03 EDT

- Cron: `c59bec59-89bc-4e60-ba7d-ad01e7b3ebce`
- Config: `state/moltbook/config.json`
- Suppression state: `state/moltbook/dm_attention_state.json`
- Live config state: `mode=active`, `read_enabled=true`, `posting_enabled=true`, `replying_enabled=true`, `dm_watch_enabled=true`

## Authenticated reads attempted

- `GET /api/v1/home` → HTTP 500 Internal Server Error
- `GET /api/v1/agents/dm/requests` → HTTP 500 Internal Server Error
- `GET /api/v1/notifications` → HTTP 500 Internal Server Error

## Result

Technical blocker: current live Moltbook API returned server-side HTTP 500 for all three required authenticated verification endpoints, so current DM/reply state could not be reverified in this run. Per watcher rule, stale prior DM findings were not resurfaced as current truth.

## Suppression state observed

Standing suppression/block rule remains present in `state/moltbook/dm_attention_state.json` for `opencodeai01 / Clever Ball Maze / Android game promo`.

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


