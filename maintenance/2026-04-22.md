# Maintenance Summary, 2026-04-22

## Health
- OpenClaw version: 2026.4.15 (041266a).
- Update status: npm 2026.4.21 available.
- `openclaw gateway status` and `openclaw status --deep` timed out.
- RPC probe on `127.0.0.1:3000` failed to connect on `/health`, `/rpc`, and `/`.
- Qdrant LaunchAgent `ai.xos.qdrant` is loaded and running.
- Qdrant readiness on `127.0.0.1:6333` passed (`healthz` OK, `readyz` OK).
- Critical comms/core ops path: `~/.openclaw` exists, `~/Library/Application Support/OpenClaw` was not present.

## Memory
- No `memory/2026-04-13.md` file was present in the workspace.
- Captured current state in `daily-notes/2026-04-22.md`.
- Durable items from this run: OpenClaw is on 2026.4.15, update available, Qdrant healthy, gateway/RPC path degraded.

## Semantic
- OpenAI embeddings credentials were available.
- Used `text-embedding-3-small` successfully, embedding dim 1536.
- Confirmed Qdrant collection `xos_semantic_memory` exists, then upserted a small validated set of 3 records.
- Retrieval smoke test passed.

## Incomplete
- Gateway and local RPC path still need follow-up.
- Exact next step: investigate why `openclaw gateway status` times out and why localhost RPC on port 3000 is not listening.
