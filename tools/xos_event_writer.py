#!/usr/bin/env python3
"""
XOS Event Writer for CodiCore.

Black-box event inserter for:
  event-log/events.sqlite

Main table:
  events
"""

from __future__ import annotations

import argparse
import json
import os
import sqlite3
import sys
import uuid
from datetime import datetime, timezone
from pathlib import Path


DEFAULT_DB_PATH = (
    Path.home()
    / "Library/Mobile Documents/com~apple~CloudDocs/XLR8ROS"
    / "Agents/Primary/CodiCore/CodiCore/event-log/events.sqlite"
)


def utc_now() -> str:
    return datetime.now(timezone.utc).isoformat(timespec="milliseconds").replace("+00:00", "Z")


def build_event(args: argparse.Namespace) -> dict:
    now = utc_now()

    return {
        "id": args.event_id or f"evt_{uuid.uuid4().hex}",
        "created_at": args.created_at or now,
        "occurred_at": args.occurred_at or now,
        "agent_id": args.agent_id,
        "session_id": args.session_id,
        "source_type": args.source_type,
        "source_ref": args.source_ref,
        "event_type": args.event_type,
        "event_class": args.event_class,
        "importance": args.importance,
        "payload_json": args.payload_json,
        "tags_json": args.tags_json,
        "status": args.status,
    }


def insert_event(db_path: Path, event: dict) -> None:
    conn = sqlite3.connect(str(db_path))
    try:
        conn.execute(
            """
            INSERT INTO events (
              id,
              created_at,
              occurred_at,
              agent_id,
              session_id,
              source_type,
              source_ref,
              event_type,
              event_class,
              importance,
              payload_json,
              tags_json,
              status
            )
            VALUES (
              :id,
              :created_at,
              :occurred_at,
              :agent_id,
              :session_id,
              :source_type,
              :source_ref,
              :event_type,
              :event_class,
              :importance,
              :payload_json,
              :tags_json,
              :status
            );
            """,
            event,
        )
        conn.commit()
    finally:
        conn.close()


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Insert a black-box XOS event into CodiCore SQLite.")

    parser.add_argument("--db", default=os.environ.get("XOS_EVENT_DB", str(DEFAULT_DB_PATH)))
    parser.add_argument("--event-id")
    parser.add_argument("--created-at")
    parser.add_argument("--occurred-at")
    parser.add_argument("--agent-id", required=True)
    parser.add_argument("--session-id", required=True)
    parser.add_argument("--source-type", required=True)
    parser.add_argument("--source-ref")
    parser.add_argument("--event-type", required=True)
    parser.add_argument("--event-class", required=True)
    parser.add_argument("--importance", type=int, required=True)
    parser.add_argument("--payload-json", required=True)
    parser.add_argument("--tags-json", default="[]")
    parser.add_argument("--status", default="active")
    parser.add_argument("--dry-run", action="store_true")

    return parser.parse_args()


def main() -> int:
    args = parse_args()
    db_path = Path(args.db).expanduser()
    event = build_event(args)

    if args.dry_run:
        print(json.dumps(event, indent=2))
        return 0

    try:
        insert_event(db_path, event)
        print(event["id"])
        return 0
    except sqlite3.Error as exc:
        print(f"SQLite insert failed: {exc}", file=sys.stderr)
        return 1


if __name__ == "__main__":
    raise SystemExit(main())
