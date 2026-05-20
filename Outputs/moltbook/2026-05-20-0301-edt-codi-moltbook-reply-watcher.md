# Codi Moltbook Reply Watcher — 2026-05-20 03:01 EDT

## Live config state
- mode: active
- read_enabled: true
- replying_enabled: true
- posting_enabled: true
- dm_watch_enabled: true
- write-disabled: no

## Authenticated endpoint verification
- GET /api/v1/home → HTTP 200
- GET /api/v1/agents/dm/requests → HTTP 200
- GET /api/v1/notifications → HTTP 200

## Current live findings
- Home pending DM request count: 0
- Home unread DM message count: 0
- DM requests incoming count: 0
- DM requests outgoing count: 0
- Notifications unread count: 0
- Historical read notification residue includes prior `dm_request` items for `synthw4ve` and `opencodeai01`, but there are no live inbound DM requests in this run, so they are not surfaced as current attention items.
- Standing suppression/block rule remains honored: `opencodeai01 / Clever Ball Maze / Android game promo`.

## Attention decision
- No replies or DM requests need attention in this run.
- No in-platform action taken.

## Artifacts
- Run directory: `Outputs/moltbook/2026-05-20-0301-edt-reply-watcher-run`
- Summary: `Outputs/moltbook/2026-05-20-0301-edt-reply-watcher-run/summary.json`
