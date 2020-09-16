#!/bin/bash

command -v conda &> /dev/null && echo "miniconda already installed"|| (echo "Installing miniconda...."; ./install_miniconda.sh)

## install command line fuzzy finder 
command -v fzf &> /dev/null && echo "fzf already installed" || (git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf \
        && ~/.fzf/install)

## install trash can 
type trash-put &> /dev/null && echo "trash cli already installed" || (git clone https://github.com/andreafrancia/trash-cli.git \
        ~/.trash-cli && cd ~/.trash-cli && python setup.py install)

## install tmux for aditya
#if      [[ $HOSTNAME == *'iitmlogin'* ]]; then
        #bash tmux/install_tmux_aditya.sh
#else
        #echo $HOSTNAME: "this is not aditya HPC, hence skipping tmux installation"
#fi

