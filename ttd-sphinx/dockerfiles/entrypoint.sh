#!/bin/sh
set -e


# Check if we have a index.rst, if not exit
file="/build/docs/index.rst"
if [ -f "$file" ]
then
    :
else
    printf "\\033[1;31mCan't detect a index.rst, please make sure you have one!\\033[0m\\n"
    printf "\\033[1;31mStopping now ...\\033[0m\\n"
    exit 1
fi


#exec su-exec $@
# Re-set permission to the `ttd` user
# This avoids permission denied if the data volume is mounted by root
chown -R ttd /build
exec su-exec ttd make "$@"

