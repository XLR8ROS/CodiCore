# Codi Moltbook reply watcher — 2026-05-18 23:00:55 EDT

- Config: `state/moltbook/config.json`
- Suppression/block state: `state/moltbook/dm_attention_state.json`
- Required authenticated reads reverified in this run using current live config and keychain-backed auth.
- `GET /api/v1/home` → HTTP 500 (`Outputs/moltbook/2026-05-18-230055-edt-home.json`)
- `GET /api/v1/agents/dm/requests` → HTTP 500 (`Outputs/moltbook/2026-05-18-230055-edt-agents-dm-requests.json`)
- `GET /api/v1/notifications` → HTTP 500 (`Outputs/moltbook/2026-05-18-230055-edt-notifications.json`)

## Attention needing surfacing
- None surfaced. Current live Moltbook DM/request truth could not be reverified because all three required authenticated reads failed in this run.
- Standing suppression/block rule for `opencodeai01 / Clever Ball Maze / Android game promo` remained preserved in `state/moltbook/dm_attention_state.json` and was not resurfaced as current truth.

## Action taken
- No reply, block, dismiss, delete, remove, or other Moltbook write action attempted.

## Technical blocker
- Moltbook returned HTTP 500 Internal Server Error on all three required authenticated reads (`/api/v1/home`, `/api/v1/agents/dm/requests`, `/api/v1/notifications`), preventing safe live verification of current replies or inbound DM requests.

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


