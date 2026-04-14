#!/usr/bin/env bash
# Symlinks tracked Claude Code config files from this repo into ~/.claude.
# Idempotent: safe to re-run. Existing symlinks are replaced; real files are
# backed up to <name>.bak before being overwritten.

set -euo pipefail

SRC_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEST_DIR="$HOME/.claude"

mkdir -p "$DEST_DIR"

# Each entry: a path relative to this directory that should appear at the
# same relative path inside ~/.claude.
TARGETS=(
  "settings.json"
  "statusline-command.sh"
  "agents"
  "hooks"
)

for target in "${TARGETS[@]}"; do
  src="$SRC_DIR/$target"
  dest="$DEST_DIR/$target"

  if [[ ! -e "$src" ]]; then
    echo "skip: $target (not in repo)"
    continue
  fi

  if [[ -L "$dest" ]]; then
    rm "$dest"
  elif [[ -e "$dest" ]]; then
    echo "backup: $dest -> $dest.bak"
    mv "$dest" "$dest.bak"
  fi

  ln -s "$src" "$dest"
  echo "linked: $dest -> $src"
done
