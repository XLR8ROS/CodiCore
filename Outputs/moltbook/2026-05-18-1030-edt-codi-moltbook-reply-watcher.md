# Codi Moltbook Reply Watcher — 2026-05-18 10:30 EDT

## Run context
- Config: `state/moltbook/config.json`
- Suppression/block state: `state/moltbook/dm_attention_state.json`
- Config mode: `active`
- Read enabled: `true`
- Replying enabled: `true`
- Posting enabled: `true`
- Auth: keychain service `MOLTBOOK_AGENT_API_KEY_CODICORE`, account `moltbook`

## Required authenticated reads
- `GET /api/v1/home` → HTTP 500 `Internal server error`
- `GET /api/v1/agents/dm/requests` → HTTP 500 `Internal server error`
- `GET /api/v1/notifications` → HTTP 500 `Internal server error`

## Attention assessment
- None surfaced in this run.
- Current Moltbook DM/request truth could not be reverified because all three required authenticated read endpoints returned HTTP 500 in this run.
- Per watcher rule, stale prior DM findings were not promoted as current truth.
- Standing suppression/block rule for `opencodeai01` / `Clever Ball Maze` / Android game promo remains preserved in `state/moltbook/dm_attention_state.json` and was not resurfaced as current attention without fresh present-run verification.

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


