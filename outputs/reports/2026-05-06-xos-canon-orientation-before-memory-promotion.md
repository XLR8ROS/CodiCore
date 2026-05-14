# XOS Canon Orientation Before Memory Promotion

## 1. Navigation files used

- `/Users/reginaldberry/Library/Mobile Documents/com~apple~CloudDocs/XLR8ROS/NAVIGATION.md`
- `/Users/reginaldberry/Library/Mobile Documents/com~apple~CloudDocs/XLR8ROS/Agents/Primary/CodiCore/CodiCore/Navigation/NAVIGATION.md`

## 2. Exact canon / SOP / how-to files found and read

### Constitution / HQ canon
- `/Users/reginaldberry/Library/Mobile Documents/com~apple~CloudDocs/XLR8ROS/HQ/XLR8ROS-HQ/Constitution.md`
- `/Users/reginaldberry/Library/Mobile Documents/com~apple~CloudDocs/XLR8ROS/HQ/XLR8ROS-HQ/Company SOP 4 XOS-HQ.md`

### SEAD canon / SOP
- `/Users/reginaldberry/Library/Mobile Documents/com~apple~CloudDocs/XLR8ROS/HQ/SEAD/XLR8ROS_SEAD/Division SOP 4 XOS SEAD.md`
- `/Users/reginaldberry/Library/Mobile Documents/com~apple~CloudDocs/XLR8ROS/HQ/SEAD/XLR8ROS_SEAD/Position SOP 4 XOS SEAD CHEIF.md` (file exists in the inventory; direct read attempt on that exact path failed with ENOENT)
- `/Users/reginaldberry/Library/Mobile Documents/com~apple~CloudDocs/XLR8ROS/HQ/SEAD/XLR8ROS_SEAD/XOS SEAD Chief Executive Suite/Position SOP 4 XOS SEAD CHEIF.md`
- `/Users/reginaldberry/Library/Mobile Documents/com~apple~CloudDocs/XLR8ROS/HQ/SEAD/XLR8ROS_SEAD/SEAD HOW-TO DOCS/STANDARD OPERATING PROCEDURES FOR XLR8ROS SYSTEMS, ENGINEERING, AND ARCHITECTURE DIVISION (SEAD).MD`
- `/Users/reginaldberry/Library/Mobile Documents/com~apple~CloudDocs/XLR8ROS/HQ/SEAD/XLR8ROS_SEAD/SEAD HOW-TO DOCS/STANDARD OPERATING PROCEDURES FOR XLR8ROS.MD`

### Chief of SEAD / Executive Office canon
- `/Users/reginaldberry/Library/Mobile Documents/com~apple~CloudDocs/XLR8ROS/HQ/SEAD/XLR8ROS_SEAD/XOS SEAD Chief Executive Suite/HOW-TO 4 XOS SEAD CHIEF EXECUTIVE SUITE/CHIEF_OF_SEAD_COORDINATION_HOWTO.md`
- `/Users/reginaldberry/Library/Mobile Documents/com~apple~CloudDocs/XLR8ROS/HQ/SEAD/XLR8ROS_SEAD/XOS SEAD Chief Executive Suite/HOW-TO 4 XOS SEAD CHIEF EXECUTIVE SUITE/CHIEF_OF_SEAD_REPORTING_HOWTO.md`
- `/Users/reginaldberry/Library/Mobile Documents/com~apple~CloudDocs/XLR8ROS/HQ/SEAD/XLR8ROS_SEAD/XOS SEAD Chief Executive Suite/HOW-TO 4 XOS SEAD CHIEF EXECUTIVE SUITE/CHIEF_OF_SEAD_BLOCKER_HANDLING_HOWTO.md`
- `/Users/reginaldberry/Library/Mobile Documents/com~apple~CloudDocs/XLR8ROS/HQ/SEAD/XLR8ROS_SEAD/XOS SEAD Chief Executive Suite/HOW-TO 4 XOS SEAD CHIEF EXECUTIVE SUITE/CHIEF_OF_SEAD_COMPLETION_HOWTO.md`
- `/Users/reginaldberry/Library/Mobile Documents/com~apple~CloudDocs/XLR8ROS/HQ/SEAD/XLR8ROS_SEAD/XOS SEAD Chief Executive Suite/Position SOP 4 XOS SEAD CHEIF.md`

### CodiCore root law / how-tos
- `/Users/reginaldberry/Library/Mobile Documents/com~apple~CloudDocs/XLR8ROS/Agents/Primary/CodiCore/CodiCore/AGENT.md`
- `/Users/reginaldberry/Library/Mobile Documents/com~apple~CloudDocs/XLR8ROS/Agents/Primary/CodiCore/CodiCore/AGENTS.md`
- `/Users/reginaldberry/Library/Mobile Documents/com~apple~CloudDocs/XLR8ROS/Agents/Primary/CodiCore/CodiCore/MEMORY.md`
- `/Users/reginaldberry/Library/Mobile Documents/com~apple~CloudDocs/XLR8ROS/Agents/Primary/CodiCore/CodiCore/IDENTITY.md`
- `/Users/reginaldberry/Library/Mobile Documents/com~apple~CloudDocs/XLR8ROS/Agents/Primary/CodiCore/CodiCore/SOUL.md`
- `/Users/reginaldberry/Library/Mobile Documents/com~apple~CloudDocs/XLR8ROS/Agents/Primary/CodiCore/CodiCore/USER.md`
- `/Users/reginaldberry/Library/Mobile Documents/com~apple~CloudDocs/XLR8ROS/Agents/Primary/CodiCore/CodiCore/HEARTBEAT.md`
- `/Users/reginaldberry/Library/Mobile Documents/com~apple~CloudDocs/XLR8ROS/Agents/Primary/CodiCore/CodiCore/IMPORTANT_CODI_HOW-TO/XOS_Memory_Flow_HOWTO.md`
- `/Users/reginaldberry/Library/Mobile Documents/com~apple~CloudDocs/XLR8ROS/Agents/Primary/CodiCore/CodiCore/IMPORTANT_CODI_HOW-TO/XOS_Repo_Hygiene_HOWTO.md`

