
## setup _________________________________

TMUX_VER=3.1b
LIBEVENT_VER=2.1.12-stable
TEMP_COMPILE=~/tmux-temp-compile
COMMON_INSTALL_PREFIX=/opt
SYMLINK=/usr/local/bin/tmux

## _______________________________________

echo
echo ">>> Creating and using temporary dir ${TEMP_COMPILE} for downloading and compiling libevent and tmux ..."
echo

mkdir ${TEMP_COMPILE}
cd ${TEMP_COMPILE}

echo
echo ">>> Downloading the releases ..."
echo
curl -OL https://github.com/tmux/tmux/releases/download/${TMUX_VER}/tmux-${TMUX_VER}.tar.gz
curl -OL https://github.com/libevent/libevent/releases/download/release-${LIBEVENT_VER}/libevent-${LIBEVENT_VER}.tar.gz

echo
echo ">>> Extracting tmux ${TMUX_VER} and libevent ${LIBEVENT_VER} ..."
echo

tar xzf tmux-${TMUX_VER}.tar.gz
tar xzf libevent-${LIBEVENT_VER}.tar.gz

echo
echo ">>> Compiling libevent ..."
echo

cd libevent-${LIBEVENT_VER}
#./configure --prefix=${COMMON_INSTALL_PREFIX}
./configure --prefix=${COMMON_INSTALL_PREFIX} CFLAGS="-I/usr/local/opt/openssl@1.1/include" LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
sudo make
sudo make install

echo
echo ">>> Compiling tmux ..."
echo

cd ../tmux-${TMUX_VER}
./configure --prefix=${COMMON_INSTALL_PREFIX} CFLAGS="-I/usr/local/opt/openssl@1.1/include" LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
sudo make
echo
echo ">>> Installing tmux in ${COMMON_INSTALL_PREFIX}/bin ..."
echo

sudo make install

echo
echo ">>> Symlink to it from ${SYMLINK} ..."
ln -s ${COMMON_INSTALL_PREFIX}/bin/tmux ${SYMLINK}

echo
echo ">>> Cleaning up by removing the temporary dir ${TEMP_COMPILE} ..."
echo

cd ..
sudo rm -rf ${TEMP_COMPILE}
