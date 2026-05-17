#!/usr/bin/env zsh
set -euo pipefail

XOS_ROOT="${XOS_ROOT:-$HOME/Library/Mobile Documents/com~apple~CloudDocs/XLR8ROS}"
OUT="$XOS_ROOT/NAVIGATION.md"
TMP="$(mktemp)"

DESTS=(
  "$XOS_ROOT/Agents/Primary/CodiCore/CodiCore/Navigation/NAVIGATION.md"
  "$XOS_ROOT/HQ/XLR8ROS-HQ/Navigation/NAVIGATION.md"
  "$XOS_ROOT/HQ/SEAD/XLR8ROS_SEAD/Navigation/NAVIGATION.md"
  "$XOS_ROOT/HQ/SEAD/XLR8ROS_SEAD/XOS SEAD Chief Executive Suite/Navigation/NAVIGATION.md"
)

cd "$XOS_ROOT"

{
  echo "# NAVIGATION"
  echo
  echo "Generated: $(date '+%Y-%m-%d %H:%M:%S %Z')"
  echo "Root: $XOS_ROOT"
  echo
  echo "## Tree"
  echo
  find . \( \
    -name .git -o \
    -name node_modules -o \
    -name __pycache__ -o \
    -name .venv -o \
    -name venv -o \
    -name NAVIGATION.md \
  \) -prune -o -print \
    | sed 's#^\./##' \
    | sed '/^\.$/d' \
    | sort
} > "$TMP"

mv "$TMP" "$OUT"

echo "updated: $OUT"

for dest in "${DESTS[@]}"; do
  mkdir -p "$(dirname "$dest")"
  cp "$OUT" "$dest"
  echo "updated: $dest"
done
