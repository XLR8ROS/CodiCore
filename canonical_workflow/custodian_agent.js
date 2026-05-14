// Custodian Agent
// Sole source of truth for inventory, assignment map, and status ledger

class CustodianAgent {
  constructor() {
    this.inventory = new Set();        // Set of all canon file paths
    this.assignmentMap = new Map();    // filePath -> readerAgentId
    this.statusLedger = new Map();     // filePath -> status ('pending', 'assigned', 'completed', 'blocked')
  }

  addToInventory(filePath) {
    this.inventory.add(filePath);
    if (!this.statusLedger.has(filePath)) {
      this.statusLedger.set(filePath, 'pending');
    }
  }

  assignFileToReader(filePath, readerAgentId) {
    if (!this.inventory.has(filePath)) {
      throw new Error(`File ${filePath} not in inventory`);
    }
    if (this.assignmentMap.has(filePath)) {
      throw new Error(`File ${filePath} already assigned`);
    }
    this.assignmentMap.set(filePath, readerAgentId);
    this.statusLedger.set(filePath, 'assigned');
  }

  markCompleted(filePath) {
    this.statusLedger.set(filePath, 'completed');
  }

  markBlocked(filePath) {
    this.statusLedger.set(filePath, 'blocked');
  }

  getPendingFiles() {
    return [...this.inventory].filter(fp => this.statusLedger.get(fp) === 'pending');
  }

  getAssignmentMap() {
    return new Map(this.assignmentMap);
  }

  getStatusLedger() {
    return new Map(this.statusLedger);
  }
}

module.exports = CustodianAgent;