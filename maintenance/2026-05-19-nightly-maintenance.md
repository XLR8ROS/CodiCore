# Nightly XOS Maintenance — 2026-05-19 02:17 EDT

## Health
- OpenClaw version: `2026.5.12` (`f066dd2`) — verified via `openclaw --version`.
- Gateway: running. `openclaw status` reports local gateway reachable at `ws://127.0.0.1:18789` and Gateway service `LaunchAgent installed · loaded · running (pid 95395, state active)`.
- RPC probe: degraded. Attempted `openclaw rpc ping`, but this CLI build reported `Unknown command: openclaw rpc`. No alternate RPC subcommand was available from `openclaw --help`, so direct RPC ping could not be completed by that path.
- Qdrant LaunchAgent/service `ai.xos.qdrant`: failed. `launchctl print gui/$(id -u)/ai.xos.qdrant` returned `Could not find service "ai.xos.qdrant" in domain for user gui: 501`.
- Qdrant readiness on `127.0.0.1:6333`: failed. HTTP checks and collection creation attempts could not connect: `curl: (7) Failed to connect to 127.0.0.1 port 6333`.
- Critical comms/core ops path: core local paths are present and private (`state`, `Outputs`, `maintenance`, `memory` all present). Moltbook core local paths are also present: `state/moltbook/config.json` and `Outputs/moltbook/`. Telegram channel is `ON` and `OK` in `openclaw status`.
- Additional degraded state: `openclaw status` reports `Heartbeat 30m (main), disabled (codi)` and `Update available · pnpm · npm update 2026.5.18`.

## Memory
- `memory/2026-04-13.md`: not present, so no direct review was possible for that date-specific file.
- Latest operational state reviewed from `memory/2026-05-19.md`, `memory/2026-05-17.md`, and prior maintenance log `maintenance/2026-05-17-nightly-maintenance.md`.
- Decisions:
  - Stale Moltbook notifications must not be treated as current DM truth without current-run revalidation from the live DM requests endpoint.
  - When all required Moltbook reads fail, the watcher must surface a live-state verification blocker instead of carrying forward stale findings.
  - Semantic promotion must stay separate from raw event traces and should only upsert validated material.
- Durable preferences:
  - Reg prefers exact evidence, simple durable logs, direct answers, preserved original state, and no silent capability downgrade from actionable work to passive summary.
  - Reliable logs are preferred over cleverness.
- Canon candidates:
  - Moltbook operational doctrine around stale-finding suppression and live-state revalidation remains bulletin-worthy.
  - Evidence-first execution discipline remains a strong canon candidate because it materially changes safe agent behavior.
- Task outcomes:
  - Current 2026-05-19 Moltbook watcher runs repeatedly hit HTTP 500 on `/api/v1/home`, `/api/v1/agents/dm/requests`, and `/api/v1/notifications`, so no current inbound DM/reply state was safely reverified.
  - Standing suppressed `opencodeai01 / Clever Ball Maze / Android game promo` remained suppressed and was not resurfaced as current truth.
  - Prior 2026-05-17 state shows `synthw4ve` attention appeared earlier, later cleared, and watcher discipline correctly shifted to current-run truth over stale residues.
- Bulletin-worthy items:
  - Local semantic infrastructure remains down: `ai.xos.qdrant` not found and `127.0.0.1:6333` unreachable.
  - Codi heartbeat remains disabled in current `openclaw status` output and should be reviewed separately if active heartbeat coverage is expected.
  - Moltbook live API is currently degraded with repeated HTTP 500 failures across all three required watcher endpoints.

## Semantic
- Embedding provider path: available.
- Evidence:
  - Direct OpenAI embeddings test using default model `text-embedding-3-small` succeeded.
  - Returned embedding vector size: `1536`.
- Validated semantic test set prepared:
  - validated fact: gateway was reachable and reported healthy enough for status inspection during this maintenance run.
  - validated fact: local Qdrant service was absent/unreachable during this maintenance run.
- Qdrant collection result: blocked cleanly.
  - Attempted to create/use collection `xos_semantic_memory` with vector size `1536` and cosine distance.
  - Collection creation failed because `127.0.0.1:6333` was unreachable.
- Retrieval smoke test: not run because collection creation/upsert could not complete.
- Result: semantic section stopped cleanly after validating embeddings and confirming local Qdrant unavailability. No raw event traces were promoted.

## Next Step
Exact next step: restore or install the local Qdrant service `ai.xos.qdrant` so `127.0.0.1:6333` becomes reachable, then rerun the semantic section to create collection `xos_semantic_memory`, upsert the validated test set, and run the retrieval smoke test; separately, review why `Heartbeat` is `disabled (codi)` and why Moltbook required endpoints are returning HTTP 500.
