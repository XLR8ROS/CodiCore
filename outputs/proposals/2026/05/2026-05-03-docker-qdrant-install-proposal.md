# Proposal for Docker-Based Qdrant Install

## 1. Target Architecture  
The Qdrant deployment will be established in Docker, ensuring it remains modular and portable.
- **Docker-based Qdrant Service**: Qdrant will run in a Docker container, providing ease of deployment and isolation.
- **Persistent Mounted Storage**: Data will be retained across container restarts.  
- **Service Name**: `qdrant`
- **Host Paths / Volume Paths**:  
  - Host Path: `$(pwd)/qdrant_storage`  
  - Volume Path: `/qdrant/storage` 
- **Ports**:  
  - `6333` for HTTP/API access  
  - `6334` for gRPC access (only if needed)
- **Docker Compose vs. Plain Docker Run**:  
  - **Recommendation**: Use Docker Compose, as it simplifies the management of the stack and configurations for multi-container setups.

## 2. Phase Structure  
### B1 — Docker/Qdrant Install Preflight  
- **Purpose**: Ensure Docker is installed and running.
- **Dependencies**: Docker installed and running.
- **Exact Proposed Commands**:
  ```bash
  docker --version
  ```
- **Expected Result**: Display Docker version.
- **Failure Signs**: Docker not found or command fails.
- **Rollback or Recovery Step**: Install or restart Docker service.
- **What Gets Logged**: Docker status result.

### B2 — Install Layout and Volume Plan  
- **Purpose**: Determine the host paths and volume configurations.
- **Dependencies**: Target directories exist.
- **Exact Proposed Commands**: Create the volume path.
  ```bash
  mkdir -p $(pwd)/qdrant_storage
  ```
- **Expected Result**: Create persistent storage directory.
- **Failure Signs**: Directory creation failure.
- **Rollback or Recovery Step**: Verify permissions and retry directory creation.
- **What Gets Logged**: Directory creation status.

### B3 — Docker Service Definition  
- **Purpose**: Define the Qdrant service in a Docker-Compose YAML file.
- **Dependencies**: None beyond previously established layout.
- **Exact Proposed Commands**:
  ```yaml
  version: '3.8'
  services:
    qdrant:
      image: qdrant/qdrant
      container_name: qdrant
      ports:
        - "6333:6333"
        - "6334:6334"
      volumes:
        - qdrant_storage:/qdrant/storage
  volumes:
    qdrant_storage:
  ```
- **Expected Result**: YAML configuration file to set up the service.
- **Failure Signs**: Errors in syntax or structure when creating the file.
- **Rollback or Recovery Step**: Verify YAML syntax with a linter.
- **What Gets Logged**: Configuration file creation status.

### B4 — Start Qdrant  
- **Purpose**: Launch the Qdrant container.
- **Dependencies**: Successful completion of service definition.
- **Exact Proposed Commands**:
  ```bash
  docker-compose up -d
  ```
- **Expected Result**: Qdrant service starts in detached mode.
- **Failure Signs**: Container fails to launch or exits immediately.
- **Rollback or Recovery Step**: Check logs for errors and adjust configurations accordingly.
- **What Gets Logged**: Container startup logs.

### B5 — Create Required Collection(s)  
- **Purpose**: Prepare the necessary Qdrant collections for XOS semantic retrieval.
- **Dependencies**: Qdrant running without errors.
- **Exact Proposed Commands**: Using the client to create collection.
  ```python
  from qdrant_client import QdrantClient, models
  
  client = QdrantClient(url="http://localhost:6333")
  client.create_collection(
    collection_name="xos_semantic_memory",
    vectors_config=models.VectorParams(size=1536, distance=models.Distance.COSINE),
  )
  ```
- **Expected Result**: Collection is created successfully.
- **Failure Signs**: Error response when trying to create collection.
- **Rollback or Recovery Step**: Inspect the error message and adjust collection parameters if needed.
- **What Gets Logged**: Collection creation response.

### B6 — Validate Health, Ports, Persistence, and Integration Path  
- **Purpose**: Ensure Qdrant functioning properly with correct ports mapped.
- **Dependencies**: Running Qdrant service and collection created.
- **Exact Proposed Commands**:
  ```bash
  curl http://localhost:6333/collections
  ```
