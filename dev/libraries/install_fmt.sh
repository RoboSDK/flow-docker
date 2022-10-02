#! /bin/bash

set -o errexit
set -o pipefail
set -o nounset

# Install only library fmt

############################ Settings ################################
library_name="fmt"
repo="https://github.com/fmtlib/fmt.git"
branch="master"

num_threads="8"
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
