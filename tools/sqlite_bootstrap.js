#!/usr/bin/env node
const fs = require('fs');
const path = require('path');
const { spawnSync } = require('child_process');

const repoRoot = path.resolve(__dirname, '..');
const dbPath = path.join(repoRoot, 'memory', 'sqlite', 'events.sqlite');

function ensureDbExists() {
  if (!fs.existsSync(dbPath)) {
    throw new Error(`SQLite DB not found: ${dbPath}`);
  }
}

function bootstrapSqlite() {
  ensureDbExists();

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
    throw result.error;
  }

  if (result.status !== 0) {
    throw new Error(result.stderr || 'sqlite3 bootstrap failed');
  }

  const output = (result.stdout || '').trim().split(/\r?\n/).map(s => s.trim()).filter(Boolean);
  const foreignKeys = output[output.length - 1] || '';

  if (foreignKeys !== '1') {
    throw new Error(`foreign_keys verification failed for ${dbPath}. Expected 1, got: ${foreignKeys || '(empty)'}`);
  }

  return { dbPath, foreignKeys };
}

function runSql(sql) {
  bootstrapSqlite();

  const result = spawnSync('sqlite3', [dbPath], {
    input: sql,
    encoding: 'utf8'
  });

  if (result.error) {
    throw result.error;
  }

  if (result.status !== 0) {
    throw new Error(result.stderr || 'sqlite3 SQL execution failed');
  }

  return result.stdout || '';
}

module.exports = {
  dbPath,
  bootstrapSqlite,
  runSql,
};

if (require.main === module) {
  try {
    const { foreignKeys } = bootstrapSqlite();
    console.log(`DB_PATH=${dbPath}`);
    console.log(`PRAGMA foreign_keys=${foreignKeys}`);
  } catch (error) {
    console.error(error.message);
    process.exit(1);
  }
}
