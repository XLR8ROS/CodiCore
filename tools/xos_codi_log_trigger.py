#!/usr/bin/env python3
"""
Codi OpenClaw live log trigger.

This script follows OpenClaw logs, filters Codi/Cody-related lines,
and writes each matching line as a black-box runtime event using
tools/xos_event_writer.py.

It does not interpret the log line.
It does not decide truth.
It only records that a Codi-related OpenClaw log line appeared.
"""

from __future__ import annotations

import json
import re
import subprocess
import sys
from pathlib import Path


REPO_ROOT = Path(__file__).resolve().parents[1]
WRITER = REPO_ROOT / "tools" / "xos_event_writer.py"

MATCH_RE = re.compile(
    r"(codi|cody|agent-codi|g-agent-codi|telegram:g-agent-codi|codicore|codi_core)",
    re.IGNORECASE,
)


def emit_event(raw_line: str) -> int:
    payload = {
        "trigger": "openclaw_logs_follow",
        "raw_log_line": raw_line.rstrip("\n"),
    }

    cmd = [
        "python3",
        str(WRITER),
        "--agent-id",
        "Codi",
        "--session-id",
        "openclaw-follow",
        "--source-type",
        "openclaw_logs_follow",
        "--source-ref",
        "openclaw logs --follow",
        "--event-type",
        "codi_log_appended",
        "--event-class",
        "runtime",
        "--importance",
        "1",
        "--payload-json",
        json.dumps(payload, ensure_ascii=False),
        "--tags-json",
        json.dumps(["openclaw", "codi", "trigger"]),
    ]

    result = subprocess.run(cmd, text=True, capture_output=True)

    if result.returncode != 0:
        print(result.stderr.strip(), file=sys.stderr)
        return result.returncode

    event_id = result.stdout.strip()
    if event_id:
        print(event_id, flush=True)

    return 0


def main() -> int:
    if not WRITER.exists():
        print(f"Missing event writer: {WRITER}", file=sys.stderr)
        return 1

    proc = subprocess.Popen(
        ["openclaw", "logs", "--follow"],
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        text=True,
        bufsize=1,
    )

    assert proc.stdout is not None

    for line in proc.stdout:
        if MATCH_RE.search(line):
            emit_event(line)

    return proc.wait()


if __name__ == "__main__":
    raise SystemExit(main())
