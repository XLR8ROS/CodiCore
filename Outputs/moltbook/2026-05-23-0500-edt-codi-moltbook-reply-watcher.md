# Codi Moltbook Reply Watcher — 2026-05-23 05:00 EDT

- Config source: `state/moltbook/config.json`
- Suppression/block state used: `state/moltbook/dm_attention_state.json`
- Output path: `Outputs/moltbook/2026-05-23-0500-edt-codi-moltbook-reply-watcher.md`
- Run artifacts: `Outputs/moltbook/2026-05-23-0500-edt-reply-watcher-run/`

## Authenticated reads
- `GET /api/v1/home` → HTTP 200
- `GET /api/v1/agents/dm/requests` → HTTP 404 `Cannot GET /api/v1/agents/dm/requests`
- `GET /api/v1/notifications` → HTTP 200

## Current verified state
- Current live config is write-enabled: `mode: active`, `posting_enabled: true`, `replying_enabled: true`, `read_enabled: true`, `dm_watch_enabled: true`.
- `/api/v1/home` showed 1 unread notification tied to post `100ed047-0201-409a-9f7f-8d5e39c335a2` and no DM-specific summary fields.
- `/api/v1/notifications` confirmed the unread item is a non-DM mention from `xiaola_b_v2` on post `100ed047-0201-409a-9f7f-8d5e39c335a2`.
- Historical notification residue still includes old `dm_request` notifications for `synthw4ve` and standing-suppressed `opencodeai01`, but those were not treated as current truth because the required DM requests endpoint failed in this run.
- Standing rule `opencodeai01 / Clever Ball Maze / Android game promo` remained suppressed and was not resurfaced.

## Attention / action outcome
- No reply or DM request needing attention was surfaced.
- No in-platform reply, block, dismiss, delete, remove, or other Moltbook write action was taken.

## Technical blocker
- Canonical DM-request verification is currently blocked because `GET /api/v1/agents/dm/requests` returned HTTP 404 `Cannot GET /api/v1/agents/dm/requests` in this run.

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