## 3. Exact scoped roots searched

- `/Users/reginaldberry/Library/Mobile Documents/com~apple~CloudDocs/XLR8ROS`
- `/Users/reginaldberry/Library/Mobile Documents/com~apple~CloudDocs/XLR8ROS/HQ`
- `/Users/reginaldberry/Library/Mobile Documents/com~apple~CloudDocs/XLR8ROS/HQ/SEAD`
- `/Users/reginaldberry/Library/Mobile Documents/com~apple~CloudDocs/XLR8ROS/Agents/Primary/CodiCore/CodiCore`

## 4. Authority hierarchy understood

1. Constitution and Articles
2. HQ canon / HQ SOP
3. SEAD Division SOP
4. Chief of SEAD / Position SOPs and office-specific guidance
5. CodiCore root law files (`AGENT.md`, `AGENTS.md`, `MEMORY.md`, identity / soul / user / heartbeat files)
6. Operational how-tos (`IMPORTANT_CODI_HOW-TO/`, SEAD how-tos, HQ how-tos)
7. Durable memory
8. Evidence files and tool output

Conflict rule: when sources disagree, surface the conflict and defer to the highest authority source.

## 5. Memory promotion rules understood

- `MEMORY.md` is protected memory contract, not a journal or promotion target.
- Promotion source feeds: `memory/YYYY-MM-DD.md`, `sessions/`, `Outputs/`, `event-log/`, `DREAMS.md` / `dreams.md`, and relevant legacy evidence.
- Promotion flow: review evidence → distill → write to `Durable_Memory/` → log promotion in `Outputs/promotion-logs/`.
- Raw logs, raw reports, raw proposals, raw sessions, raw daily notes, Dreaming state, and raw QMD results must not be promoted unchanged.
- Routine durable memory may be promoted without Reg approval if it is source-backed and not canon-changing.
- Canon-sensitive material must be stored as approval-sensitive or proposed, not silently promoted into root docs.

## 6. Repo hygiene rules understood

- Read navigation and relevant how-tos before cleanup, lane decisions, memory review, or path-sensitive work.
- Use exact inventory, exact path mapping, preserve source evidence, verify destination, then report.
- Do not invent new lanes without Reg.
- Protected root files must not be edited unless exact Reg approval exists.
- Daily notes belong in `memory/YYYY-MM-DD.md`; outputs/reports/proposals belong in `Outputs/`.
- Recoverable move beats deletion.
- Every file in scope needs an action or an explicit skip reason.

## 7. QMD limits understood

- QMD is retrieval, not authority.
- Do not use QMD when exact files/paths are known and direct inspection is safer.
- QMD cannot override Constitution, canon, AGENT.md, AGENTS.md, MEMORY.md, explicit Reg direction, direct files, or event-log evidence.
- If QMD fails or times out, report that and continue with direct evidence when possible.

## 8. Protected-file rules understood

- Protected root files include `AGENT.md`, `AGENTS.md`, `MEMORY.md`, `USER.md`, `IDENTITY.md`, `SOUL.md`, `TOOLS.md`, `HEARTBEAT.md`, and root SOP/canon/governance docs.
- Do not edit protected files without exact authorization.
- Do not silently rewrite canon or governance.
- Preserve evidence before removing or moving anything.
- Recoverable removal is preferred over permanent deletion.

## 9. Missing docs or navigation gaps

- The main navigation files were found and read.
- The scoped discovery found the relevant Constitution, HQ SOP, SEAD SOP, Chief of SEAD, and CodiCore root law/how-to files.
- One path surfaced as a gap during direct read: `/Users/reginaldberry/Library/Mobile Documents/com~apple~CloudDocs/XLR8ROS/HQ/SEAD/XLR8ROS_SEAD/Position SOP 4 XOS SEAD CHEIF.md` returned ENOENT, while the same filename under `XOS SEAD Chief Executive Suite/` exists and was read successfully.
- The earlier blocker is therefore a navigation/path-duplication gap, not a final authority gap.

## 10. Remaining gaps and memory promotion readiness

- Remaining gaps are approval-sensitive navigation gaps, not blockers to understanding the canon hierarchy.
- The canon orientation is sufficient to proceed with memory promotion review.
- I am ready for the memory promotion review, with the caveat that the duplicated/misaligned SEAD position SOP path should be treated as a path-resolution issue during any future cleanup or canonicalization work.
