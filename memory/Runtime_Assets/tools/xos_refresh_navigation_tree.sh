#!/bin/zsh
set -euo pipefail

XOS_ROOT="${XOS_ROOT:-$HOME/Library/Mobile Documents/com~apple~CloudDocs/XLR8ROS}"
CLONE_ROOT="${XOS_GITHUB_ROOT:-$HOME/XOS-GitHub}"
HQ_REPO="${XOS_HQ_REPO:-$CLONE_ROOT/XLR8ROS/xlr8ros-hq}"
MASTER="${XOS_NAV_MASTER:-$HQ_REPO/Navigation/NAVIGATION.md}"
BACKUP_DIR="${XOS_NAV_BACKUP_DIR:-$HQ_REPO/Navigation/backups}"
BACKUP_KEEP="${XOS_NAV_BACKUP_KEEP:-3}"
SCAN_TIMEOUT_SECONDS="${XOS_NAV_SCAN_TIMEOUT_SECONDS:-60}"

mkdir -p "$(dirname "$MASTER")" "$BACKUP_DIR"
candidate=$(mktemp "${TMPDIR:-/tmp}/xos-navigation.XXXXXX")
current=$(mktemp "${TMPDIR:-/tmp}/xos-navigation-current.XXXXXX")
trap 'rm -f "$candidate" "$current" "$MASTER.tmp.$$"' EXIT

if ! {
  echo "XLR8ROS/"
  python3 -c 'import os, signal, sys; signal.alarm(int(sys.argv[1])); os.execvp(sys.argv[2], sys.argv[2:])' \
    "$SCAN_TIMEOUT_SECONDS" find "$XOS_ROOT" -mindepth 1 \( -name .git -o -name node_modules -o -name __pycache__ -o -name .venv -o -name venv -o -name NAVIGATION.md -o -name .DS_Store \) -prune -o -print
} | sed "s#^$XOS_ROOT/##" | sed '/^XOS_ROOT$/d' | sed '/^$/d' > "$candidate"; then
  echo "ERROR: navigation scan failed or exceeded ${SCAN_TIMEOUT_SECONDS}s." >&2
  last_path=$(tail -n 1 "$candidate" 2>/dev/null || true)
  [[ -n "$last_path" ]] && echo "LAST_PATH=$last_path" >&2
  exit 2
fi

if [[ -f "$MASTER" ]]; then
  awk 'found{print} /^XLR8ROS\/$/{found=1; print}' "$MASTER" > "$current"
else
  : > "$current"
fi

if cmp -s "$candidate" "$current"; then
  echo "UNCHANGED: standing down."
  exit 0
fi

if [[ -f "$MASTER" ]]; then
  ts=$(date '+%Y%m%d-%H%M%S')
  cp -p "$MASTER" "$BACKUP_DIR/NAVIGATION-$ts.md"
fi

{
  echo "# XLR8ROS Navigation Tree"
  echo
  echo "Generated: $(date '+%Y-%m-%dT%H:%M:%S%z')"
  echo "Mode: normal"
  echo "Rule: .git/ is excluded from the normal navigation map. Other dotfiles/dotfolders remain visible unless explicitly excluded by Reg."
  echo
  cat "$candidate"
} > "$MASTER.tmp.$$"
mv "$MASTER.tmp.$$" "$MASTER"

backups=("$BACKUP_DIR"/NAVIGATION-*.md(N.om))
if (( ${#backups[@]} > BACKUP_KEEP )); then
  for old in "${backups[@]:$BACKUP_KEEP}"; do rm -f "$old"; done
fi

typeset -a DEST_DIRS
DEST_DIRS=("$XOS_ROOT" "$XOS_ROOT/HQ" "$XOS_ROOT/Agents" "$XOS_ROOT/Agents/Primary" "$XOS_ROOT/Agents/Secondary ")

while IFS= read -r gitdir; do
  repo="${gitdir%/.git}"
  DEST_DIRS+=("$repo")
  parent="$repo"
  while [[ "$parent" == "$XOS_ROOT"/* ]]; do
    parent="${parent:h}"
    [[ "$parent" == "$XOS_ROOT" ]] && break
    DEST_DIRS+=("$parent")
  done
done < <(find "$XOS_ROOT" -type d -name .git -prune -print 2>/dev/null)

if [[ -d "$CLONE_ROOT" ]]; then
  while IFS= read -r gitdir; do
    DEST_DIRS+=("${gitdir%/.git}")
  done < <(find "$CLONE_ROOT" -type d -name .git -prune -print 2>/dev/null)
fi

typeset -A seen
typeset -a updated failed
master_hash=$(shasum -a 256 "$MASTER" | awk '{print $1}')

for dir in "${DEST_DIRS[@]}"; do
  [[ -d "$dir" ]] || continue
  [[ -n "${seen[$dir]-}" ]] && continue
  seen[$dir]=1
  dest="$dir/NAVIGATION.md"
  tmp="$dir/.NAVIGATION.md.tmp.$$"
  if cp "$MASTER" "$tmp" && mv "$tmp" "$dest"; then
    hash=$(shasum -a 256 "$dest" | awk '{print $1}')
    if [[ "$hash" == "$master_hash" ]]; then
      updated+=("$dest")
    else
      failed+=("$dest")
    fi
  else
    rm -f "$tmp" 2>/dev/null || true
    failed+=("$dest")
  fi
done

echo "CHANGED: navigation structure changed."
echo "MASTER_SHA256=$master_hash"
echo "UPDATED_COUNT=${#updated[@]}"
echo "FAILED_COUNT=${#failed[@]}"
(( ${#failed[@]} == 0 ))
