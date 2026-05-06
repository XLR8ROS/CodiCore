# Revised Proposal for Docker-Based Qdrant Install

## Title
Docker-Based Qdrant Install Proposal for XOS Semantic Recall

## Objective
Create a clean, executable, and fully detailed plan for deploying Qdrant via Docker as the semantic retrieval/index layer for XOS, adhering to architecture constraints and operational safety.

## Target Architecture
- Docker-managed Qdrant service container named `qdrant`.
- Persistent mounted storage volume for data retention.
- Published service ports 6333 (HTTP/API) and 6334 (gRPC, conditional).
- Use modern `docker compose` commands for container orchestration.
- Integration layer in OpenClaw/XOS to use Qdrant solely as semantic recall; all durable memory sources remain in agent repositories and canonical memory stores.

## Corrected Host Path Recommendation
- Mac-safe preferred: `~/Library/Application Support/xos/qdrant_data`
- Linux/server preferred: `/var/lib/xos/qdrant_data`
- Fallback: `./qdrant_storage`
- Permissions: 
  - Mac/Linux: `mkdir -p path && chmod 700 path`
  - Reason: User-writable, secure access, avoids permission conflicts.

## Token Budget Estimates
- Full proposal review: **3,500–4,500 tokens**
- Phase B1–B8: Each **600–900 tokens** (total ~5,000)
- Sub-agent status test: **400–600 tokens**
- ACP/manual workaround how-to: **700–900 tokens**
- Execution report per phase: **~300 tokens per phase**
- Total planning tokens: **~10,000 tokens**
- Total expected execution/reporting tokens: **~3,000 tokens**
- Potential token savings by reusing command templates and checklists in phases B1, B4, B6.

## Phase Table (Detailed)

| Phase | Description                   | Token Estimate         |
|-------|-------------------------------|-----------------------|
| B1    | Docker/Qdrant install preflight | 700 tokens            |
| B2    | Install layout and volume plan   | 700 tokens            |
| B3    | Docker service definition         | 800 tokens            |
| B4    | Start Qdrant service              | 700 tokens            |
| B5    | Create required collection(s)    | 650 tokens            |
| B6    | Validate health, ports, persistence, and integration | 900 tokens |
| B7    | Snapshot/backup/rollback procedure | 600 tokens            |
| B8    | Logging/reporting handoff         | 600 tokens            |

## Real Dependency Map
- B1 must pass before B3/B4.
- Ports 6333/6334 must be free before B3.
- Storage path existence (B2) required before B3 and B4.
- Service running health check (B6) must pass before B5.
- Collection presence (B5) must precede full integration validation.
- Persistence confirmed (B6) before B7 snapshot.
- Sub-agent/ACP status test must complete before declaring parallel execution possible.

## Exact Command Plan and Two-Try Validation Rules

### B1 — Preflight
- Attempt 1: `docker --version`
- If failure: Check Docker service status/reinstall
- Attempt 2: `docker info`
- If failure: STOP and report blocker

### B2 — Layout Creation
- Attempt 1: `mkdir -p <path> && chmod 700 <path>`
- If failure: Check permissions
- Attempt 2: Retry with sudo if needed
- If failure: STOP and report blocker

### B3 — Docker Compose File Creation
- Write exact YAML docker-compose file (provided in proposal)
- Attempt syntax check: `docker compose config`
- If failure: Fix syntax
- Attempt 2: Retry syntax check
- If failure: STOP and report blocker

### B4 — Service Start
- Attempt 1: `docker compose up -d`
- If failure: Inspect logs: `docker logs qdrant`
- Attempt 2: Restart Docker service
- If failure: STOP and report blocker

### B5 — Collection Creation
- Attempt 1: Use exact python script (provided below) to create collection
- If failure: Inspect error logs
- Attempt 2: Correct parameters or network settings
- If failure: STOP and report blocker

### B6 — Validation
- Check health: `curl http://localhost:6333/collections`
- Attempt 1: curl
- If failure: Inspect docker status/logs
- Attempt 2: Restart container and retry curl
- If failure: STOP and report blocker

- Check persistence: Restart container and repeat health check

### B7 — Snapshot
- Attempt 1: `docker commit qdrant qdrant_backup`
- If failure: Check permissions
- Attempt 2: Retry commit with sudo
- If failure: STOP and report blocker

### B8 — Logging
- Setup log directory
- Confirm logs writable

## Exact Docker Compose YAML
```yaml
version: '3.9'
services:
  qdrant:
    image: qdrant/qdrant:latest
    container_name: qdrant
    restart: unless-stopped
    ports:
      - "6333:6333"
      - "6334:6334"
    volumes:
      - qdrant_storage:/qdrant/storage
volumes:
  qdrant_storage:
    driver: local
```

## Exact Qdrant Command Plan
- Health Check: `curl http://localhost:6333/collections`
- List Collections: `curl http://localhost:6333/collections`
- Create Collection:
```bash
curl -X PUT http://localhost:6333/collections/xos_semantic_memory \
  -H 'Content-Type: application/json' \
  --data-raw '{"vectors":{"size":1536,"distance":"Cosine"}}'
```
- Inspect Collection:
```bash
curl http://localhost:6333/collections/xos_semantic_memory
```
- Restart Container:
```bash
docker restart qdrant
```
- Confirm Persistence:
```bash
curl http://localhost:6333/collections
```

## Exact Sub-agent Status Test Plan
- Intent: Verify if native sub-agent runtime supports `runtime=subagent` without error.
- Test:
  - Run minimal sub-agent execution with `runtime=subagent`.
  - Monitor for error message: `streamTo is only supported for runtime=acp`
- Expected Pass: Sub-agent works without error.
- Expected Fail: Error message appears on first failure.
- Decision Rule: Fail on first occurrence.
- Attempts:
  - Try test once.
  - If fails, retry once after environment refresh or config review.
  - Stop on second failure and mark native sub-agent as unavailable.

## Exact ACP/Manual Workaround How-To
- When to Use ACP:
  - When native sub-agents fail.
  - For complex distributed or parallel task management.
- Task Packet Writing:
  - Write each phase of the install/provision as discrete task packets.
- Phase Ownership:
  - Assign ownership by phase to individual manual operator or ACP-managed session.
- Output Return:
  - Return results with phase-labeled messages or files.
- Manual Sequencing:
  - Sequence phases in a queue, confirm completion before next.
- Parallelization Marking:
  - Mark as sequential or parallel explicitly based on execution.
- Avoiding False Parallelism Claim:
  - Document manually that tasks were run sequentially if ACP is not running.

## Risks
- Misconfigured storage path leading to data loss.
- Docker environment incompatibility.
- Port conflicts causing service startup failure.
- Sub-agent runtime incompatibility blocking parallel workflows.
- Incorrect collection parameters leading to failed retrieval.

## Recommended Pushback/Improvements
- Review host paths prior to execution to confirm environment suitability.
- Validate embedding model and dimension choice per latest OpenClaw config.
- Enhance logging to capture all failure points in detail.
- Await sub-agent runtime test before enabling parallel installation steps.

## Done Condition
The proposal is complete and approval-ready when:
- All phases have exact commands and validation workflows.
- Two-try failure and blocker logic is defined for each step.
- Host environment paths are corrected and explained.
- Sub-agent native runtime test procedure is exact.
- ACP/manual workaround steps provided in detail.
- Dependency and execution flows are clear with blocking rules.

No installation or runtime changes will occur until explicit approval is granted by Reg.

---

Would you like me to provide this revised proposal as a formatted file in your repo for your review?