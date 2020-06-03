#!/usr/bin/env bash

MASON_NAME=enet
MASON_VERSION=1.3.15
MASON_HEADER_ONLY=true
MASON_PKGCONFIG_FILE=libenet.pc

. ${MASON_DIR}/mason.sh

function mason_load_source {
    mason_download \
        https://github.com/lsalzman/enet/archive/v${MASON_VERSION}.tar.gz \
        6ab1bf77c0c30b97c740e209bbc728010b80cefb

    mason_extract_tar_gz

    export MASON_BUILD_PATH=${MASON_ROOT}/.build/enet-${MASON_VERSION}
}

function mason_compile {
    autoreconf -i && ./configure && make && make install
}

function mason_cflags {
    echo "-I${MASON_PREFIX}/include"
}

function mason_clean {
    make clean
}

mason_run "$@"
