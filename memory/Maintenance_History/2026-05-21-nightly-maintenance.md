# Nightly XOS Maintenance — 2026-05-21 02:17 EDT

## Health
- OpenClaw version: `2026.5.12` (`f066dd2`) — verified via `openclaw --version`.
- Gateway: running. `openclaw status` reports local gateway reachable at `ws://127.0.0.1:18789` and Gateway service `LaunchAgent installed · loaded · running (pid 8170, state active)`.
- RPC probe: degraded. `openclaw rpc ping` failed with `Unknown command: openclaw rpc`. No built-in command or plugin CLI metadata owns `rpc`.
- Qdrant LaunchAgent/service `ai.xos.qdrant`: failed. `launchctl print gui/$(id -u)/ai.xos.qdrant` and `launchctl print system/ai.xos.qdrant` both reported the service could not be found.
- Qdrant readiness on `127.0.0.1:6333`: failed. `curl` could not connect to the port for `/readyz` or `/collections`.
- Critical comms/core ops path: present. `state`, `Outputs`, `maintenance`, `memory`, `state/moltbook/config.json`, and `Outputs/moltbook` are present.
- Additional degraded state: `openclaw status` reports `Heartbeat 30m (main), disabled (codi)`.

## Memory
- `memory/2026-04-13.md`: not present, so no direct review was possible for that date-specific file.
- Latest operational state reviewed from `memory/2026-05-21.md` and recent maintenance notes.
- Decisions:
  - Stale Moltbook notifications must not be treated as current DM truth without current-run revalidation from the live DM requests endpoint.
  - When required Moltbook reads fail, the watcher must surface a live-state verification blocker instead of carrying forward stale findings.
  - Semantic promotion must stay separate from raw event traces and should only upsert validated material.
- Durable preferences:
  - Reg prefers exact evidence, simple durable logs, direct answers, preserved original state, and no silent capability downgrade from actionable work to passive summary.
  - Reliable logs are preferred over cleverness.
- Canon candidates:
  - Moltbook operational doctrine around stale-finding suppression and live-state revalidation remains bulletin-worthy.
  - Evidence-first execution discipline remains a strong canon candidate because it materially changes safe agent behavior.
- Task outcomes:
  - Recent Moltbook watcher runs repeatedly hit HTTP 404 on `/api/v1/agents/dm/requests`, so canonical current inbound DM-request state could not be fully reverified.
  - Recent Moltbook curiosity pulse successfully authenticated, posted a comment, and verified publish flow.
  - Local Qdrant remains absent/unreachable at `127.0.0.1:6333`.
- Bulletin-worthy items:
  - Local semantic infrastructure remains down: `ai.xos.qdrant` not found and `127.0.0.1:6333` unreachable.
  - Codi heartbeat remains disabled in current `openclaw status` output and should be reviewed separately if active heartbeat coverage is expected.
  - Moltbook live API remains degraded at the DM-request endpoint while home/notifications endpoints continue to work.

## Semantic
- Embedding provider path: unavailable in this runtime because `OPENAI_API_KEY` is missing.
- Result: semantic section stopped cleanly after logging the missing credential path.
- No Qdrant collection creation, upsert, or retrieval smoke test was attempted because the embedding provider path was unavailable.
- Promoted semantic memory remains separate from raw event traces; no raw event traces were promoted.

## Next Step
Restore or install the local Qdrant service `ai.xos.qdrant` so `127.0.0.1:6333` becomes reachable, then rerun the semantic section with valid embedding credentials to create collection `xos_semantic_memory`, upsert a small validated test set, and run the retrieval smoke test; separately review why `Heartbeat` is `disabled (codi)` and why `/api/v1/agents/dm/requests` still returns HTTP 404.
