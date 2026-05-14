const Custodian = require('../agents/custodian/custodian');
const Intake = require('../agents/intake/intake');
const Reader = require('../agents/reader/reader');
const Distiller = require('../agents/distiller/distiller');

const canonDir = './canon_files'; // Directory containing canon files
const readerAgentIds = ['reader1', 'reader2', 'reader3']; // Example reader agent IDs

// Instantiate agents
const custodian = new Custodian(canonDir);
const intake = new Intake(custodian, readerAgentIds);
const distiller = new Distiller();

// Intake assigns unread files to reader agents
intake.assignFiles();

// Reader agents process their assigned files
custodian.getAssignmentMap().forEach((readerId, filePath) => {
  const reader = new Reader(filePath);
  const content = reader.readFile();
  // For simplicity, assume content is report
  distiller.addReport('Report from ' + readerId + ' for file ' + filePath + ':\n' + content);
  // Mark file as completed in custodian
  custodian.markCompleted(filePath);
});

// Distiller synthesizes all reports
const summary = distiller.distill();
console.log('Distilled Summary of Canon Reading:');
console.log(summary);
