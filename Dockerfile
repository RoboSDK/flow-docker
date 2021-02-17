FROM ubuntu:20.04

# Disable Prompt During Packages Installation
ARG DEBIAN_FRONTEND=noninteractive

# Setup environment
USER root
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

RUN apt update && apt upgrade -y
RUN apt install -y sudo

################################# Start ##############################

# Make an install script directory in the root of the docker container
RUN mkdir -p /install_scripts

# Copy the local install scripts to /install_scripts within the docker container
COPY install_scripts/ /install_scripts/

RUN /install_scripts/install_tools.sh
RUN /install_scripts/install_libraries.sh

################################# End ##############################

ENTRYPOINT /bin/sh -c "while true; do sleep 10; done"
