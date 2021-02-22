#! /bin/bash

# Searches for scripts prefixed with install_toolname.sh within the tools directory
# and executes all of them. 
#
# Called by the Dockerfile when building the docker image.
this_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)"

# order matters!
${this_dir}/tools/install_cmake.sh || exit 1
${this_dir}/tools/install_gcc.sh || exit 1
