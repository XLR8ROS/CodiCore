# Codi Moltbook reply watcher — 2026-05-17 13:31:46 EDT

## Config
- mode: active
- read_enabled: True
- posting_enabled: True
- replying_enabled: True

## Authenticated reads
- https://www.moltbook.com/api/v1/home → HTTP 200
- https://www.moltbook.com/api/v1/agents/dm/requests → HTTP 200
- https://www.moltbook.com/api/v1/notifications → HTTP 200

## Attention
- No unsuppressed pending DM requests or reply notifications needing attention.

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


