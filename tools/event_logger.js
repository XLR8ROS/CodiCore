#!/usr/bin/env node
const path = require('path');
const { bootstrapSqlite, runSql } = require('./sqlite_bootstrap');

function sqlQuote(value) {
  return `'${String(value).replace(/'/g, "''")}'`;
}

function jsonSql(value) {
  return sqlQuote(JSON.stringify(value));
}

function makeEventId(prefix = 'evt_auto') {
  const stamp = new Date().toISOString().replace(/[-:.TZ]/g, '');
  const rand = Math.random().toString(36).slice(2, 8);
  return `${prefix}_${stamp}_${rand}`;
}

function logAutomaticEvent({
  eventType,
  sourceRef,
  sessionId,
  payload = {},
  tags = [],
  importance = 2,
  agentId = 'codi-core',
  sourceType = 'wrapper_auto',
  eventClass = 'automatic_action',
  status = 'active',
}) {
  if (!eventType) throw new Error('eventType is required');
  if (!sourceRef) throw new Error('sourceRef is required');
  if (!sessionId) throw new Error('sessionId is required');

  bootstrapSqlite();

  const eventId = makeEventId();
  const now = new Date().toISOString();
  const normalizedRef = sourceRef.split(path.sep).join('/');
  const sql = `
INSERT INTO events (
  id, created_at, occurred_at, agent_id, session_id, source_type, source_ref,
  event_type, event_class, importance, payload_json, tags_json, status
) VALUES (
  ${sqlQuote(eventId)},
  ${sqlQuote(now)},
  ${sqlQuote(now)},
  ${sqlQuote(agentId)},
  ${sqlQuote(sessionId)},
  ${sqlQuote(sourceType)},
  ${sqlQuote(normalizedRef)},
  ${sqlQuote(eventType)},
  ${sqlQuote(eventClass)},
  ${Number(importance)},
  ${jsonSql(payload)},
  ${jsonSql(tags)},
  ${sqlQuote(status)}
);
`;

  runSql(sql);
  return { eventId, eventType, sourceRef: normalizedRef, sessionId, createdAt: now };
}

module.exports = {
  logAutomaticEvent,
};
