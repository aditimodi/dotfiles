# dotfiles

my zshrc file for macos

1. moved ~/.zshrc to .dotfiles/zshrc
2. created a symbolic link ln -s ~/.dotfiles/zshrc ~/.zshrc
3. git add zshrc and then git commit
4. added fzf. have to install it using fzf/install_fzf.sh 
5. added trash-cli package. Install it using trash/install_trash.sh
6. made an alias to rm command to avoid mistakes. Made a folder shell to keep shell specific scripts such as aliases.sh
7. source ~/.aliases.sh in bashrc 
