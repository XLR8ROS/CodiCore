# Sub-Agent / ACP Capability Gate Proposal for XOS Execution Mode

## Timestamp  
2026-05-03 17:50:33 EDT

## Objective
Determine the correct execution mode before Docker Qdrant work begins.

## Scope
This proposal covers only:  
- Testing native `runtime="subagent"`  
- Detecting the known failure  
- Testing ACP only if native sub-agent fails  
- Defining manual fallback if ACP is unavailable  
- Reporting the final execution mode

## Assumptions
- Native sub-agents must work for parallel processing.  
- If not, ACP should be usable to manage tasks.  
- Manual fallback is the last possible step if neither is available.

## Test Plan
1. Execute a minimal sub-agent test.
2. If that fails, execute an ACP test.
3. If both fail, define the manual fallback.

## Exact Command/Tool-Call Discovery Step
### For Native Sub-Agent  
1. Expected Test Command: `openclaw sub-agent --mode test`  
2. Fate of the command will be to return a response directly to confirm its status.

### If Command Shape is Unknown  
- Inspect the source files under OpenClaw for references to `subagent` functionality, especially in documentation or runtime scripts.  
- Check `AGENTS.md` for hints on API use for creating or testing sub-agents.

## Native Sub-Agent Test
### Minimal Test Intent
- The test’s only job is to return:  
`SUBAGENT_OK`  
### Expected Pass
- The native sub-agent correctly returns `SUBAGENT_OK` without any stream errors.
### Expected Fail
- Known error appears:  
`streamTo is only supported for runtime=acp; got runtime=subagent`.
### Decision Rule
- If the known error reproduces once cleanly, mark native sub-agents as unavailable for this workflow. No additional attempts without new evidence or command shape changes.

## ACP Fallback Test
### If Native Sub-Agent Fails
- Execute a minimal ACP test expected to return:  
`ACP_OK`.
### Expected Pass
- ACP successfully returns `ACP_OK` without errors.
### Expected Fail
- ACP cannot start or returns runtime or tooling errors that prevent it from executing.

## Manual Fallback Plan
- Implement if both native sub-agent and ACP fail.
- Execute phases sequentially with:  
  - One owner per phase  
  - One report per phase  
  - No claims of parallel execution  
  - Two-try maximum per command  
  - Blocker-first reporting to handle failures.

### Task Packet Format for ACP/Manual Execution
   - **phase_id:**  
   - **owner:**  
   - **mode:** native_subagent | acp | manual  
   - **objective:**  
   - **inputs:**  
   - **commands:**  
   - **expected_output:**  
   - **validation:**  
   - **attempt_limit:** 2  
   - **stop_condition:**  
   - **report_label:**  
   - **status:** pending | complete | blocked

## Token Budget
### Estimate:  
- Proposal Review Tokens: **500–800 tokens**  
- Native Sub-Agent Test Tokens: **300–500 tokens**  
- ACP Fallback Test Tokens: **300–500 tokens**  
- Manual Fallback Reporting Tokens: **300–400 tokens**  
- Final Execution-Mode Report Tokens: **400–600 tokens**

## Risks
- Native sub-agent mode fails consistently.
- ACP mode inability to execute sub-tasks.
- Missing commands or tests leading to user confusion.

## Pushback / Recommendations
- Test each command directly and treat errors as immediate blockers.
- Do not claim parallel execution without confirmed agent functionality.

## Done Condition
The proposal is complete when it is ready for approval to execute a capability gate test determining the execution mode for Docker Qdrant without interacting with Docker, Qdrant, or repo files.