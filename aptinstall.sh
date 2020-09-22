#!/bin/bash
sudo apt-get update && sudo apt-get upgrade -y

function install {
  command -v $1 &> /dev/null

  if [ $? -ne 0 ]; then             # $? is a special variable contains the exit status of previous command
    echo "Installing: ${1}..."
    sudo apt install -y $1
  else
    echo "Already installed: ${1}"
  fi
}

## Essentials
install build-essential;
install wget
install curl
install tmux
install tree
install git
install shellcheck;
install vim

## Gnome-Shell
install gnome-tweaks
install gnome-shell-extensions
install fonts-powerline
install chrome-gnome-shell
echo "chrome-gnome-shell is ready; install shell integration extension in chrome and start tweaking around"

## SSH
install openssh-server;
sudo systemctl status ssh;
sudo ufw allow ssh;
sudo systemctl enable ssh,

## Install using snap
sudo snap install acrordrdc
