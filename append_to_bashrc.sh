#!/bin/bash

if [ -f "$HOME/.bashrc" ]; then
	strng="source $BASEDIR/commonrc # dotfiles_appended"
		sed -i.bak '/dotfiles_appended/d' $HOME/.bashrc
    echo $strng >> $HOME/.bashrc
		echo "appended to bashrc"
  exit 0
fi

echo "No regular .bashrc file found in $HOME"
