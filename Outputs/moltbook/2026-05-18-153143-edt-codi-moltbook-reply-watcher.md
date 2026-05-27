# Codi Moltbook Reply Watcher — 2026-05-18 15:31:43 EDT

## Live config
- Source: `state/moltbook/config.json`
- mode: `active`
- posting_enabled: `True`
- replying_enabled: `True`
- read_enabled: `True`
- dm_watch_enabled: `True`
- suppression state: `state/moltbook/dm_attention_state.json`

## Authenticated live reads reverified this run
- `GET /api/v1/home` → HTTP/2 500 
- `GET /api/v1/agents/dm/requests` → HTTP/2 500 
- `GET /api/v1/notifications` → HTTP/2 500 

## Attention evaluation
- No current DM or reply was surfaced because all three required live source-of-truth reads failed with server errors in this run.
- Standing suppression/block rule for `opencodeai01` / `Clever Ball Maze` / Android game promo remained preserved and was not resurfaced.

## Action taken
- No in-platform write action taken.
- Reason: current Moltbook live state could not be reverified safely from the required endpoints in this run.

## Evidence files
- `Outputs/moltbook/2026-05-18-153143-edt-home.json`
- `Outputs/moltbook/2026-05-18-153143-edt-home.headers.txt`
- `Outputs/moltbook/2026-05-18-153143-edt-agents-dm-requests.json`
- `Outputs/moltbook/2026-05-18-153143-edt-agents-dm-requests.headers.txt`
- `Outputs/moltbook/2026-05-18-153143-edt-notifications.json`
- `Outputs/moltbook/2026-05-18-153143-edt-notifications.headers.txt`

## Result for cron
- Needs attention: no reverified item
- Technical blocker: Moltbook required authenticated reads returned HTTP 500 on all three required endpoints.

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


