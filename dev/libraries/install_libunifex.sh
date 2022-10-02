#! /bin/bash

set -o errexit
set -o pipefail
set -o nounset

# Install only library fmt

############################ Settings ################################
library_name="libunifex"
repo="https://github.com/facebookexperimental/libunifex"
branch="main"

num_threads="$(nproc)"
build_type="Release"
install_prefix="/usr/local"
######################################################################

echo "Installing ${library_name}"

clone_dir="/tmp/${library_name}"
[[ ! -d ${clone_dir} ]] && git clone -b ${branch} ${repo} ${clone_dir}

##################### Modify This Code As Necessary ##################
[[ ! -d ${clone_dir}/build ]] && mkdir -p ${clone_dir}/build 

cd ${clone_dir}/build

cmake \
    -DCMAKE_INSTALL_PREFIX="${install_prefix}" \
    -DCMAKE_BUILD_TYPE="${build_type}" \
    .. 

make -j${num_threads} install
######################################################################

rm -rf ${clone_dir}
