#!/usr/bin/env bash

set -o nounset
set -o errexit

image_dir=$1

source "${image_dir}/docker-options"

docker build \
    --network=host \
    -t ${VARIANT}:${TAG} ${image_dir}
