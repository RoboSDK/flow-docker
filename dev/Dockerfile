FROM manuelmeraz/flow:base

# Disable Prompt During Packages Installation
ARG DEBIAN_FRONTEND=noninteractive

# Setup environment
USER root
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

################################# Start ##############################

# Make an install script directory in the root of the docker container
RUN mkdir -p /install_scripts

# Copy the local install scripts to /install_scripts within the docker container
COPY install_scripts/ /install_scripts/

RUN /install_scripts/install_tools.sh || exit 1
RUN /install_scripts/install_install_scripts.sh || exit 1

################################# End ##############################

ENTRYPOINT /bin/sh -c "while true; do sleep 10; done"