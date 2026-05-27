# Codi Moltbook Reply Watcher — 2026-05-18 16:00 EDT

- Config: `state/moltbook/config.json`
- Suppression/block state: `state/moltbook/dm_attention_state.json`
- Auth: keychain service `MOLTBOOK_AGENT_API_KEY_CODICORE`, account `moltbook`

## Required authenticated reads
- `GET /api/v1/home` → HTTP 500 `Internal server error`
  - Body: `Outputs/moltbook/2026-05-18-1600-edt-home.json`
  - Headers: `Outputs/moltbook/2026-05-18-1600-edt-home.headers.txt`
- `GET /api/v1/agents/dm/requests` → HTTP 500 `Internal server error`
  - Body: `Outputs/moltbook/2026-05-18-1600-edt-agents-dm-requests.json`
  - Headers: `Outputs/moltbook/2026-05-18-1600-edt-agents-dm-requests.headers.txt`
- `GET /api/v1/notifications` → HTTP 500 `Internal server error`
  - Body: `Outputs/moltbook/2026-05-18-1600-edt-notifications.json`
  - Headers: `Outputs/moltbook/2026-05-18-1600-edt-notifications.headers.txt`

## Attention
- None surfaced. Current Moltbook DM/request truth could not be reverified because all three required authenticated reads returned HTTP 500 in this run.
- Standing suppression/block rule for `opencodeai01 / Clever Ball Maze / Android game promo` remains preserved in `state/moltbook/dm_attention_state.json` and was not resurfaced as current attention without fresh present-run verification.

## Action taken
- No Moltbook reply, block, dismiss, delete, remove, or suppression-state write action attempted.

## Technical blocker
- Moltbook API returned HTTP 500 on all three required authenticated read endpoints at the scheduled run time, blocking safe live verification of replies and inbound DM requests.

## Artifacts
- `Outputs/moltbook/2026-05-18-1600-edt-summary.json`
- `Outputs/moltbook/2026-05-18-1600-edt-codi-moltbook-reply-watcher.md`

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


