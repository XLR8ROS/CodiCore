// Intake/Dispatcher Agent
// Assigns unread canon files uniquely to reader agents

const Custodian = require('../custodian/custodian');

class Intake {
  constructor(custodian, readerAgentIds) {
    this.custodian = custodian;
    this.readerAgentIds = readerAgentIds;
    this.nextReaderIndex = 0;
  }

  getNextReaderId() {
    const id = this.readerAgentIds[this.nextReaderIndex];
    this.nextReaderIndex = (this.nextReaderIndex + 1) % this.readerAgentIds.length;
    return id;
  }

  assignFiles() {
    const unassignedFiles = this.custodian.getUnassignedFiles();
    unassignedFiles.forEach(file => {
      const readerId = this.getNextReaderId();
      this.custodian.assignFileToReader(file, readerId);
    });
  }

}

module.exports = Intake;
