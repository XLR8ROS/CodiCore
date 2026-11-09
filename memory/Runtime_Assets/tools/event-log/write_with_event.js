#!/usr/bin/env node
const fs = require('fs');
const path = require('path');
const { logAutomaticEvent } = require('./event_logger');

function parseArgs(argv) {
  const args = { append: false };
  for (let i = 0; i < argv.length; i += 1) {
    const arg = argv[i];
    if (arg === '--append') {
      args.append = true;
    } else if (arg === '--path') {
      args.path = argv[++i];
    } else if (arg === '--content') {
      args.content = argv[++i];
    } else if (arg === '--content-file') {
      args.contentFile = argv[++i];
    } else if (arg === '--session-id') {
      args.sessionId = argv[++i];
    }
  }
  return args;
}

function normalizeRelative(targetPath) {
  return targetPath.split(path.sep).join('/');
}

function classifyEvent(relativePath, existedBefore) {
  if (relativePath.startsWith('sessions/')) {
    return 'session_log.write';
  }
  if (relativePath.startsWith('outputs/') && !existedBefore) {
    return 'output.create';
  }
  if (existedBefore) {
    return 'file.edit';
  }
  return 'file.write';
}

function main() {
  const args = parseArgs(process.argv.slice(2));
  if (!args.path) throw new Error('--path is required');
  if (!args.sessionId) throw new Error('--session-id is required');

  const repoRoot = path.resolve(__dirname, '..');
  const targetPath = path.resolve(repoRoot, args.path);
  const relativePath = normalizeRelative(path.relative(repoRoot, targetPath));
  const existedBefore = fs.existsSync(targetPath);
  const inputContent = args.contentFile
    ? fs.readFileSync(path.resolve(repoRoot, args.contentFile), 'utf8')
    : (args.content ?? fs.readFileSync(0, 'utf8'));

  fs.mkdirSync(path.dirname(targetPath), { recursive: true });

  if (args.append && existedBefore) {
    fs.appendFileSync(targetPath, inputContent, 'utf8');
  } else {
    fs.writeFileSync(targetPath, inputContent, 'utf8');
  }

  const finalStats = fs.statSync(targetPath);
  const eventType = classifyEvent(relativePath, existedBefore);
  const result = logAutomaticEvent({
    eventType,
    sourceRef: relativePath,
    sessionId: args.sessionId,
    payload: {
      bytes: finalStats.size,
      append: Boolean(args.append),
      existedBefore,
    },
    tags: ['automatic', 'repo_local_wrapper', eventType],
  });

  process.stdout.write(`${JSON.stringify(result)}\n`);
}

try {
  main();
} catch (error) {
  console.error(error.message);
  process.exit(1);
}
