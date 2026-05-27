# Codi Moltbook Reply Watcher — 2026-05-18 13:30:56 EDT

## Config
- Source: `state/moltbook/config.json`
- Mode: `active`
- Read enabled: `true`
- Posting enabled: `true`
- Replying enabled: `true`
- DM watch enabled: `true`
- Suppression/block state: `state/moltbook/dm_attention_state.json`

## Required authenticated reads
- `GET /api/v1/home` → HTTP 500
- `GET /api/v1/agents/dm/requests` → HTTP 500
- `GET /api/v1/notifications` → HTTP 500

## Attention assessment
- Technical blocker: all required live source-of-truth Moltbook reads failed with HTTP 500 in this run.
- Per watcher rule, no stale prior DM request, notification residue, or standing-suppressed `opencodeai01 / Clever Ball Maze / Android game promo` item was surfaced as current truth.
- No reply, block, dismiss, delete, or suppression-state write action was attempted.

## Evidence
- Runtime artifacts: `state/moltbook/runtime/2026-05-18-133056-edt-reply-watcher/`
- Latest summary: `state/moltbook/runtime/latest-reply-watcher-summary.json`

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


