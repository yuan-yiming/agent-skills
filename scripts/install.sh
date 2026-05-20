#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SKILLS_SRC="$REPO_ROOT/skills"
SKILLS_DST="${TARGET_DIR:-${HOME}/.cursor/skills}"

mkdir -p "$SKILLS_DST"

install_skill() {
  local name="$1"
  local src="$SKILLS_SRC/$name"
  local dst="$SKILLS_DST/$name"

  if [[ ! -d "$src" ]]; then
    echo "Skill not found: $name" >&2
    exit 1
  fi
  if [[ ! -f "$src/SKILL.md" ]]; then
    echo "Invalid skill (missing SKILL.md): $name" >&2
    exit 1
  fi

  if [[ -d "$dst" ]]; then
    echo "Updating $name -> $dst"
    rm -rf "$dst"
  else
    echo "Installing $name -> $dst"
  fi

  cp -R "$src" "$dst"
}

if [[ $# -gt 0 ]]; then
  for name in "$@"; do
    [[ "$name" == "_template" ]] && continue
    install_skill "$name"
  done
else
  for dir in "$SKILLS_SRC"/*/; do
    name="$(basename "$dir")"
    [[ "$name" == "_template" ]] && continue
    install_skill "$name"
  done
fi

echo "Done. Skills installed to $SKILLS_DST"
