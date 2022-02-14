#!/usr/bin/env bash

unset -f build__coq
build__coq() {
    local IMAGE="coq"
    local BASE_TAG=$1
    local SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
    docker build \
        --no-cache \
        -f "${SCRIPT_DIR}/${IMAGE}/Dockerfile" \
        --build-arg BASE_TAG="${BASE_TAG}" \
        -t "appliedfm/${IMAGE}:${BASE_TAG}" \
        ${IMAGE}
}

unset -f build__coq_compcert
build__coq_compcert() {
    local IMAGE="coq-compcert"
    local BASE_TAG=$1
    local COMPCERT_VERSION=$2
    local SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
    docker build \
        --no-cache \
        -f "${SCRIPT_DIR}/${IMAGE}/Dockerfile" \
        --build-arg BASE_TAG="${BASE_TAG}" \
        --build-arg COMPCERT_VERSION="${COMPCERT_VERSION}" \
        -t "appliedfm/${IMAGE}:${BASE_TAG}--compcert-${COMPCERT_VERSION}" \
        ${IMAGE}
}

unset -f build__coq_vst
build__coq_vst() {
    local IMAGE="coq-vst"
    local BASE_TAG=$1
    local COMPCERT_VERSION=$2
    local VST_VERSION=$3
    local SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
    docker build \
        --no-cache \
        -f "${SCRIPT_DIR}/${IMAGE}/Dockerfile" \
        --build-arg BASE_TAG="${BASE_TAG}" \
        --build-arg COMPCERT_VERSION="${COMPCERT_VERSION}" \
        --build-arg VST_VERSION="${VST_VERSION}" \
        -t "appliedfm/${IMAGE}:${BASE_TAG}--vst-${VST_VERSION}--compcert-${COMPCERT_VERSION}" \
        ${IMAGE}
}

unset -f build__coq_vst_certigraph
build__coq_vst_certigraph() {
    local IMAGE="coq-vst-certigraph"
    local BASE_TAG=$1
    local COMPCERT_VERSION=$2
    local VST_VERSION=$3
    local CERTIGRAPH_VERSION=$3
    local SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
    docker build \
        --no-cache \
        -f "${SCRIPT_DIR}/${IMAGE}/Dockerfile" \
        --build-arg BASE_TAG="${BASE_TAG}" \
        --build-arg COMPCERT_VERSION="${COMPCERT_VERSION}" \
        --build-arg VST_VERSION="${VST_VERSION}" \
        -t "appliedfm/${IMAGE}:${BASE_TAG}--certigraph-${CERTIGRAPH_VERSION}--vst-${VST_VERSION}--compcert-${COMPCERT_VERSION}" \
        ${IMAGE}
}
