#!/bin/bash

DOT_FILES=(.vimrc)

for file in ${DOT_FILES[@]}
do
	ln -s $HOME/dotfiles/$file $HOME/$file
done

if [ ! -e $HOME/.cache/dein/repos/github.com/Shougo/deoplete.vim ]; then
	curl -fLo ~/vimfiles/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

