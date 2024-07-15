#!/bin/sh
# Copyright 2024 dah4k
# SPDX-License-Identifier: EPL-2.0

CAST_VERSION="v0.14.31"
CAST_SHA256="9c2db320ec2dc4436487b1342b358c4d32084e65816647d6f77b9506b9d21628"
CAST_DEB="cast-$CAST_VERSION-linux-amd64.deb"

curl --silent --location --remote-name "https://github.com/ekristen/cast/releases/download/$CAST_VERSION/$CAST_DEB"
echo "$CAST_SHA256  $CAST_DEB" | sha256sum --check - || exit 1
sudo dpkg --install $CAST_DEB
rm -f $CAST_DEB

## HACK: Installation process takes too long and causes Vagrant provision to timeout.
## Workaround is to install SIFT using a background process.
nohup sudo cast install teamdfir/sift-saltstack > install_sift.log 2>&1 </dev/null &
