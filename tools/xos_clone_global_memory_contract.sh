#!/bin/zsh
set -euo pipefail

CLONE_ROOT="${XOS_GITHUB_ROOT:-$HOME/XOS-GitHub}"
SOURCE="${XOS_MEMORY_CONTRACT_SOURCE:-$CLONE_ROOT/XLR8ROS/xlr8ros-hq/Global Memory Contract.md}"
BACKUP_DIR="${XOS_MEMORY_CONTRACT_BACKUP_DIR:-$CLONE_ROOT/XLR8ROS/xlr8ros-hq/memory-contract-backups}"
BACKUP_KEEP="${XOS_MEMORY_CONTRACT_BACKUP_KEEP:-3}"
MOTTO="Learn once, forget nothing, remember everything, because everything has value."

typeset -a DESTS updated unchanged failed
DESTS=(
  "$CLONE_ROOT/reginaldberry02-sys/NexCore/Global Memory Contract.md"
  "$CLONE_ROOT/reginaldberry02-sys/AddisonCore/Global Memory Contract.md"
  "$CLONE_ROOT/reginaldberry02-sys/EddieCore/Global Memory Contract.md"
  "$CLONE_ROOT/XLR8ROS/CodiCore/Global Memory Contract.md"
  "$CLONE_ROOT/XLR8ROS/PaigeCore/Global Memory Contract.md"
)

fail() {
  echo "ERROR: $*" >&2
  exit 2
}

[[ -f "$SOURCE" ]] || fail "canonical source missing: $SOURCE"
[[ -r "$SOURCE" ]] || fail "canonical source unreadable: $SOURCE"
size=$(wc -c < "$SOURCE" | tr -d ' ')
(( size >= 1000 )) || fail "canonical source too small: ${size} bytes"
first=$(head -n 1 "$SOURCE")
last=$(awk 'NF{line=$0} END{print line}' "$SOURCE")
[[ "$first" == "$MOTTO" ]] || fail "canonical source opening motto mismatch"
[[ "$last" == "$MOTTO" ]] || fail "canonical source closing motto mismatch"

source_hash=$(shasum -a 256 "$SOURCE" | awk '{print $1}')
mkdir -p "$BACKUP_DIR"

latest_backup=("$BACKUP_DIR"/Global-Memory-Contract-*.md(N.om[1]))
if (( ${#latest_backup[@]} == 0 )) || ! cmp -s "$SOURCE" "$latest_backup[1]"; then
  ts=$(date '+%Y%m%d-%H%M%S')
  cp -p "$SOURCE" "$BACKUP_DIR/Global-Memory-Contract-$ts.md"
fi

backups=("$BACKUP_DIR"/Global-Memory-Contract-*.md(N.om))
if (( ${#backups[@]} > BACKUP_KEEP )); then
  for old in "${backups[@]:$BACKUP_KEEP}"; do rm -f "$old"; done
fi

for dest in "${DESTS[@]}"; do
  dir="${dest:h}"
  if [[ ! -d "$dir" ]]; then
    failed+=("$dest")
    echo "FAILED missing destination directory: $dir" >&2
    continue
  fi

  if [[ -f "$dest" ]]; then
    if ! chflags nouchg "$dest" 2>/dev/null; then
      failed+=("$dest")
      echo "FAILED could not unlock destination: $dest" >&2
      continue
    fi
  fi

  if [[ -f "$dest" ]] && cmp -s "$SOURCE" "$dest"; then
    if chflags uchg "$dest" && ls -lO "$dest" | grep -qw uchg; then
      unchanged+=("$dest")
    else
      failed+=("$dest")
      echo "FAILED could not relock unchanged destination: $dest" >&2
    fi
    continue
  fi

  tmp="$dir/.Global Memory Contract.md.tmp.$$"
  if cp "$SOURCE" "$tmp"; then
    tmp_hash=$(shasum -a 256 "$tmp" | awk '{print $1}')
    if [[ "$tmp_hash" == "$source_hash" ]] && mv "$tmp" "$dest"; then
      dest_hash=$(shasum -a 256 "$dest" | awk '{print $1}')
      if [[ "$dest_hash" == "$source_hash" ]] && chflags uchg "$dest" && ls -lO "$dest" | grep -qw uchg; then
        updated+=("$dest")
      else
        chflags uchg "$dest" 2>/dev/null || true
        failed+=("$dest")
        echo "FAILED hash or relock verification: $dest" >&2
      fi
    else
      rm -f "$tmp" 2>/dev/null || true
      chflags uchg "$dest" 2>/dev/null || true
      failed+=("$dest")
    fi
  else
    rm -f "$tmp" 2>/dev/null || true
    chflags uchg "$dest" 2>/dev/null || true
    failed+=("$dest")
  fi
done

echo "SOURCE=$SOURCE"
echo "SOURCE_SHA256=$source_hash"
echo "UPDATED_COUNT=${#updated[@]}"
echo "UNCHANGED_COUNT=${#unchanged[@]}"
echo "FAILED_COUNT=${#failed[@]}"

if (( ${#failed[@]} > 0 )); then
  printf 'FAILED=%s\n' "${failed[@]}" >&2
  exit 1
fi
