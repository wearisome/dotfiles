#!/bin/bash

DOT_FILES=(.vimrc)

for file in ${DOT_FILES[@]}
do
	ln -s $HOME/dotfiles/$file $HOME/$file
done

if [ ! -e $HOME/vimfiles/autoload/plug.vim ]; then
	mkdir -p $HOME/vimfiles/autoload
	curl -fLo ~/vimfiles/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

