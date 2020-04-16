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
install -d "${INSTALL_DIR}/etc/p2p-tunnel"
install -d "${PREFIX}/lib/systemd/system/"
install -m 0755  p2p-tunnel "${PREFIX}/bin/"
install scripts/p2p-tunnel@.service "${PREFIX}/lib/systemd/system"

for TYPE in deb rpm pacman; do
    fpm -s dir -C "${INSTALL_DIR}" -a "${ARCH}" -t "${TYPE}" --name "${NAME}" --version "${VERSION}" --iteration 1 --description "${DESCRIPTION}" .
done