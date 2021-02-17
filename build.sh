#!/usr/bin/env bash

set -o nounset

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)"
source "${DIR}/docker-options"

docker build \
    --network=host \
    -t ${VARIANT}:${TAG} .
