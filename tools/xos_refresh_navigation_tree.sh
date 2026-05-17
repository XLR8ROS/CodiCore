#!/usr/bin/env bash
set -euo pipefail

ROOT="$HOME/Library/Mobile Documents/com~apple~CloudDocs/XLR8ROS"
SOURCE="$ROOT/NAVIGATION.md"

DESTS=(
  "$ROOT/Agents/Primary/CodiCore/CodiCore/Navigation/NAVIGATION.md"
  "$ROOT/HQ/XLR8ROS-HQ/Navigation/NAVIGATION.md"
  "$ROOT/HQ/SEAD/XLR8ROS_SEAD/Navigation/NAVIGATION.md"
  "$ROOT/HQ/SEAD/XLR8ROS_SEAD/XOS SEAD Chief Executive Suite/Navigation/NAVIGATION.md"
)

python3 - <<'PY'
from pathlib import Path
from datetime import datetime

root = Path.home() / "Library/Mobile Documents/com~apple~CloudDocs/XLR8ROS"
source = root / "NAVIGATION.md"

def walk(path, prefix=""):
    items = sorted(
        [p for p in path.iterdir() if p.name != ".DS_Store"],
        key=lambda p: (not p.is_dir(), p.name.lower())
    )
    lines = []

    for i, item in enumerate(items):
        connector = "└── " if i == len(items) - 1 else "├── "
        lines.append(prefix + connector + item.name)

        if item.is_dir():
            extension = "    " if i == len(items) - 1 else "│   "
            lines.extend(walk(item, prefix + extension))

    return lines

source.write_text("\n".join([
    "# XLR8ROS Navigation",
    "",
    f"Root: `{root}`",
    f"Generated: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}",
    "",
    "```text",
    "XLR8ROS/",
    *walk(root),
    "```",
    ""
]), encoding="utf-8")

print(f"Updated source: {source}")
PY

for dest in "${DESTS[@]}"; do
  mkdir -p "$(dirname "$dest")"
  cp "$SOURCE" "$dest"
  echo "Updated copy: $dest"
done
