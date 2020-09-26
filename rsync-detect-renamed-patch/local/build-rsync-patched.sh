# Script from https://gist.github.com/albertomm/0b02a4169e89dafc8a87d923909566b6
wget https://download.samba.org/pub/rsync/rsync-3.1.2.tar.gz
wget https://download.samba.org/pub/rsync/rsync-patches-3.1.2.tar.gz

tar xzvf rsync-3.1.2.tar.gz
tar xzvf rsync-patches-3.1.2.tar.gz

cd rsync-3.1.2/

patch -p1 <patches/detect-renamed.diff

./configure
make
sudo make install

cd ..
sudo chown -R root:root rsync*
sudo mv rsync* /usr/local/src/
