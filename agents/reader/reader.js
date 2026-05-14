// Reader Agent
// Processes one assigned canon file and reports status

const fs = require('fs');

class Reader {
  constructor(filePath) {
    this.filePath = filePath;
    this.status = 'pending';
  }

  readFile() {
    try {
      const content = fs.readFileSync(this.filePath, 'utf-8');
      this.status = 'completed';
      return content;
    } catch (e) {
      this.status = 'error';
      throw e;
    }
  }

  getStatus() {
    return this.status;
  }

}

module.exports = Reader;
