#!/bin/sh
set -e



#exec su-exec $@
# Re-set permission to the `sphinx` user
# This avoids permission denied if the data volume is mounted by root
chown -R ttduser /build
exec su-exec ttduser yamllint "$@"

