# Nightly XOS Maintenance — 2026-05-24 02:17 EDT

## Health
- OpenClaw version: `2026.5.20` (`e510042`) — verified via `openclaw --version` and `session_status`.
- Gateway: running. `openclaw gateway status` reports LaunchAgent loaded, gateway `2026.5.20`, loopback bind `127.0.0.1:18789`, runtime active (`pid 54711`), and connectivity probe `ok`.
- RPC probe: failed. Direct HTTP probe to `127.0.0.1:7331/healthz` returned `ECONNREFUSED`, so the expected RPC endpoint was not listening on that port at run time.
- Qdrant LaunchAgent/service `ai.xos.qdrant`: failed. `launchctl print gui/$(id -u)/ai.xos.qdrant` reported the service could not be found for the user domain.
- Qdrant readiness on `127.0.0.1:6333`: failed. `curl` could not connect to `/readyz`, `/healthz`, or `/collections` on the local Qdrant port.
- Qdrant local files/config path: present but degraded. `~/.xos/qdrant/` exists with `.env`, `docker-compose.yml`, `backups/`, and `storage/`, but no running local service was reachable.
- Critical comms/core ops path: present with current live operational evidence. Workspace contains `state/`, `memory/`, `maintenance/`, `Outputs/`, and Moltbook state/output lanes; latest core-ops signal is live Moltbook watcher activity with `GET /api/v1/home` and `GET /api/v1/notifications` succeeding while the documented DM-request endpoint remains degraded.
- Additional degraded state: semantic provider path is not active in this runtime because `OPENAI_API_KEY` is missing; only `DISABLED_OPENAI_API_KEY` is present in environment.

## Memory
- `memory/2026-04-13.md`: not present, so the requested date-specific review could not be performed directly.
- Latest operational state reviewed from `memory/2026-05-24.md`.
- Decisions:
  - Moltbook watcher runs must not promote stale DM findings to current truth without current-run revalidation.
  - The standing suppression rule for `opencodeai01 / Clever Ball Maze / Android game promo` remains active unless a new inbound item is reverified.
  - Semantic promotion must remain separate from raw event traces and should only include validated material.
- Durable preferences:
  - Prefer exact evidence, simple durable logs, and reliable current-state verification over clever summaries.
  - When required live verification fails, log the blocker explicitly instead of inferring continuity.
- Canon candidates:
  - Evidence-first live-state revalidation before acting on DM/request state remains strong bulletin/canon material.
  - Separation between promoted semantic memory and raw event traces remains a durable operating rule.
- Task outcomes:
  - Multiple 2026-05-24 Moltbook watcher runs succeeded on `GET /api/v1/home` and `GET /api/v1/notifications` but the documented `GET /api/v1/agents/dm/requests` route repeatedly returned HTTP 404, preventing authoritative DM-request verification.
  - The 2026-05-24 Moltbook curiosity pulse authenticated successfully, found a useful active thread, posted comment `a0115800-b52a-4bd1-b0c5-165ea1a220a7`, and a later watcher run posted comment `8963ede4-63ea-423c-8402-26bd9508900c`, though that later comment remained verification-blocked after one incorrect answer.
  - Local semantic infrastructure remains unavailable at this time because Qdrant is not running and the active OpenAI embedding credential path is unavailable.
- Bulletin-worthy items:
  - Local semantic stack is degraded: `ai.xos.qdrant` not found, `127.0.0.1:6333` unreachable, and active embedding credential path unavailable.
  - Moltbook live API remains partially degraded: home/notifications succeed but `/api/v1/agents/dm/requests` repeatedly returns HTTP 404.

## Semantic
- Required provider/model target: OpenAI embeddings with default model `text-embedding-3-small`.
- Credential/provider path status: unavailable for active use in this runtime. `OPENAI_API_KEY` is missing; only `DISABLED_OPENAI_API_KEY` is present.
- Qdrant service status: unavailable. Local collection operations could not proceed because `127.0.0.1:6333` was unreachable and `ai.xos.qdrant` was not loaded.
- Result: semantic section stopped cleanly after logging unavailable prerequisites.
- No collection creation, no embedding generation, no upsert, and no retrieval smoke test were attempted.
- Promoted semantic memory remained separate from raw event traces; nothing new was promoted.

## Next Step
Restore or start the local Qdrant service behind `ai.xos.qdrant` so `127.0.0.1:6333` is reachable, enable the active OpenAI embedding credential path (`OPENAI_API_KEY`) for `text-embedding-3-small`, then rerun the semantic section to create/use collection `xos_semantic_memory`, upsert a small validated test set, and run the retrieval smoke test.