- **Expected Result**: List of collections is returned, showing healthy state.
- **Failure Signs**: No response, or ‘not found’ errors.
- **Rollback or Recovery Step**: Restart the service and inspect logs for failures.
- **What Gets Logged**: Health check response.

### B7 — Snapshot/Backup/Rollback Procedure  
- **Purpose**: Define how to restore Qdrant in case of failure.
- **Dependencies**: Stable running instance of Qdrant.
- **Exact Proposed Commands**:
  ```bash
  docker commit qdrant qdrant_backup
  ```
- **Expected Result**: Snapshot of the current state is created.
- **Failure Signs**: Command fails to execute.
- **Rollback or Recovery Step**: Inspect permissions and retry taking the snapshot.
- **What Gets Logged**: Snapshot creation logs.

### B8 — Logging/Reporting Handoff  
- **Purpose**: Ensure observable state throughout the installation process.
- **Dependencies**: Consistent logging setup.
- **Exact Proposed Commands**: Set logging structure to capture installation logs.
- **Expected Result**: Clear, consistent logging directory for review.
- **Failure Signs**: Missing logs or inaccessible log files.
- **Rollback or Recovery Step**: Review logging configuration.
- **What Gets Logged**: Installation process logs.

## 3. Dependencies  
- Docker installed and running.
- Ports 6333/6334 available and free.
- Target directories (`qdrant_storage`) must exist.
- Permissions must allow read/write without issues.
- Required collection config known before creation.
- OpenClaw integration path identified before declaring complete.

## 4. Collection Handling  
- **Collection Name**: `xos_semantic_memory`  
- **Vector Size**: `1536` (default unless verified otherwise)  
- **Distance Metric**: `Cosine` (default unless verified otherwise)  

### Validation Commands
- Check Qdrant Health:  
  ```bash
  curl http://localhost:6333/collections
  ```  
- List Collections:  
  ```bash
  curl http://localhost:6333/collections
  ```  
- Inspect Collection Config:  
  ```bash
  curl http://localhost:6333/collections/xos_semantic_memory
  ```  
- Confirm Persistence After Restart:  
  ```bash
  docker restart qdrant
  curl http://localhost:6333/collections
  ```  

## 5. Sub-agent Issue Check  
- **Test Plan**: Verify whether the native sub-agent issue still exists  
- **Known Issue**: Runtime="subagent" fails with: “streamTo is only supported for runtime=acp; got runtime=subagent”  
- **Action**: Run a test to check sub-agent functionality after setting up Qdrant.

## 6. ACP/Manual Workaround  
- **If native sub-agents still fail**:  
  - **When to Use ACP**: Use ACP when complex routing is required and sub-agent failures persist.
  - **Splitting Work Manually**: When ACP isn’t available, tasks can be split into smaller, sequential jobs using manual handlers.
  - **Maintaining Phase Reports**: Keep phases distinct to avoid confusion about completion status.
  - **Avoid Claiming Parallel Execution**: Clearly indicate any tasks that were not performed in parallel due to limitations.

## 7. Parallelization Plan  
- **Sequential Tasks**:  
  - Port verification (ensure ports are available before binding)  
  - Service start (Qdrant must be up before collections can be created)  
  - Health check (must validate service health before integration)
- **Parallelizable Tasks**:  
  - Install layout planning (setup paths can be done without waiting)
  - OpenClaw integration review (check integration while other tasks run)
  - Draft Backup/Snapshot Procedures
  - Validation draft checklists can be prepared in parallel to setup.

## 8. Required Final Output  
- **Title**: Docker-Based Qdrant Install Proposal
- **Objective**: Create a clean and reliable Qdrant environment for XOS semantic recall purposes.
- **Target Architecture**: Detailed in the architecture section.
- **Phase Table**: Outlined in the phase structure section.
- **Dependency Map**: Clearly identifies required dependencies.
- **Command Plan**: Exact commands listed with expected outcomes.
- **Validation Plan**: Procedures to verify successful installation.
- **Rollback Plan**: Commands and actions for restoring to a working state.
- **Sub-agent Status Test**: Describe testing of the known issue with sub-agent functionality.
- **ACP/Manual Workaround How-To**: Include detailed steps for when ACP cannot be used.
- **Risks**: Potential issues with installation and setup.
- **Recommended Improvements or Pushback**: Suggestions for better implementation where applicable.
- **Done Condition**: Proposal is complete when all sections are reviewed and ready for approval.