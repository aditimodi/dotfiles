## install command line fuzzy finder 
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

## install trash can 
git clone https://github.com/andreafrancia/trash-cli.git ~/.trash-cli
python setup.py ~/.trash-cli/install

## install tmux for aditya

shell_connection=(echo $SHELL_CONNECTION | awk '{print3}')
if [ shell_connection==10.4.9.104 ]; then
        bash tmux/install_tmux_aditya.sh
fi


