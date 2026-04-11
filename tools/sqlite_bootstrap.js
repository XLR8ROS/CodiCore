#!/usr/bin/env node
const fs = require('fs');
const path = require('path');
const { spawnSync } = require('child_process');

const repoRoot = path.resolve(__dirname, '..');
const dbPath = path.join(repoRoot, 'memory', 'sqlite', 'events.sqlite');

if (!fs.existsSync(dbPath)) {
  console.error(`SQLite DB not found: ${dbPath}`);
  process.exit(1);
}

const sql = [
  'PRAGMA foreign_keys = ON;',
  'PRAGMA busy_timeout = 5000;',
  'PRAGMA synchronous = NORMAL;',
  'PRAGMA foreign_keys;'
].join('\n');

const result = spawnSync('sqlite3', [dbPath], {
  input: sql,
  encoding: 'utf8'
});

if (result.error) {
  console.error(result.error.message);
  process.exit(1);
}

if (result.status !== 0) {
  process.stderr.write(result.stderr || 'sqlite3 bootstrap failed\n');
  process.exit(result.status || 1);
}

const output = (result.stdout || '').trim().split(/\r?\n/).map(s => s.trim()).filter(Boolean);
const foreignKeys = output[output.length - 1] || '';

if (foreignKeys !== '1') {
  console.error(`foreign_keys verification failed for ${dbPath}. Expected 1, got: ${foreignKeys || '(empty)'}`);
  process.exit(2);
}

console.log(`DB_PATH=${dbPath}`);
console.log(`PRAGMA foreign_keys=${foreignKeys}`);
