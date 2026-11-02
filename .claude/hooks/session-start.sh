#!/bin/bash
set -euo pipefail

# Only run in remote (cloud) Claude Code environments
if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

cd "${CLAUDE_PROJECT_DIR:-.}"

# This project is a static HTML site with no local dependencies.
# Verify the main file is present so the session has a clear working baseline.
if [ ! -f "index.html" ]; then
  echo "WARNING: index.html not found in $PWD" >&2
fi
