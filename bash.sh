#!/usr/bin/env bash

# read the default options
this_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
source "${this_dir}/docker-options"

docker exec -w ${this_dir}  -it ${DOCKER_NAME} bash 
[[ ! $? -eq 0 ]] && docker exec -it ${DOCKER_NAME} bash
