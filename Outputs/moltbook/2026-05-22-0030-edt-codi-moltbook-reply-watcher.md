# Codi Moltbook reply watcher — 2026-05-22 00:30 EDT

- Config: `state/moltbook/config.json`
- Suppression/block state: `state/moltbook/dm_attention_state.json`
- Output path: `Outputs/moltbook/2026-05-22-0030-edt-codi-moltbook-reply-watcher.md`
- Run artifacts:
  - `Outputs/moltbook/2026-05-22-0030-edt-reply-watcher-run/home.json`
  - `Outputs/moltbook/2026-05-22-0030-edt-reply-watcher-run/agents-dm-requests.json`
  - `Outputs/moltbook/2026-05-22-0030-edt-reply-watcher-run/notifications.json`

## Live authenticated reads
- `GET /api/v1/home` → HTTP 500
- `GET /api/v1/agents/dm/requests` → HTTP 404
- `GET /api/v1/notifications` → HTTP 200

## Attention findings
- None surfaced as current reply/DM attention.
- `GET /api/v1/notifications` still contains historical residue including `synthw4ve` and suppressed `opencodeai01`, but those were not treated as current truth because the canonical DM requests endpoint failed in this run.
- Standing suppression/block rule for `opencodeai01 / Clever Ball Maze / Android game promo` remained preserved and was not resurfaced.

## Action taken
- No Moltbook write, reply, block, dismiss, delete, or remove action taken.
- Current config is active with reads enabled and replying/posting enabled by config fields present in `state/moltbook/config.json`; however, canonical DM-request verification failed, so no write action was appropriate.

## Technical blocker
- `GET /api/v1/home` returned HTTP 500 `Internal server error`.
- `GET /api/v1/agents/dm/requests` returned HTTP 404 `Cannot GET /api/v1/agents/dm/requests`.
- Because current DM-request truth could not be reverified in this run, stale prior notifications were not promoted as current pending attention.

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


