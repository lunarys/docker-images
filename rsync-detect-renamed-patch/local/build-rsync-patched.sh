#!/bin/bash
# Script edited from https://gist.github.com/albertomm/0b02a4169e89dafc8a87d923909566b6
RSYNC_VERSION=3.1.3

wget https://download.samba.org/pub/rsync/src/rsync-$RSYNC_VERSION.tar.gz
wget https://download.samba.org/pub/rsync/src/rsync-patches-$RSYNC_VERSION.tar.gz

tar xzvf rsync-$RSYNC_VERSION.tar.gz
tar xzvf rsync-patches-$RSYNC_VERSION.tar.gz

cd rsync-$RSYNC_VERSION/

patch -p1 <patches/detect-renamed.diff
patch -p1 <patches/detect-renamed-lax.diff

./configure
make
sudo make install

cd ..
sudo chown -R root:root rsync-$RSYNC_VERSION

[ -e "/usr/local/src/rsync-$RSYNC_VERSION" ] && sudo rm -rf "/usr/local/src/rsync-$RSYNC_VERSION"
sudo mv rsync-$RSYNC_VERSION /usr/local/src/
