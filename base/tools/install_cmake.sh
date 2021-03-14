#! /bin/bash

# Install cmake from source

############################ Settings ################################
name="cmake"
version="3.19.4"
url="https://github.com/Kitware/CMake/releases/download/v${version}/cmake-${version}.tar.gz"
######################################################################

echo "Installing ${name}"

cd /tmp
wget ${url}
tar xzf "cmake-${version}.tar.gz"
cd "/tmp/cmake-${version}"

##################### Modify This Code As Necessary ##################
./bootstrap
make -j4 install
######################################################################

rm -rf "/tmp/cmake-${version}*"
