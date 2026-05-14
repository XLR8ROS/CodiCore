// Reader Agent
// Reads exactly one assigned file and reports completed or blocked

class ReaderAgent {
  constructor(readerAgentId, custodianAgent) {
    this.readerAgentId = readerAgentId;
    this.custodian = custodianAgent;
  }

  readFile(filePath, fileSystem) {
    try {
      const content = fileSystem.readFile(filePath);
      this.custodian.markCompleted(filePath);
      return { status: 'completed', filePath, content };
    } catch (error) {
      this.custodian.markBlocked(filePath);
      return { status: 'blocked', filePath, error: error.message };
    }
  }
}

module.exports = ReaderAgent;