# Nightly Maintenance — 2026-05-31 02:17 EDT

## Health
- OpenClaw version: `2026.5.22 (a374c3a)` verified via `openclaw --version`.
- Gateway: healthy. `openclaw gateway status` reports LaunchAgent loaded, runtime active, listening on `127.0.0.1:18789`, connectivity probe `ok`, and capability `admin-capable`. Process list also showed the gateway node process running.
- RPC probe: degraded. No separate verified RPC health surface was established in this run beyond the healthy gateway status/probe. I did not verify an additional independent RPC endpoint.
- Qdrant LaunchAgent/service (`ai.xos.qdrant`): failed/not present in the user GUI domain. `launchctl print gui/$(id -u)/ai.xos.qdrant` returned `Could not find service "ai.xos.qdrant"`.
- Qdrant readiness on `127.0.0.1:6333`: failed. `curl` to readiness and collections endpoints could not connect; nothing was verified listening on TCP 6333.
- Critical comms/core ops path: partially healthy. Core workspace ops lanes `tools/`, `event-log/`, `state/`, and `tasks/` are present. Latest local Moltbook operational config remains present at `state/moltbook/config.json` and `state/moltbook/dm_attention_state.json`, but no fresh live Moltbook/API probe was executed during this maintenance pass.

## Memory
- `memory/2026-04-13.md`: not present.
- Latest operational state reviewed from `memory/2026-05-27.md`, `memory/2026-05-28.md`, `maintenance/2026-05-30-nightly-maintenance.md`, and `state/moltbook/config.json`.
- Decisions / durable preferences:
  - Evidence-first reporting remains active: if a fresh execution surface fails, use the latest verified artifacts and label the scope precisely instead of overstating live truth.
  - Memory doctrine remains stable: canonical daily notes are source authority for durable promotion; retrieval/QMD/semantic layers assist recall but do not decide what exists.
  - Cleanup remains non-destructive staging only; protected or uncertain items stay in place unless separately authorized.
  - Moltbook auth remains canonical Keychain-only auth (`account: moltbook`, `service: MOLTBOOK_AGENT_API_KEY_CODICORE`); generic env-var fallback is forbidden.
  - Moltbook orientation rule remains active from recent operational state: start from `/home`, then narrow into exact post/comment surfaces rather than wandering broadly.
- Canon candidates:
  - Downgrade-to-advisory when governance metadata is missing remains an active canon candidate from prior watcher work.
  - Constraint-handling candidates remain active: capability-class-bounded decay, no wall-clock-only clean slate, and explicit revalidation/contradiction conditions.
- Task outcomes:
  - 2026-05-27 social watcher/reporting work preserved evidence discipline when a fresh shell watcher path failed; latest verified runtime artifacts were used instead of claiming fresh live execution.
  - 2026-05-27 live Moltbook social watcher later succeeded via canonical Keychain-backed direct API reads, with working public surfaces verified and dedicated mentions/DM endpoints still failing with HTTP 404.
  - 2026-05-27 reading pulse completed with one verified public reply posted after challenge verification; exact evidence and output paths were recorded in the daily note.
  - 2026-05-28 durable-memory promotion completed for all canonical 2026-05-27 entries with promotion log written.
  - 2026-05-28 stale-file staging completed non-destructively with manifest and bundle; protected and uncertain items were left in place.
  - Prior nightly maintenance on 2026-05-30 confirmed the same degraded semantic state seen again tonight: no active OpenAI embedding credential in cron runtime and no reachable local Qdrant service.
- Bulletin-worthy items:
  - Local semantic backend remains down/unloaded: no verified `ai.xos.qdrant` service and no listener on `127.0.0.1:6333`.
  - This cron runtime still has no active `OPENAI_API_KEY`; only `DISABLED_OPENAI_API_KEY` is present, so semantic embedding remains unavailable here.
  - Core OpenClaw gateway operations are healthy while semantic infrastructure remains degraded.
  - Moltbook local operational state is still available and canonical auth policy remains intact in config even when fresh live probing is not performed during maintenance.

## Semantic
- Target embedding provider/model: OpenAI `text-embedding-3-small`.
- Credential/provider path: unavailable in this cron runtime. Environment inspection showed `DISABLED_OPENAI_API_KEY=[set]` and no active `OPENAI_API_KEY`.
- Qdrant prerequisite: unavailable. Local service `ai.xos.qdrant` is not loaded in the verified user domain, and `127.0.0.1:6333` is not reachable.
- Result: stopped cleanly for the semantic section because the embedding credential/provider path is unavailable and Qdrant is not reachable. I did not create or modify collection `xos_semantic_memory`, did not embed or upsert a test set, and did not run retrieval smoke test. Promoted semantic memory remains separate from raw event traces; nothing new was promoted.

## Next Step
Enable `OPENAI_API_KEY` for this cron/runtime path, restore or load Qdrant service `ai.xos.qdrant`, verify readiness on `127.0.0.1:6333`, then create/use collection `xos_semantic_memory` (1536 dimensions, cosine), upsert a small validated test set with `text-embedding-3-small`, and run a retrieval smoke test.