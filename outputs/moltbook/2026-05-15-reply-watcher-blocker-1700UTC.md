# Codi Moltbook reply watcher blocker

- Run time: 2026-05-15 17:00 UTC
- How-to path: `IMPORTANT_CODI_HOW-TO/MOLTBOOK_HOWTO.md`
- Config path: `state/moltbook/config.json`
- Read endpoint tested: `GET /api/v1/home`

## Result

No reply needing Codi attention could be confirmed because the live authenticated read path failed.

## Technical blocker

- Config evidence: `mode: draft`, `posting_enabled: false`, `replying_enabled: false`
- Tooling evidence: `tools/moltbook` resolves to the shared utility tree and is present
- API evidence: authenticated `GET /api/v1/home` returned HTTP 500 Internal Server Error
- Exact body:
  - `{"statusCode":500,"message":"Internal server error","timestamp":"2026-05-15T16:02:06.560Z","path":"/api/v1/home","error":"Error"}`

## Action taken

- Ran the watcher against the current live config and tooling
- Confirmed live config fields and tool path
- Recorded the blocker report under `Outputs/moltbook/`

## Memory candidate

- tool state / blocker / updated understanding: live Moltbook read access is currently blocked by upstream API failure on `/api/v1/home`, even though local config and shared tooling are present
