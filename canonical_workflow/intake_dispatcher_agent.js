// Intake/Dispatcher Agent
// Assigns one exact file path to each Reader Agent

class IntakeDispatcherAgent {
  constructor(custodianAgent) {
    this.custodian = custodianAgent;
  }

  dispatch(readerAgentIds) {
    const pendingFiles = this.custodian.getPendingFiles();
    const assignments = [];
    let readerIndex = 0;
    const readerCount = readerAgentIds.length;

    for (const filePath of pendingFiles) {
      if (readerIndex >= readerCount) break;
      const readerAgentId = readerAgentIds[readerIndex];
      try {
        this.custodian.assignFileToReader(filePath, readerAgentId);
        assignments.push({ filePath, readerAgentId });
        readerIndex++;
      } catch (e) {
        // already assigned or error, skip
        continue;
      }
    }

    return assignments;
  }
}

module.exports = IntakeDispatcherAgent;