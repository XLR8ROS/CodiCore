#!/bin/zsh
set -euo pipefail

CLONE_ROOT="${XOS_GITHUB_ROOT:-$HOME/XOS-GitHub}"
SOURCE="${XOS_MEMORY_CONTRACT_SOURCE:-$CLONE_ROOT/XLR8ROS/xlr8ros-hq/Global Memory Contract.md}"
BACKUP_DIR="${XOS_MEMORY_CONTRACT_BACKUP_DIR:-$CLONE_ROOT/XLR8ROS/xlr8ros-hq/memory-contract-backups}"
CLONE_SCRIPT="${XOS_MEMORY_CONTRACT_CLONE_SCRIPT:-$CLONE_ROOT/XLR8ROS/CodiCore/tools/xos_clone_global_memory_contract.sh}"
MOTTO="Learn once, forget nothing, remember everything, because everything has value."

fail() { echo "ERROR: $*" >&2; exit 2; }

[[ -f "$SOURCE" ]] || fail "canonical source missing"
[[ -x "$CLONE_SCRIPT" ]] || fail "clone script missing or not executable"
[[ -d "$BACKUP_DIR" ]] || fail "backup directory missing"

current_hash=$(shasum -a 256 "$SOURCE" | awk '{print $1}')
candidate=""

for f in "$BACKUP_DIR"/Global-Memory-Contract-*.md(N.om); do
  [[ -f "$f" ]] || continue
  h=$(shasum -a 256 "$f" | awk '{print $1}')
  [[ "$h" == "$current_hash" ]] && continue
  size=$(wc -c < "$f" | tr -d ' ')
  (( size >= 1000 )) || continue
  [[ "$(head -n 1 "$f")" == "$MOTTO" ]] || continue
  [[ "$(awk 'NF{line=$0} END{print line}' "$f")" == "$MOTTO" ]] || continue
  candidate="$f"
  break
done

[[ -n "$candidate" ]] || fail "no distinct valid prior backup found"

ts=$(date '+%Y%m%d-%H%M%S')
cp -p "$SOURCE" "$BACKUP_DIR/Global-Memory-Contract-pre-rollback-$ts.md"
tmp="${SOURCE:h}/.Global Memory Contract.rollback.$$"
cp "$candidate" "$tmp"
candidate_hash=$(shasum -a 256 "$candidate" | awk '{print $1}')
tmp_hash=$(shasum -a 256 "$tmp" | awk '{print $1}')
[[ "$tmp_hash" == "$candidate_hash" ]] || fail "rollback temp hash mismatch"
mv "$tmp" "$SOURCE"

echo "ROLLBACK_SOURCE=$candidate"
echo "ROLLBACK_SHA256=$candidate_hash"
"$CLONE_SCRIPT"
