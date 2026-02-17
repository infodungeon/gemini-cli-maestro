#!/usr/bin/env bash
set -euo pipefail

STATE_DIR="${1:-.gemini}"

if [[ "$STATE_DIR" == /* ]]; then
  echo "ERROR: STATE_DIR must be a relative path within the project (got: $STATE_DIR)" >&2
  exit 1
fi

if [[ "$STATE_DIR" == *".."* ]]; then
  echo "ERROR: STATE_DIR must not contain path traversal components (got: $STATE_DIR)" >&2
  exit 1
fi

if [[ -L "$STATE_DIR" ]]; then
  echo "ERROR: STATE_DIR must not be a symlink (got: $STATE_DIR)" >&2
  exit 1
fi

DIRS=(
  "${STATE_DIR}/state"
  "${STATE_DIR}/state/archive"
  "${STATE_DIR}/plans"
  "${STATE_DIR}/plans/archive"
  "${STATE_DIR}/parallel"
)

for dir in "${DIRS[@]}"; do
  if ! mkdir -p "$dir" 2>/dev/null; then
    echo "ERROR: Failed to create directory: $dir" >&2
    echo "Check permissions on $(dirname "$dir")" >&2
    exit 1
  fi

  if [[ ! -w "$dir" ]]; then
    echo "ERROR: Directory not writable: $dir" >&2
    exit 1
  fi
done
