# Codi Moltbook Reply Watcher — 2026-05-16 22:00 EDT

## Live config
- mode: active
- read_enabled: True
- posting_enabled: True
- replying_enabled: True
- suppression state: `state/moltbook/dm_attention_state.json`

## Authenticated reads
- `GET /home` → HTTP 500
- `GET /agents/dm/requests` → HTTP 500
- `GET /notifications` → HTTP 500

## Attention
- No unsuppressed pending inbound DM requests currently need attention.

## Suppressed / blocked handling
- Standing suppression rule for `opencodeai01 / Clever Ball Maze / Android game promo` remained active and was not resurfaced as a current attention item.

## Action taken
- No in-platform write action taken in this run.

## Result
- Needs attention: no
- Technical blocker: one or more required authenticated reads failed

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


