#!/usr/bin/env bash
set -euo pipefail

STATE_FILE="${1:?Usage: write-state.sh <relative-path>}"

if [[ "$STATE_FILE" == /* ]]; then
  echo "ERROR: Path must be relative (got: $STATE_FILE)" >&2
  exit 1
fi

if [[ "$STATE_FILE" == *".."* ]]; then
  echo "ERROR: Path traversal not allowed (got: $STATE_FILE)" >&2
  exit 1
fi

PARENT_DIR=$(dirname "$STATE_FILE")
mkdir -p "$PARENT_DIR"

TEMP_FILE=$(mktemp "${PARENT_DIR}/.write-state-XXXXXX")
trap 'rm -f "$TEMP_FILE"' EXIT

cat > "$TEMP_FILE"
mv "$TEMP_FILE" "$STATE_FILE"
trap - EXIT
