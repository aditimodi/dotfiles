# tmux is installed following the blog https://jdhao.github.io/2018/10/16/tmux_build_without_roo#t_priviledge/

wget -c https://github.com/libevent/libevent/releases/download/release-2.1.11-stable/libevent-2.1.11-stable.tar.gz
tar zxvf libevent-2.1.11-stable.tar.gz
cd libevent-2.1.11-stable
mkdir -p $HOME/.local
# install libevent under $HOME/.local
./configure --prefix="$HOME/.local"
make -j 8 && make install

wget https://ftp.gnu.org/pub/gnu/ncurses/ncurses-6.2.tar.gz
tar zxvf ncurses-6.2.tar.gz
cd ncurses-6.2/
./configure --prefix="$HOME/.local"
make -j 8 && make install

wget https://github.com/tmux/tmux/releases/download/3.1b/tmux-3.1b.tar.gz
tar zxvf tmux-3.1b.tar.gz
cd tmux-3.1b
# the CPPFLAGS and LDFLAGS are important, make sure you have written them correctly, or the build will fail
./configure --prefix=$HOME/.local \
    CPPFLAGS="-I$HOME/.local/include -I$HOME/.local/include/ncurses" \
    LDFLAGS="-L$HOME/.local/lib"
make -j && make install

## add these to bashrc or zshrc 
export PATH="$HOME/.local/bin:$PATH"
export LD_LIBRARY_PATH="$HOME/.local/lib:$LD_LIBRARY_PATH"

