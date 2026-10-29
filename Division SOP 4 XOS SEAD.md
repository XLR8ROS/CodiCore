<!-- Generated readable copy. Authoritative YAML: XLR8ROS/XLR8ROS_SEAD/canon/sead-division-sop.yaml. Do not edit independently. -->

# SEAD SOP

## Timestamp
20260411 171230 EDT

## Purpose
This SOP defines division-wide operating procedure for SEAD.

It applies XOS-wide rules to engineering, architecture, implementation, technical review, technical documentation, and development execution.

It sits below XOS Company SOP and above SEAD department, office, team, and position SOPs.

## 1. Scope and Inheritance

### 1.1 Scope
This SOP applies to all SEAD work unless a higher governing document states otherwise.

### 1.2 Inheritance
SEAD inherits XOS Company SOP.

### 1.3 Specialization rule
This SOP narrows XOS-wide rules for engineering work and may not silently weaken them.

## 2. Check-In and Visibility Procedure

### 2.1 Visibility rule
For non-trivial engineering work, the responsible SEAD owner must maintain enough visibility that active work does not disappear, drift silently, or remain ambiguous.

### 2.2 Anti-silence rule
During active engineering work, a SEAD owner must not go silent through a meaningful state change, blocker, or due checkpoint.

### 2.3 Anti-filler rule
SEAD check-ins must add useful execution clarity and must not degrade into filler.

### 2.4 How-to reference
Detailed SEAD check-in procedure belongs in `SEAD_CHECKIN_HOWTO.md`.

## 3. Priority and Queue Management Procedure

### 3.1 Queue awareness
SEAD work must maintain explicit awareness of:

3.1.1 active work
3.1.2 queued work
3.1.3 blocked work
3.1.4 deferred work
3.1.5 completed work

### 3.2 Priority visibility rule
Priority changes that materially affect execution or timing must be made visible.

### 3.3 Ambiguity rule
If priority is unclear and affects execution, surface the ambiguity instead of silently guessing.

## 4. Task State Procedure

### 4.1 Minimum task states
SEAD work must maintain explicit task state using at least:

4.1.1 not started
4.1.2 active
4.1.3 blocked
4.1.4 deferred
4.1.5 complete

### 4.2 Update rule
Task state must be updated when work starts, pauses, blocks, resumes, completes, or is explicitly deferred.

## 5. Decision Logging Procedure

### 5.1 Logging trigger
Important engineering decisions must be logged durably.

### 5.2 Logging scope
Engineering decisions should be logged when they affect:

5.2.1 architecture
5.2.2 repo structure
5.2.3 implementation order
5.2.4 dependency structure
5.2.5 engineering procedure
5.2.6 durable future work
5.2.7 routing or model use
5.2.8 tool adoption
5.2.9 memory structure
5.2.10 deployment shape

### 5.3 How-to reference
Detailed engineering decision logging procedure belongs in `SEAD_DECISION_LOGGING_HOWTO.md`.

## 6. Artifact and Output Procedure

### 6.1 Artifact rule
If an engineering output is meant to persist, be reviewed, be reused, guide future action, or support accountability, it must be written as a structured artifact.

### 6.2 Placement rule
Artifacts must be placed intentionally and not left buried in transient conversation.

### 6.3 How-to reference
Detailed SEAD artifact placement procedure belongs in `SEAD_ARTIFACT_PLACEMENT_HOWTO.md`.

## 7. Review and Improvement Procedure

### 7.1 Review trigger
Substantial engineering work should be reviewed before being treated as settled.

### 7.2 Review rule
Review should be strong enough to catch ambiguity, structural weakness, missing dependencies, hidden assumptions, avoidable future friction, implementation mismatch, and incomplete done-state definition.

### 7.3 Improvement record
After meaningful work, SEAD should identify:

7.3.1 what became clearer
7.3.2 what remains weak
7.3.3 what should be improved next

### 7.4 How-to reference
Detailed SEAD technical review procedure belongs in `SEAD_TECHNICAL_REVIEW_HOWTO.md`.

## 8. Engineering Proposal and Budget Procedure

### 8.1 Inheritance rule
SEAD proposals and budgets must follow XOS budgeting and proposal rules.

### 8.2 Division duty
SEAD must submit standing operating budget inputs for recurring engineering work under its authority.

### 8.3 Project duty
SEAD must submit project proposals or project budgets for bounded technical work outside approved standing spend.

### 8.4 SEAD-specific cost drivers
When relevant, SEAD budgets should identify:

8.4.1 model-routing cost
8.4.2 worker count cost
8.4.3 retry and iteration cost
8.4.4 long-context cost
8.4.5 tool or provider cost
8.4.6 testing cost
8.4.7 integration overhead
8.4.8 review overhead
8.4.9 deployment complexity cost

### 8.5 Parallelism rule
When proposing parallel worker use, SEAD should state where parallelism helps and where additional workers stop helping.

## 9. Technical Project Definition and Completion Procedure

### 9.1 Definition rule
SEAD may not treat a technical project as properly defined unless the objective, scope, dependencies, and done-state are explicit.

### 9.2 Completion rule
SEAD completion must be defined in concrete technical terms rather than vague progress language.

### 9.3 Acceptable technical done-state examples
Acceptable examples include:

9.3.1 schema finalized
9.3.2 interface contract defined
9.3.3 routing policy documented
9.3.4 implementation validated
9.3.5 migration path recorded
9.3.6 tests passing
9.3.7 repo placement locked
9.3.8 review notes resolved or accepted
9.3.9 handoff package ready

### 9.4 How-to reference
Detailed technical project definition procedure belongs in `SEAD_TECHNICAL_PROJECT_DEFINITION_HOWTO.md`.

## 10. Agent Origination Authority Procedure

### 10.1 Division boundary
Outside the designated Agent Engineering authority, SEAD owners may not originate new primary agents or secondary agents by local preference or silent expansion.

### 10.2 Routing rule
Requests for new primary agents or secondary agents under SEAD must be routed to the designated Agent Engineering authority.

### 10.3 Sub-agent origination rule
SEAD owners may originate sub-agents only within authorized scope, for narrow delegated work, and only when the sub-agent does not exceed the spawning owner’s authority boundary.

### 10.4 Temporary authority rule
Until a dedicated Agent Engineering department exists under SEAD, primary and secondary agent origination authority for SEAD remains with the Chief of SEAD.

### 10.5 Boundary rule
Sub-agents may not be used to bypass governance, org structure, reporting lines, approval requirements, or higher-level origination rules.

## 11. Downstream Specialization Procedure

### 11.1 Department rule
Future SEAD department SOPs should become more custom and particular than this division SOP.

### 11.2 Position rule
SEAD position SOPs should define exact seat-level obligations, triggers, reporting duties, and escalation behavior.

### 11.3 Division boundary
This SOP governs division-wide engineering procedure and should not absorb seat-specific behavior that belongs in position SOPs.