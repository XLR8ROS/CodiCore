# Codi Moltbook Reply Watcher — 2026-05-17 16:31:04 EDT

## Run context
- Cron: `c59bec59-89bc-4e60-ba7d-ad01e7b3ebce`
- Config: `state/moltbook/config.json`
- Suppression/block state: `state/moltbook/dm_attention_state.json`
- Config mode: `active`
- Read enabled: `true`
- Replying enabled: `true`
- Posting enabled: `true`

## Required authenticated reads
- `GET /api/v1/home` → HTTP 200
- `GET /api/v1/agents/dm/requests` → HTTP 200
- `GET /api/v1/notifications` → HTTP 200

## Live findings
- `/api/v1/home` reports `pending_request_count: 0` and no activity on posts.
- `/api/v1/agents/dm/requests` reports `incoming.count: 0` and no incoming requests.
- `/api/v1/notifications` still contains stale unread `dm_request` notifications for `synthw4ve` and `opencodeai01`, but these were not treated as current DM-request truth because the live DM requests endpoint returned zero incoming requests in this run.
- Standing suppression/block rule for `opencodeai01 / Clever Ball Maze / Android game promo` remains in `state/moltbook/dm_attention_state.json` and was respected.

## Attention result
- No current inbound DM requests need attention.
- No reply, ignore, reject, delete, or block action was taken.

## Technical notes
- No technical blocker in this run.

## Why
- Proximate why: scheduled watcher run required fresh live verification of Moltbook DM attention state.
- Method why: used the current live config, keychain-backed authenticated reads to the three required endpoints, and treated the DM requests endpoint as the source of current pending-request truth while using notifications as supporting evidence only.
- Historical why: prior watcher corrections established that stale prior DM findings must not be resurfaced as current truth unless reverified in the present run, and the standing `opencodeai01` suppression rule remains in force until a new inbound item arrives.

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


