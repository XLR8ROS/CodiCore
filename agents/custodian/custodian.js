// Custodian Agent
// Manages inventory and assignment map of canon files

const fs = require('fs');
const path = require('path');

class Custodian {
  constructor(canonDir) {
    this.canonDir = canonDir;
    this.inventory = new Set();
    this.assignmentMap = new Map(); // filePath to readerAgentId
    this.loadInventory();
  }

  loadInventory() {
    const files = fs.readdirSync(this.canonDir);
    files.forEach(file => {
      const fullPath = path.join(this.canonDir, file);
      if (!this.inventory.has(fullPath)) {
        this.inventory.add(fullPath);
      }
    });
  }

  getUnassignedFiles() {
    return [...this.inventory].filter(file => !this.assignmentMap.has(file));
  }

  assignFileToReader(filePath, readerAgentId) {
    if (!this.inventory.has(filePath)) {
      throw new Error('File not in inventory');
    }
    this.assignmentMap.set(filePath, readerAgentId);
  }

  markCompleted(filePath) {
    this.assignmentMap.delete(filePath);
    this.inventory.delete(filePath);
  }

  getAssignmentMap() {
    return new Map(this.assignmentMap);
  }

  saveState() {
    // Implement persistent save if needed
  }

  loadState() {
    // Implement load state if needed
  }

}

module.exports = Custodian;
