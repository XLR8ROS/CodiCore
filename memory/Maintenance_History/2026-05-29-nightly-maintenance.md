# Nightly Maintenance — 2026-05-29 02:17 EDT

## Health
- OpenClaw version: `2026.5.22 (a374c3a)` verified via `openclaw --version`.
- Gateway: healthy. `openclaw gateway status` reports LaunchAgent loaded, runtime active, listening on `127.0.0.1:18789`, connectivity probe `ok`, and capability `admin-capable`.
- RPC probe: degraded. A direct POST to `http://127.0.0.1:18789/rpc` returned `Not Found`. Gateway health probe is good, but an explicit RPC endpoint probe did not succeed on this surface.
- Qdrant LaunchAgent/service (`ai.xos.qdrant`): failed/not present. `launchctl print gui/$(id -u)/ai.xos.qdrant` returned `Could not find service "ai.xos.qdrant"`, and `launchctl list | grep ai.xos.qdrant` found nothing loaded.
- Qdrant readiness on `127.0.0.1:6333`: failed. `curl` to local readiness/root endpoints could not connect, indicating nothing is listening on TCP 6333.
- Critical comms/core ops path: partially healthy. Core OpenClaw gateway path is up. Key local core-ops/event-log files are present under `tools/event-log/` (`event_logger.js`, `sqlite_bootstrap.js`, `write_with_event.js`). Latest Moltbook/state artifacts also exist (`state/moltbook/config.json`, `state/moltbook/dm_attention_state.json`), so the operational path is present, but degraded social/semantic support remains unresolved.

## Memory
- `memory/2026-04-13.md`: not present.
- Latest operational state reviewed from `memory/2026-05-27.md`, `memory/2026-05-28.md`, and `Outputs/promotion-logs/2026-05-28-durable-memory-promotion-log.md`.
- Decisions / durable preferences:
  - Evidence-first reporting remains active: if a fresh execution surface fails, use the latest verified artifacts and label them as such instead of overstating live truth.
  - Keep degraded surfaces narrowly scoped. Failed mentions/DM endpoints or missing tool paths do not justify collapsing all comms truth.
  - Promotion doctrine remains stable: canonical daily-note events are promoted as durable memory with provenance, and QMD/indexing is retrieval support rather than the authority writer.
  - Stale-file cleanup remains non-destructive staging only; protected and uncertain items stay in place unless separately authorized.
- Canon candidates:
  - Downgrade-to-advisory when governance metadata is missing remains a standing canon candidate from prior watcher work.
  - Constraint-handling candidates remain active: capability-class-bounded decay, no wall-clock-only clean slate, and explicit revalidation/contradiction conditions on constraints.
- Task outcomes:
  - 2026-05-27 Moltbook watcher: one fresh shell path failed because `moltbook` was unavailable on PATH; reporting correctly pivoted to verified runtime artifacts.
  - 2026-05-27 later live watcher: canonical direct API reads succeeded for public surfaces; mentions and DM surfaces still failed with HTTP 404.
  - 2026-05-27 reading pulse: one public reply was posted after verification challenge success, with exact reply text and artifact trail preserved.
  - 2026-05-28 durable-memory promotion completed for all three canonical 2026-05-27 entries; no entries were skipped.
  - 2026-05-28 stale-file staging completed non-destructively with provenance bundle and protected/uncertain items left in place.
- Bulletin-worthy items:
  - Local Qdrant semantic backend is currently down/unloaded: no `ai.xos.qdrant` service and no listener on `127.0.0.1:6333`.
  - This cron runtime exposes no active `OPENAI_API_KEY`; semantic embedding path is therefore unavailable here.
  - Core gateway operations are healthy even while semantic and some Moltbook surfaces remain degraded.

## Semantic
- Target embedding provider/model: OpenAI `text-embedding-3-small`.
- Credential/provider path: unavailable in this cron runtime. Environment inspection showed `OPENCLAW_SERVICE_MANAGED_ENV_KEYS=DISABLED_OPENAI_API_KEY` and no active `OPENAI_API_KEY`.
- Qdrant prerequisite: unavailable. Local service `ai.xos.qdrant` is not loaded and `127.0.0.1:6333` is not reachable.
- Result: stopped cleanly for the semantic section because the embedding credential/provider path is unavailable. I did not create or modify collection `xos_semantic_memory`, did not embed or upsert a test set, and did not run retrieval smoke. Promoted semantic memory remains separate from raw event traces; nothing new was promoted.

## Next Step
Enable `OPENAI_API_KEY` for this cron/runtime path, restore or load Qdrant service `ai.xos.qdrant`, verify readiness on `127.0.0.1:6333`, then create/use collection `xos_semantic_memory` (1536 dimensions, cosine), upsert a small validated test set with `text-embedding-3-small`, and run a retrieval smoke test.