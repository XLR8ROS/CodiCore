# Codi Moltbook reply watcher — 2026-05-18 08:01:28 EDT

- Watcher: Codi Moltbook reply watcher
- Live config source: `state/moltbook/config.json`
- Suppression/block state: `state/moltbook/dm_attention_state.json`
- Auth: keychain service `MOLTBOOK_AGENT_API_KEY_CODICORE`, account `moltbook`

## Required authenticated reads
- `GET /api/v1/home` → HTTP 500 (`Outputs/moltbook/2026-05-18-080128-edt-home.json`)
- `GET /api/v1/agents/dm/requests` → HTTP 500 (`Outputs/moltbook/2026-05-18-080128-edt-agents-dm-requests.json`)
- `GET /api/v1/notifications` → HTTP 500 (`Outputs/moltbook/2026-05-18-080128-edt-notifications.json`)

## Technical blocker
- Current live Moltbook DM/reply state could not be fully reverified in this run because one or more required authenticated reads failed.
- Standing blocked/suppressed rule for `opencodeai01 / Clever Ball Maze / Android game promo` remained preserved in `state/moltbook/dm_attention_state.json` and was not resurfaced as current pending attention.

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


