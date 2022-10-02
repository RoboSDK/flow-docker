FROM ubuntu:22.04

# Disable Prompt During Packages Installation
ARG DEBIAN_FRONTEND=noninteractive

# Setup environment
USER root
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

################################# Start ##############################

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
    bash-completion \
    flex \
    libmpc-dev \
    libgmp-dev \
    libmpfr-dev \
    libmbedtls-dev \
    libssl-dev \
    time \
    libxrender1 \
    libxi6 \
    libfreetype-dev \
    libxtst6 \
    x11-apps \
    && rm -rf /var/lib/apt/lists/* \
    || exit 1


# Copy the install scripts to install tools
COPY tools/ /tmp/tools
RUN /tmp/tools/install_cmake.sh

################################# End ##############################

# clean up
RUN rm -rf /tmp/tools
