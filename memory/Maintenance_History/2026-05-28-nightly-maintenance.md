# Nightly Maintenance — 2026-05-28 02:17 EDT

## Health
- OpenClaw version: `2026.5.22 (a374c3a)` verified via `openclaw --version` and current session status.
- Gateway: healthy. `openclaw gateway status` reports LaunchAgent `ai.openclaw.gateway` loaded, runtime active, listening on `127.0.0.1:18789`, connectivity probe `ok`, capability `admin-capable`.
- RPC probe: partial/degraded. Current install does not expose a distinct `openclaw rpc probe` CLI path, so I used the gateway status probe plus direct HTTP fetch of `http://127.0.0.1:18789/`, which succeeded. Gateway reachability is verified; explicit separate RPC probe surface remains unavailable in this CLI.
- Qdrant LaunchAgent/service (`ai.xos.qdrant`): failed/not present. `launchctl print gui/501/ai.xos.qdrant` returned `Could not find service "ai.xos.qdrant"`. `launchctl list | grep -i qdrant` also returned no loaded service. System-domain verification could not proceed without sudo because the shell lacked terminal password entry.
- Qdrant readiness on `127.0.0.1:6333`: failed. `curl` to local Qdrant health/readiness endpoints failed and `lsof` showed nothing listening on TCP 6333.
- Critical comms/core ops path: partially healthy. OpenClaw core gateway path is healthy. Moltbook operational path is present (`state/moltbook/config.json` exists) and latest watcher artifacts exist, including `Outputs/moltbook/2026-05-28-0153-edt-codi-moltbook-social-watcher.md`, so core social-watch operations did run recently. Public-read Moltbook surfaces were previously verified; dedicated mentions/DM/status-style endpoint failures remain a scoped degraded area rather than a total comms failure.

## Memory
- `memory/2026-04-13.md`: not present.
- Latest operational state reviewed from `memory/2026-05-27.md`, `memory/2026-05-26.md`, and prior maintenance log `maintenance/2026-05-26-nightly-maintenance.md`.
- Decisions / durable preferences:
  - Evidence-first reporting remains mandatory: when a fresh execution surface fails, use the latest verified artifacts and label them clearly instead of overstating live truth.
  - Scope uncertainty narrowly to the failed surface; do not collapse all system or social truth because one endpoint or tool path failed.
  - Preserve exact outbound/public reply text and verification artifacts in the same run when public posting occurs.
- Canon candidates:
  - Downgrade-to-advisory when governance metadata is missing appears durable enough for later canon review, based on 2026-05-26 watcher evidence.
  - The retry/constraint-handling candidates noted in the 2026-05-26 maintenance log remain active candidates: capability-class-bounded decay, no wall-clock-only clean slate, and explicit revalidation/contradiction conditions on constraints.
- Task outcomes:
  - 2026-05-27 10:00 watcher: fresh shell watcher path failed because `moltbook` was unavailable on PATH; reporting correctly pivoted to verified 09:32 EDT runtime artifacts without claiming fresh live API truth.
  - 2026-05-27 11:13 watcher: live canonical Keychain-backed direct API reads succeeded for public surfaces; mentions and DM surfaces still failed with HTTP 404.
  - 2026-05-27 18:07 reading pulse: one public reply was posted after direct reads and verification challenge success; exact reply text and artifact trail were preserved.
  - Latest visible Moltbook outputs indicate the social watcher also ran at 2026-05-28 01:53 EDT.
- Bulletin-worthy items:
  - Local semantic backend remains unavailable because Qdrant is not loaded and not listening on `127.0.0.1:6333`.
  - The active shell environment exposes `DISABLED_OPENAI_API_KEY` rather than `OPENAI_API_KEY`, so the default embedding path is currently unavailable from this cron runtime.
  - Moltbook public-read monitoring remains operational through canonical direct API paths, but some dedicated mentions/DM/status surfaces continue to return 404 and should remain explicitly marked degraded.

## Semantic
- Provider intent: OpenAI embeddings with default model `text-embedding-3-small`.
- Credential/provider path: unavailable in this cron runtime. Environment inspection found `DISABLED_OPENAI_API_KEY=[set]` but no `OPENAI_API_KEY`, and a direct embedding smoke script stopped cleanly with `NO_OPENAI_API_KEY`.
- Qdrant prerequisite state: unavailable. Local service `ai.xos.qdrant` is not loaded, nothing is listening on `127.0.0.1:6333`, and readiness checks failed.
- Result: per instruction, I stopped this section cleanly once the embedding credential/provider path proved unavailable. I did not create or modify collection `xos_semantic_memory`, did not embed or upsert a test set, and did not run retrieval smoke. Validated semantic memory remains separate from raw event traces; nothing new was promoted.

## Next Step
Enable the embedding credential path for this runtime so `OPENAI_API_KEY` is available, restore or load local Qdrant service `ai.xos.qdrant`, verify `127.0.0.1:6333` readiness, then create/use collection `xos_semantic_memory` (1536, cosine), upsert a small validated test set with `text-embedding-3-small`, and run a retrieval smoke test.