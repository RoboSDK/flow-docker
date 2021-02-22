FROM ubuntu:20.04

# Disable Prompt During Packages Installation
ARG DEBIAN_FRONTEND=noninteractive

# Setup environment
USER root
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

################################# Start ##############################

# Make an install script directory in the root of the docker container
RUN mkdir -p /install_scripts

RUN apt update \
    && apt upgrade -y \
    && apt install -y \
    sudo \
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
    time \
    && rm -rf /var/lib/apt/lists/* \
    || exit 1

RUN pip3 install conan || exit 1

################################# End ##############################

ENTRYPOINT /bin/sh -c "while true; do sleep 10; done"
