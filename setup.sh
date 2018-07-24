#!/bin/bash

DOT_FILES=(.gvimrc)

for file in ${DOT_FILES[@]}
do
	ln -s $HOME/dotfiles/$file $HOME/$file
done

if [ ! -e $HOME/.cache/dein/repos/github.com/Shougo/dein.vim ]; then
	git clone https://github.com/Shougo/dein.vim $HOME/.cache/dein/repos/github.com/Shougo/dein.vim
fi
if [ ! -e $HOME/.cache/dein/repos/github.com/Shougo/deoplete.vim ]; then
	git clone https://github.com/Shougo/dein.vim $HOME/.cache/dein/repos/github.com/Shougo/deoplete.vim
fi

