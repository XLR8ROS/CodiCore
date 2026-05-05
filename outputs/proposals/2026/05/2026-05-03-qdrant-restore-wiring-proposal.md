# Qdrant Restore-Wiring Proposal

## Goal
Restore Qdrant wiring so OpenClaw can use it correctly for retrieval, memory, or agent workflows without treating this like a fresh install.

## Constraint
This is a restore/wiring effort, not a fresh install effort.

## Mandatory Execution Rule

### ANTI-BRUTE-FORCE / BLOCKER RULE
No tool call, command, config change, API call, install step, route test, memory search, Qdrant query, embedding test, or OpenClaw command may be attempted more than 2 times if it fails in the same way.

After 2 failed same-path attempts:
1. Stop immediately.
2. Do not retry with minor wording or command variations.
3. Do not branch into unrelated fixes.
4. Preserve current state.
5. Report blocker in this format:

BLOCKED: [short blocker]
TRIED: [attempt 1] / [attempt 2]
EVIDENCE: [error/output/log clue]
LIKELY CAUSE: [known cause or unknown]
NEEDS: [Reg decision, missing credential, config approval, tool access, or next required input]

A retry is allowed only if new evidence or changed state exists, such as:
- corrected path
- changed config
- new approval
- new credential
- service restart
- dependency installed
- different documented command
- new log evidence changing the diagnosis

No changed evidence means no retry.

This rule applies during Qdrant verification, OpenClaw config inspection, memory-search testing, embedding repair, plugin/bridge discovery, and retrieval validation.

## What I would do

### 1) Inspect current state, not reinstall blindly
- Identify existing Qdrant-related config, service wiring, env vars, docker state, and any OpenClaw plugin or embedding settings.
- Confirm whether Qdrant is already present somewhere local, remote, or containerized.
- Check what path is failing: storage, API reachability, embeddings, or registration.

### 2) Map the retrieval chain
Typical chain:
- user request
- OpenClaw agent runtime
- embedding generation
- Qdrant collection lookup
- payload filters / routing
- result return to the agent

I would verify each link separately so we know exactly where the break is.

### 3) Use small parallel sub-agent work
If allowed, I would split work into parallel checks:
- Sub-agent A: inspect existing config and service wiring
- Sub-agent B: inspect docs and known Qdrant/OpenClaw integration points
- Sub-agent C: inspect repo files for current Qdrant references, env names, and memory/search plumbing

That keeps the investigation moving without one agent thrashing the same failure.

### 4) Restore the wiring
Depending on what exists, restoration may mean:
- correcting endpoint/port/env values
- restoring missing service definition
- pointing OpenClaw to the right Qdrant instance
- fixing collection names / payload schema
- repairing embedding provider config
- enabling or replacing a broken retrieval bridge

### 5) Validate with bounded checks
- One check for service reachability
- One check for collection visibility
- One check for a minimal insert/query path
- Stop after 2 same-failure attempts

### 6) Report blockers cleanly
If blocked, return the exact blocker format above with evidence.

## What I need from Reg before execution
- Approval to inspect current wiring if it touches config or service state
- Approval to use sub-agents for parallel inspection
- Any known Qdrant host/port, container name, or existing deployment target
- Any current OpenClaw embedding/provider settings if relevant

## Recommendation
Do not start from "install Qdrant." Start from "what is already wired, what is broken, and what must be restored."
