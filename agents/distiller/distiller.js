// Distillation Agent
// Aggregates and synthesizes reports from readers

class Distiller {
  constructor() {
    this.reports = [];
  }

  addReport(report) {
    this.reports.push(report);
  }

  distill() {
    // Example: simple concatenation of all reports
    return this.reports.join('\n\n');
  }

}

module.exports = Distiller;
