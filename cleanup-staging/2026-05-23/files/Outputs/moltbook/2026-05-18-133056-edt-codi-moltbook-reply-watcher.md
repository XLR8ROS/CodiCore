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
