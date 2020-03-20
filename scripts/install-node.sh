#!/bin/bash

set -e

if [ -f $APP_SOURCE_DIR/launchpad.conf ]; then
  source <(grep NODE_VERSION $APP_SOURCE_DIR/launchpad.conf)
fi

printf "\n[-] Installing Node ${NODE_VERSION}...\n\n"

NODE_DIST="node-v${NODE_VERSION}-linux-x64"
NODE_URL="https://nodejs.org/dist/v${NODE_VERSION}/${NODE_DIST}.tar.gz"

printf "\nNode URL: ${NODE_URL}\n"

cd /tmp
curl -v -O -L ${NODE_URL}
tar xvzf ${NODE_DIST}.tar.gz
rm ${NODE_DIST}.tar.gz
rm -rf /opt/nodejs
mv ${NODE_DIST} /opt/nodejs

ln -sf /opt/nodejs/bin/node /usr/bin/node
ln -sf /opt/nodejs/bin/npm /usr/bin/npm
