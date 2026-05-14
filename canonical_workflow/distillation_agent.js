// Distillation/Compound-Engineering Agent
// Consumes completed Reader reports and produces lessons/synthesis

class DistillationAgent {
  constructor() {
    this.reports = [];
  }

  consumeReports(reports) {
    this.reports = this.reports.concat(reports);
  }

  synthesize() {
    // Simple example: concatenate all content
    const synthesis = this.reports
      .filter(r => r.status === 'completed')
      .map(r => r.content)
      .join('\n---\n');

    // Real synthesis logic would be more complex
    return synthesis;
  }
}

module.exports = DistillationAgent;