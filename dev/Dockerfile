FROM manuelmeraz/flow:base

# Disable Prompt During Packages Installation
ARG DEBIAN_FRONTEND=noninteractive

# Setup environment
USER root
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

################################# Start ##############################

# Copy the install scripts to install libraries
COPY libraries/ /tmp/libraries

RUN /tmp/libraries/install_liburing.sh
RUN /tmp/libraries/install_libunifex.sh
RUN /tmp/libraries/install_fmt.sh

# Make sure flow builds and run tests
WORKDIR tmp
RUN git clone --branch develop https://github.com/ManuelMeraz/flow.git 
RUN /tmp/flow/scripts/build.py --enable-testing
################################# End ##############################

# clean up
RUN rm -rf /tmp/flow
RUN rm -rf /tmp/libraries
