# Nightly Maintenance — 2026-05-26 02:17 EDT

## Health
- OpenClaw version: `2026.5.20 (e510042)` verified via `openclaw --version`.
- Gateway: running via LaunchAgent `ai.openclaw.gateway`; `openclaw gateway status` reported runtime active (pid 36992), listening on `127.0.0.1:18789`, connectivity probe `ok`, capability `admin-capable`.
- RPC probe: degraded/failed. `openclaw rpc probe` is not a valid CLI command in this install (`Unknown command: openclaw rpc`). Gateway health is verified through `openclaw gateway status`, but the requested RPC probe path is unavailable in the current CLI surface.
- Qdrant LaunchAgent/service (`ai.xos.qdrant`): failed/not present. `launchctl print gui/501/ai.xos.qdrant` returned `Could not find service`.
- Qdrant readiness on `127.0.0.1:6333`: failed. `curl` could not connect to `/readyz` and `/collections`.
- Critical comms/core ops path: partial/degraded. OpenClaw gateway is healthy. Core comms tool paths (`gog`, `himalaya`, `imsg`, `wacli`, `xurl`) are installed in the skills set, but the latest operational evidence shows a current Moltbook watcher auth failure on xurl-authenticated surfaces at `2026-05-26 02:00:00 EDT` (`No apps registered`). Treat social-watch coverage as degraded until auth is repaired or the canonical path is confirmed for the needed surface.

## Memory
- `memory/2026-04-13.md`: not present.
- Latest operational state reviewed from `memory/2026-05-26.md` and `memory/2026-05-25.md`.
- Decisions / durable preferences:
  - Evidence-first maintenance remains the standard: verify tool/auth state before claiming coverage.
  - Scope uncertainty only to the failed surface; do not generalize a surface-specific failure into broader system failure.
  - Preserve cleanup as stage-only with manifests and no deletion by default.
- Canon candidates:
  - The retry-burn rule captured on `2026-05-25 08:06:45 EDT` appears durable enough for later canon review: parameterize decay per capability class, do not let wall-clock alone earn a clean slate, and use class-history-bounded time caps.
  - Constraint handling candidate: constraints should include explicit revalidation/contradiction conditions, not only provenance.
- Task outcomes:
  - 2026-05-25 stale-file staging completed twice safely with manifests/bundles and no deletions.
  - 2026-05-25 Moltbook watcher completed successfully using canonical/direct API paths, with DM uncertainty kept scoped.
  - 2026-05-26 Moltbook watcher hit an xurl auth-layer blocker before authenticated X/Moltbook surfaces could be inspected.
- Bulletin-worthy items:
  - Qdrant semantic backend is currently unavailable locally.
  - xurl-authenticated social surfaces are currently blocked by missing registered app auth.

## Semantic
- Provider intent: OpenAI embeddings using default model `text-embedding-3-small`.
- Credential/provider path: present in local OpenClaw config, so this section proceeded to the provider smoke step.
- Provider result: blocked by rate limit. Direct embeddings request to OpenAI returned `HTTP 429 Too Many Requests`.
- Qdrant prerequisite state: unavailable. Local Qdrant service `ai.xos.qdrant` is absent and `127.0.0.1:6333` is not reachable.
- Result: semantic promotion/upsert/retrieval smoke test not performed. Per instruction, stopping this section cleanly because the embedding/provider path is not operationally usable right now and the vector store is also unavailable.
- Validated material was therefore not promoted; raw event traces remain separate.

## Next Step
Restore or start the local Qdrant service `ai.xos.qdrant`, verify `127.0.0.1:6333/readyz`, then retry the OpenAI embeddings smoke request after the 429 condition clears; once both are healthy, create/use collection `xos_semantic_memory` (1536, cosine), upsert a small validated test set, and run a retrieval smoke test.
