#!/usr/bin/env bash

# Exit immediately if a command fails.
set -o errexit

# Exit immediately if a variable is used but not defined.
set -o nounset

# Exit when any command in a pipeline fails.
set -o pipefail

# Allow people to `export TRACE=1` to enable bash tracing.
if [[ "${TRACE-0}" == "1" ]]; then
    set -o xtrace
fi

# Include common vars and functions.
source "${SD_ROOT}/.lib.bash"

# If the directory that the target script is in has a .common.bash, source that
# too so that groups of commands can have shared vars/functions/etc.
if [ -e "${SD}/.common.bash" ]; then
  source "${SD}/.common.bash"
fi
