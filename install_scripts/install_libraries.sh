#! /bin/bash

# Searches for scripts prefixed with install_libraryname.sh within the libraries directory
# and executes all of them. 
#
# Will also install any cmake/librarynameConfig.cmake files to their appropriate
# location.
#
# Called by the Dockerfile when building the docker image.

this_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)"

install_library_scripts=$(ls ${this_dir}/libraries | grep install_)

for script in ${install_library_scripts}; do
    ${this_dir}/libraries/${script}
done

cmake_config_files=$(ls ${this_dir}/libraries/cmake | grep Config.cmake)

for config in ${cmake_config_files}; do
    library_name=$(echo ${config} | awk -F Config.cmake '{print $1}')
    config_dir="/usr/local/lib/cmake/${library_name}" 

    [[ ! -d "${config_dir}" ]] && mkdir ${config_dir}
    cp "${this_dir}/libraries/cmake/${config}" ${config_dir}
done
