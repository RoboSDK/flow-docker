#! /bin/bash

set -o errexit
set -o pipefail
set -o nounset

# Install library liburing

############################ Settings ################################
library_name="liburing"
repo="https://github.com/axboe/liburing.git"
branch="master"

num_threads="8"
install_prefix="/usr/local"
######################################################################

this_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)"

echo "Installing ${library_name}"

clone_dir="/tmp/${library_name}"
[[ ! -d ${clone_dir} ]] && git clone -b ${branch} ${repo} ${clone_dir}

##################### Modify This Code As Necessary ##################
cd ${clone_dir}
./configure --prefix=${install_prefix}
make -j${num_threads}
make install
######################################################################

config_dir=/usr/local/lib/cmake/${library_name}
[[ ! -d "${config_dir}" ]] && mkdir -p ${config_dir}

cp ${this_dir}/cmake/${library_name}Config.cmake ${config_dir}
rm -rf ${clone_dir}
