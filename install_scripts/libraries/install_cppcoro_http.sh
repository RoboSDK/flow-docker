#! /bin/bash

# Install library cppcoro-http

############################ Settings ################################
library_name="cppcoro-http"
repo="https://github.com/Garcia6l20/cppcoro-http.git"
branch="master"
######################################################################

echo "Installing ${library_name}"

clone_dir="/tmp/${library_name}"
git clone -b ${branch} ${repo} ${clone_dir}

##################### Modify This Code As Necessary ##################
mkdir -p ${clone_dir}/build && cd ${clone_dir}/build
cmake -DCMAKE_BUILD_TYPE=Release .. 
make -j install
######################################################################

rm -rf ${clone_dir}
