#! /bin/bash

# Install only library spdlog

############################ Settings ################################
library_name="spdlog"
repo="https://github.com/gabime/spdlog.git"
branch="v1.8.2"
######################################################################

echo "Installing ${library_name}"

clone_dir="/tmp/${library_name}"
[[ ! -d ${clone_dir} ]] && git clone -b ${branch} ${repo} ${clone_dir}

##################### Modify This Code As Necessary ##################
[[ ! -d ${clone_dir}/build ]] && mkdir -p ${clone_dir}/build && cd ${clone_dir}/build
cmake -DCMAKE_BUILD_TYPE=Release .. && make -j install || exit 1
######################################################################

rm -rf ${clone_dir}
