#!/bin/bash
#
# This test script finds all Dockerfiles files in the project tree and
# runs hadolint against them.
# Ignore any `venv` directory.
#

# Fail on errors
set -e

# Vars
# Color
ESC_SEQ="\x1b["
COL_RESET=$ESC_SEQ"39;49;00m"
COL_YELLOW=$ESC_SEQ"33;01m"
COL_RED=$ESC_SEQ"31;01m"

# Ensure yamllint is present
if ! command -v docker >/dev/null 2>&1; then
  echo "The 'docker' command was not found in your PATH."
  echo -en "$COL_RED Please install docker!$COL_RESET\n"
  exit 1
fi

# Determine the absolute path of this script file's directory
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd -P)"
# The main project directory is one up from this script's directory, .ci/
PROJECT_DIR="$SCRIPT_DIR/.."


pushd "$PROJECT_DIR"
# Run hadolint against all 'Dockerfiles' files in the project directory.
#
# NOTE(@cpu): While tempting to -exec shellcheck directly from find this will
# eat-up any non-zero exit codes :-( Instead we find the files first and then
# xargs hadolint on the found files.
echo -en "$COL_YELLOW Running hadolint ...$COL_RESET\n"
find . -type f -name "Dockerfile" | while read txt; do
  echo "$txt";   # Do something else
  docker run --rm -i hadolint/hadolint hadolint --ignore DL3018 - < "$txt"
done
popd

