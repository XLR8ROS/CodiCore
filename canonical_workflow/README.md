# Canon Workflow Structure Implementation

## Roles and Responsibilities

### 1. Custodian Agent
- Acts as the sole source of truth for:
  - Inventory of all canon files
  - Assignment map of which files have been assigned to which Reader Agents
  - Status ledger tracking progress of the assigned files

### 2. Intake/Dispatcher Agent
- Receives tasks from Custodian
- Assigns exactly one file path per Reader Agent
- Ensures no duplicate assignments across Reader Agents

### 3. Reader Agents
- Each assigned exactly one file path
- Reads the file
- Reports:
  - Completed with reading output
  - Blocked with evidence if unable to read

### 4. Distillation/Compound-Engineering Agent
- Consumes completed Reader reports
- Produces lessons, synthesis, or aggregated insights
- Does not own or mutate the ledger

## Workflow Features

- Supports parallel processing of unread canon files
- Avoids duplicate file reading assignments
- Facilitates clear division of labor for scalable canon processing

## Implementation Notes

- The Custodian Agent must be designed as the authoritative ledger of assignments and status.
- Intake/Dispatcher Agent acts as the broker between Custodian and Reader Agents.
- Reader Agents are numerous and stateless, each focused on exactly one file.
- Distillation Agent processes completed reads only, without side effects on assignment or inventory.

---

This README is the source of truth for the four-role canon workflow structure.