#!/bin/zsh
set -euo pipefail

XOS_ROOT="${XOS_ROOT:-$HOME/Library/Mobile Documents/com~apple~CloudDocs/XLR8ROS}"
CLONE_ROOT="${XOS_GITHUB_ROOT:-$HOME/XOS-GitHub}"
HQ_REPO="${XOS_HQ_REPO:-$CLONE_ROOT/XLR8ROS/xlr8ros-hq}"
MASTER="${XOS_NAV_MASTER:-$HQ_REPO/Navigation/NAVIGATION.md}"
BACKUP_DIR="${XOS_NAV_BACKUP_DIR:-$HQ_REPO/Navigation/backups}"

fail() { echo "ERROR: $*" >&2; exit 2; }
valid_nav() {
  local f="$1"
  [[ -f "$f" ]] || return 1
  (( $(wc -c < "$f" | tr -d ' ') >= 200 )) || return 1
  [[ "$(head -n 1 "$f")" == "# XLR8ROS Navigation Tree" ]] || return 1
  grep -q '^XLR8ROS/$' "$f"
}

valid_nav "$MASTER" || fail "current navigation master invalid"
[[ -d "$BACKUP_DIR" ]] || fail "backup directory missing"

current_hash=$(shasum -a 256 "$MASTER" | awk '{print $1}')
candidate=""
for f in "$BACKUP_DIR"/NAVIGATION-*.md(N.om); do
  valid_nav "$f" || continue
  h=$(shasum -a 256 "$f" | awk '{print $1}')
  [[ "$h" == "$current_hash" ]] && continue
  candidate="$f"
  break
done
[[ -n "$candidate" ]] || fail "no distinct valid prior backup found"

ts=$(date '+%Y%m%d-%H%M%S')
cp -p "$MASTER" "$BACKUP_DIR/NAVIGATION-pre-rollback-$ts.md"
tmp="${MASTER:h}/.NAVIGATION.rollback.$$"
cp "$candidate" "$tmp"
candidate_hash=$(shasum -a 256 "$candidate" | awk '{print $1}')
[[ "$(shasum -a 256 "$tmp" | awk '{print $1}')" == "$candidate_hash" ]] || fail "rollback temp hash mismatch"
mv "$tmp" "$MASTER"

typeset -a DEST_DIRS updated failed
DEST_DIRS=("$XOS_ROOT" "$XOS_ROOT/HQ" "$XOS_ROOT/Agents" "$XOS_ROOT/Agents/Primary" "$XOS_ROOT/Agents/Secondary")

if [[ -d "$XOS_ROOT" ]]; then
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
fi

if [[ -d "$CLONE_ROOT" ]]; then
  while IFS= read -r gitdir; do
    DEST_DIRS+=("${gitdir%/.git}")
  done < <(find "$CLONE_ROOT" -type d -name .git -prune -print 2>/dev/null)
fi

typeset -A seen
for dir in "${DEST_DIRS[@]}"; do
  [[ -d "$dir" ]] || continue
  [[ -n "${seen[$dir]-}" ]] && continue
  seen[$dir]=1
  dest="$dir/NAVIGATION.md"
  tmpdest="$dir/.NAVIGATION.md.rollback.$$"
  if cp "$MASTER" "$tmpdest" && [[ "$(shasum -a 256 "$tmpdest" | awk '{print $1}')" == "$candidate_hash" ]] && mv "$tmpdest" "$dest"; then
    [[ "$(shasum -a 256 "$dest" | awk '{print $1}')" == "$candidate_hash" ]] && updated+=("$dest") || failed+=("$dest")
  else
    rm -f "$tmpdest" 2>/dev/null || true
    failed+=("$dest")
  fi
done

echo "ROLLBACK_SOURCE=$candidate"
echo "ROLLBACK_SHA256=$candidate_hash"
echo "UPDATED_COUNT=${#updated[@]}"
echo "FAILED_COUNT=${#failed[@]}"
(( ${#failed[@]} == 0 ))
