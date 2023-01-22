#!/usr/bin/env bash

# Set bash options.
set -Eeuo pipefail

# Include common vars and functions.
source "${SD_ROOT}/.lib.bash"

# If the directory that the target script is in has a .common.bash, source that
# too so that groups of commands can have shared vars/functions/etc.
if [ -e "${SD}/.common.bash" ]; then
    source "${SD}/.common.bash"
fi
