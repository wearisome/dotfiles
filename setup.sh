#!/bin/bash

DOT_FILES=(.gvimrc)

for file in ${DOT_FILES[@]}
do
	ln -s $HOME/dotfiles/$file $HOME/$file
done

ln -s $HOME/dotfiles/init.vim $HOME/AppData/Local/nvim/init.vim

