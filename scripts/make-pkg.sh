#!/bin/sh
set -xe

NAME=${NAME:-"p2p-tunnel"}
VERSION=${VERSION:-$(git describe --tags)}
ARCH=${ARCH:-$(dpkg --print-architecture)}
DESCRIPTION=${DESCRIPTION:-"Peer-to-Peer tunneling"}
INSTALL_DIR=${INSTALL_DIR:-.package}
PREFIX="${INSTALL_DIR}/usr"

mkdir -p "${PREFIX}"
install -d "${PREFIX}/bin"
install -m -0755  p2p-tunnel "${PREFIX}/bin/"

for TYPE in deb rpm pacman; do
    fpm -s dir -C "${INSTALL_DIR}" -t "${TYPE}" --name "${NAME}" --version "${VERSION}" --iteration 1 --description "${DESCRIPTION}" .
done