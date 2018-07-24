#!/bin/bash

DOT_FILES=()

for file in ${DOT_FILES[@]}
do
	ln -s $HOME/dotfiles/$file $HOME/$file
done

if [ ! -e $HOME/AppData/Local/nvim/.cache/dein ]; then
		git clone https://github.com/Shougo/dein.vim $HOME/.config/nvim/.cache/dein/repos/github.com/Shougo/dein.vim
fi

ln -s $HOME/dotfiles/init.vim $HOME/.config/nvim/init.vim

