#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_DIR="$SCRIPT_DIR/skills"
TARGET_DIR="$HOME/.codex/skills"

if [[ ! -d "$SOURCE_DIR" ]]; then
  echo "Skills source folder not found: $SOURCE_DIR" >&2
  exit 1
fi

mkdir -p "$TARGET_DIR"

find "$SOURCE_DIR" -mindepth 1 -maxdepth 1 -type d | while IFS= read -r skill_dir; do
  skill_name="$(basename "$skill_dir")"
  rm -rf "$TARGET_DIR/$skill_name"
  cp -R "$skill_dir" "$TARGET_DIR/$skill_name"
  echo "Installed skill: $skill_name"
done

echo "Done. Restart Codex to reload the skills."
