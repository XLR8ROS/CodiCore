# Nightly Maintenance — 2026-06-02 02:18 EDT

## Health
- OpenClaw version: `2026.5.22 (a374c3a)` verified via `openclaw --version`.
- Gateway: running and reachable. `openclaw gateway status` reports LaunchAgent loaded, runtime active (pid `29272`), listening on `127.0.0.1:18789`, connectivity probe `ok`, capability `admin-capable`, and service file `~/Library/LaunchAgents/ai.openclaw.gateway.plist`.
- RPC probe: healthy through documented gateway health surfaces. Docs indicate `openclaw gateway health` plus HTTP `/healthz` and `/readyz` are the supported health/readiness probes. Verified `http://127.0.0.1:18789/healthz` returned `{"ok":true,"status":"live"}` and `http://127.0.0.1:18789/readyz` returned ready `true`.
- Gateway degraded state: `readyz` also reported event-loop degradation (`event_loop_utilization`, `cpu`) with `utilization: 0.999` and `cpuCoreRatio: 1.014`. Gateway is up, but this is a real degraded signal.
- Qdrant LaunchAgent/service (`ai.xos.qdrant`): failed/not present in the verified user GUI domain. `launchctl print gui/$(id -u)/ai.xos.qdrant` returned `Could not find service "ai.xos.qdrant" in domain for user gui: 501`, and no matching LaunchAgent plist was found under `~/Library/LaunchAgents`, `/Library/LaunchAgents`, or `/Library/LaunchDaemons`.
- Qdrant readiness on `127.0.0.1:6333`: failed. `curl` and Python HTTP probes both returned connection refused; no local Qdrant listener was verified.
- Critical comms/core ops path: partially healthy. Verified core ops lanes exist: `event-log/`, `tools/event-log/`, `memory/`, `maintenance/`, `tools/`, `state/`, `tasks/`, `Outputs/`, and `Navigation/`. OpenClaw gateway comms path is healthy locally. No fresh external comms send/receive path was exercised in this pass.
- Additional health note from `openclaw doctor`: command owner is not configured, one active heartbeat-owned main-session recovery issue is flagged, and plaintext secret-bearing config remains present in `~/.openclaw/openclaw.json`. These are operator/security concerns, not immediate gateway-down failures.

## Memory
- `memory/2026-04-13.md`: not present.
- Latest operational state reviewed from `memory/2026-05-27.md`, `memory/2026-05-28.md`, `memory/2026-05-28-1422.md`, and `maintenance/2026-06-01-nightly-maintenance.md`.
- Decisions / durable preferences:
  - Evidence-first reporting remains active: if a fresh execution path fails, use the latest verified artifacts and label the scope precisely instead of overstating live truth.
  - Memory doctrine remains stable: canonical daily notes are source authority for durable promotion; QMD/retrieval/semantic layers support recall but do not decide what exists.
  - Cleanup remains non-destructive staging only; protected or uncertain items stay in place unless separately authorized.
  - Moltbook auth remains canonical Keychain-backed auth; generic env-var fallback is not the operating policy.
  - Moltbook orientation rule remains active in recent operational state: start from `/home`, then narrow into exact post/comment surfaces rather than wandering.
- Canon candidates:
  - Missing governance metadata should degrade inherited authority to advisory status rather than silently preserving it.
  - Constraint-handling candidates remain active: capability-class-bounded decay, no wall-clock-only clean slate, and explicit revalidation/contradiction conditions.
- Task outcomes:
  - 2026-05-27 social watcher work preserved evidence discipline when a fresh shell watcher path failed; latest verified runtime artifacts were used instead of claiming fresh live execution.
  - 2026-05-27 live Moltbook social watcher later succeeded via canonical direct API reads, while dedicated mentions and DM endpoints still failed with HTTP 404.
  - 2026-05-27 reading pulse completed with one verified public reply posted after challenge verification; evidence/output paths were preserved in the daily note.
  - 2026-05-28 durable-memory promotion completed for all canonical 2026-05-27 entries with promotion log written at `Outputs/promotion-logs/2026-05-28-durable-memory-promotion-log.md`.
  - 2026-05-28 stale-file staging completed non-destructively with manifest and bundle; protected and uncertain items were left in place.
- Bulletin-worthy items:
  - Local semantic backend remains down/unloaded: no verified `ai.xos.qdrant` service and no listener on `127.0.0.1:6333`.
  - Gateway health is green overall but not clean: readiness reports event-loop degradation and doctor reports unresolved operator/security issues.
  - OpenAI embedding access is available in this runtime through the service-managed `DISABLED_OPENAI_API_KEY`, but local vector storage remains unavailable, so semantic promotion cannot complete.

## Semantic
- Target embedding provider/model: OpenAI `text-embedding-3-small`.
- Embedding credential/provider path: available in this runtime through service-managed env key `DISABLED_OPENAI_API_KEY`.
- Embedding validation: succeeded. A live call to `/v1/embeddings` returned model `text-embedding-3-small` with vector size `1536`.
- Promotion boundary: kept validated semantic candidates separate from raw event traces. Candidate validated test set for this maintenance pass was limited to three high-confidence operational statements drawn from existing documented practice:
  - Canonical daily notes are source authority for durable promotion.
  - Cleanup remains non-destructive staging only unless separately authorized.
  - Missing governance metadata should downgrade inherited constraints to advisory status.
- Qdrant prerequisite: unavailable. Local service `ai.xos.qdrant` is not loaded in the verified user domain, no matching plist was found in standard LaunchAgent/LaunchDaemon paths, and `127.0.0.1:6333` is unreachable.
- Result: stopped cleanly for the semantic section after successful embedding validation because vector storage is unavailable. I did not create collection `xos_semantic_memory`, did not upsert points, and did not run a retrieval smoke test. Nothing new was promoted into semantic storage.

## Next Step
Restore or install Qdrant service `ai.xos.qdrant` with readiness on `127.0.0.1:6333`, then create/use collection `xos_semantic_memory` (vector size `1536`, cosine distance), embed the validated test set with OpenAI `text-embedding-3-small`, upsert it, and run a retrieval smoke test.