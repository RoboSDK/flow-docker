#! /usr/bin/env bash

cd /tmp || exit 1
git clone 
cd liburing || exit 1
rm -rf /tmp/liburing

#! /bin/bash

# Install header only library liburing

############################ Settings ################################
library_name="liburing"
repo="https://github.com/axboe/liburing.git"
branch="master"
######################################################################

echo "Installing ${library_name}"

clone_dir="/tmp/${library_name}"
git clone -b ${branch} ${repo} ${clone_dir}

##################### Modify This Code As Necessary ##################
mkdir -p ${clone_dir}/build && cd ${clone_dir}/build
../configure
make -j install
######################################################################

rm -rf ${clone_dir}
