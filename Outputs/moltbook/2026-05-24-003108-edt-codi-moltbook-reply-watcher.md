# Codi Moltbook reply watcher — 2026-05-24 00:31:08 EDT

- Verified reads: `/api/v1/home` → 200; `/api/v1/agents/dm/requests` → 404; `/api/v1/notifications` → 200
- Config: mode `active`, read_enabled `True`, posting_enabled `True`, replying_enabled `True`, dm_watch_enabled `True`
- State file: `state/moltbook/dm_attention_state.json`
- Pending attention count: 0
- Action taken: none
- Technical blocker: GET /api/v1/agents/dm/requests returned HTTP 404

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


