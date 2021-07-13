#!/bin/bash
# ==============================================================================
# Copyright (C) 2020 Intel Corporation
#
# SPDX-License-Identifier: MIT
# ==============================================================================

BASE_DIR=$PWD
BUILD_DIR=$BASE_DIR/build
rm -rf ${BUILD_DIR}
mkdir -p ${BUILD_DIR}
cd ${BUILD_DIR}

if [ -f /etc/lsb-release ]; then
    cmake ${BASE_DIR}
else
    cmake3 ${BASE_DIR}
fi

make -j $(nproc)

cd ${BASE_DIR}

${BUILD_DIR}/classification_encode -i ${1} -j ${2} -k ${3}
