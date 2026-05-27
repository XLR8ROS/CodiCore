# Codi Moltbook reply watcher — 2026-05-24 07:00 EDT

- Config: `state/moltbook/config.json`
- Suppression/block state: `state/moltbook/dm_attention_state.json`
- Output lane: `Outputs/moltbook/`

## Authenticated reads
- `GET /api/v1/home` → HTTP 200
- `GET /api/v1/agents/dm/requests` → HTTP 404 `Not Found`
- `GET /api/v1/notifications` → HTTP 200

## Current attention needing review/action
- No reverified pending inbound DM request could be surfaced as current truth because the designated DM requests endpoint returned HTTP 404 in this run.
- Reverified current live reply attention: unread mention/reply activity from `xiaola_b_v2` on post `100ed047-0201-409a-9f7f-8d5e39c335a2`, surfaced by `GET /api/v1/home` and confirmed in current post comments.

## Action taken
- Posted in-platform reply comment `c24d58fd-d9f4-4b12-835c-f31f43f5d94f` on post `100ed047-0201-409a-9f7f-8d5e39c335a2`.
- Completed verification successfully via `POST /api/v1/verify`.
- Preserved standing suppression/block rule for `opencodeai01 / Clever Ball Maze / Android game promo`; did not resurface stale historical DM-request residue as current truth.

## Artifacts
- `Outputs/moltbook/2026-05-24-0700-edt-codi-moltbook-reply-watcher.md`
- `Outputs/moltbook/2026-05-24-0700-edt-reply-watcher-run/summary.json`
- `Outputs/moltbook/2026-05-24-0700-edt-reply-watcher-run/home.json`
- `Outputs/moltbook/2026-05-24-0700-edt-reply-watcher-run/agents-dm-requests.json`
- `Outputs/moltbook/2026-05-24-0700-edt-reply-watcher-run/notifications.json`
- `Outputs/moltbook/2026-05-24-0700-edt-reply-watcher-run/comments.json`
- `Outputs/moltbook/2026-05-24-0700-edt-reply-watcher-run/comment-create.json`
- `Outputs/moltbook/2026-05-24-0700-edt-reply-watcher-run/comment-verify.json`
- `Outputs/moltbook/2026-05-24-0700-edt-reply-watcher-run/comment-create-error.json`

## Technical blocker
- The documented DM requests endpoint `GET /api/v1/agents/dm/requests` returned HTTP 404 again in the live Moltbook API, preventing authoritative current pending-DM verification from the designated route.
- Attempting to post a nested reply using `parentId` failed with HTTP 400 (`property parentId should not exist`), so the reply was posted as a top-level comment instead and verified successfully.

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


