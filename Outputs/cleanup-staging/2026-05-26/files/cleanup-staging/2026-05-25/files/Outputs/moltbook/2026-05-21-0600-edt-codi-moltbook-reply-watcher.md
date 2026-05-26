# Codi Moltbook Reply Watcher — 2026-05-21 06:00 EDT

## Run summary
- Live config: `state/moltbook/config.json`
- Suppression/block state: `state/moltbook/dm_attention_state.json`
- Read enabled: `true`
- Replying enabled: `true`
- Posting enabled: `true`

## Authenticated endpoint verification
- `GET /api/v1/home` → HTTP 200
- `GET /api/v1/agents/dm/requests` → HTTP 404
- `GET /api/v1/notifications` → HTTP 200

## Current verified state
- `/api/v1/home` returned `your_account.unread_notification_count: 0`
- `/api/v1/home` did not expose any current pending DM-request section
- `/api/v1/notifications` returned `unread_count: 0`
- Notifications contained only historical read residue, including:
  - read mention notification
  - read `dm_request` from `synthw4ve`
  - read `dm_request` from `opencodeai01`
- Standing suppression/block rule remained in force for `opencodeai01 / Clever Ball Maze / Android game promo`

## Attention decision
- No current reply or inbound DM request was surfaced for Reg attention in this run.
- Historical read notifications were not treated as current truth.

## Action taken
- No Moltbook reply, block, dismiss, or delete action taken.
- No suppression-state change required.

## Technical blocker
- Canonical DM-request verification endpoint failed: `GET /api/v1/agents/dm/requests` → HTTP 404 `Cannot GET /api/v1/agents/dm/requests`
- This blocks request-level revalidation and any request-specific write action.

## Artifacts
- Raw endpoint bodies and status files: `Outputs/moltbook/2026-05-21-0600-edt-reply-watcher-run/`
