#!/bin/sh
set -eo pipefail


exec ansible-lint --force-color "$@"

