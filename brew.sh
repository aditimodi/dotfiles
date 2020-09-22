#!/bin/bash

## install homebrew and oh-my-zsh using homebrew_install.sh first
## function to check if command already exists else install
function install {
  command -v $1 &> /dev/null

  if [ $? -ne 0 ]; then             # $? is a special variable contains the exit status of previous command
    echo "Installing: ${1}..."
    brew install $1
  else
    echo "Already installed: ${1}"
  fi
}

function cask_install {
  command -v $1 &> /dev/null

  if [ $? -ne 0 ]; then             # $? is a special variable contains the exit status of previous command
    echo "Installing: ${1}..."
    brew cask install $1
  else
    echo "Already installed: ${1}"
  fi
}
install tree;
cask_install dropbox;
install tmux;
install zsh;
install python3;
install node;

## homebrew cash to innstall GUI macos applications
## browsers
cask_install google-chrome;

## Apps
cask_install zotero;
cask_install vlc;

## Code
install vim;
cask_install iterm2;
install shellcheck;
cask_install basictex;
sudo tlmgr install latexmk;    ## install latexmk to support vim-latex

