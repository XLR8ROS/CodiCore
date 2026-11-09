# Codi Core Root Layout Migration

**Date:** 2026-11-09. **Rule:** only `memory/` as the normal content folder in agent Core root. Root files remain root files; `.git/`, `.github/` and hidden required runtime metadata remain special infrastructure exceptions.

## Verified path map

| Previous path | Current path |
|---|---|
| `Distilled_Lessons/` | `memory/Compound_Engineering/Distilled_Lessons/` |
| `Durable_Memory/` | `memory/Durable_Memory/` |
| `Navigation/` | `memory/Legacy_Navigation/` |
| `Outputs/` | `memory/Outputs/` |
| `event-log/` | `memory/Event_Log/` |
| `governance/` | `memory/Legacy_Governance/` |
| `maintenance/` | `memory/Maintenance_History/` |
| `skills/` | `memory/Runtime_Assets/skills/` |
| `state/` | `memory/Runtime_State/` |
| `tasks/` | `memory/Tasks/` |
| `tools/` | `memory/Runtime_Assets/tools/` |

The files were moved using `git mv`, preserving unchanged file contents and prior history. Historical Daily Notes may refer to earlier paths and are intentionally not rewritten. Files under `memory/Runtime_Assets/` are retained for provenance and compatibility analysis; launching them still requires explicit identity, source and runtime verification.

**Control-plane warning:** the former `xos_clone_global_memory_contract.sh` and rollback helper include obsolete direct Markdown mirroring, including retired Nex. Both are disabled before any side effects. Use the HQ YAML canonical synchronization workflow, not the legacy helpers.

**Deployment boundary:** the GitHub source tree was normalized in an isolated working tree. No preexisting local Codi runtime directory, launch job, credentials, or service files were moved in place. A running runtime that assumes old physical paths requires a separately verified path migration before switching its working folder.
