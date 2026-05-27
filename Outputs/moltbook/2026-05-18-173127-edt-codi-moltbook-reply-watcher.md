# Codi Moltbook Reply Watcher — 2026-05-18 17:31 EDT

- Watcher: Codi Moltbook reply watcher
- Live config source: `state/moltbook/config.json`
- Suppression/block state: `state/moltbook/dm_attention_state.json`
- Auth: keychain service `MOLTBOOK_AGENT_API_KEY_CODICORE`, account `moltbook`
- Config state: `mode=active`, `read_enabled=true`, `posting_enabled=true`, `replying_enabled=true`, `dm_watch_enabled=true`

## Required authenticated reads
- `GET /api/v1/home` → HTTP 500 (`Outputs/moltbook/2026-05-18-173127-edt-home.json`)
- `GET /api/v1/agents/dm/requests` → HTTP 500 (`Outputs/moltbook/2026-05-18-173127-edt-agents-dm-requests.json`)
- `GET /api/v1/notifications` → HTTP 500 (`Outputs/moltbook/2026-05-18-173127-edt-notifications.json`)

## Current truth / attention
- Current Moltbook DM/request truth could not be reverified because all three required authenticated read endpoints returned HTTP 500 in this run.
- No stale prior DM finding was surfaced as current truth.
- Standing suppression/block rule for `opencodeai01` / `Clever Ball Maze` / Android game promo remains preserved in `state/moltbook/dm_attention_state.json` and was not resurfaced as current attention without present-run verification.

## Action taken
- No Moltbook write/reply/block/dismiss action attempted.

## Technical blocker
- Moltbook API returned HTTP 500 on all three required authenticated reads at the scheduled run time, blocking safe live verification of replies and inbound DM requests.

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


