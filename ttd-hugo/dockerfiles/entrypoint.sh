#!/bin/sh
set -e

# Re-set permission to the `ttd` user
# This avoids permission denied if the data volume is mounted by root
chown -R ttd /src
exec su-exec ttd hugo "$@"
