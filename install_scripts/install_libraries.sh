#! /bin/bash

# Searches for scripts prefixed with install_libraryname.sh within the libraries directory
# and executes all of them. 
#
# Will also install any cmake/librarynameConfig.cmake files to their appropriate
# location.
#
# Called by the Dockerfile when building the docker image.

this_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)"

script_prefix="${this_dir}/libraries/install"

${script_prefix}_liburing.sh || exit 1
${script_prefix}_cppcoro.sh || exit 1
${script_prefix}_spdlog.sh || exit 1
