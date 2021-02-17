#! /bin/bash

# Installs any command line or development tools 
# that are used within the docker container. 

apt install -y \
    apt-utils \
    git \
    cmake \
    curl \
    vim \
    tmux \
    silversearcher-ag \
    htop \
    tree \
    openssh-server \
    openssh-client \
    bash-completion \
    python3-dev \
    python3-pip \
    build-essential \
    clang \
    clang-tidy \
    clang-format \
    clang-tools \
    gdb \
    g++ \
    gcc \
    bash-completion \
    flex \
    libmpc-dev \
    libgmp-dev \
    libmpfr-dev \
    libmbedtls-dev \
    libssl-dev \
    time 

 pip3 install conan

# Searches for scripts prefixed with install_toolname.sh within the tools directory
# and executes all of them. 
#
# Called by the Dockerfile when building the docker image.
this_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)"

${this_dir}/tools/install_cmake.sh
${this_dir}/tools/install_gcc.sh
