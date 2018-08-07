#!/bin/bash

DOT_FILES=(.vimrc)

if [ ! -e $HOME'/.cache/dein' ]; then
  curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
  bash installer.sh $HOME.'/.cache/dein'
fi

for file in ${DOT_FILES[@]}
do
  cp -f $HOME/dotfiles/$file $HOME/$file
  if [ ".vimrc" = $file ]; then
    cp -f $HOME/dotfiles/$file $HOME/_vsvimrc
    if [ -z $XDG_CONFIG_HOME ]; then
      export XDG_CONFIG_HOME=$LOCALAPPDATA
    fi
    if [ -z $XDG_CONFIG_HOME ]; then
      export XDG_CONFIG_HOME=$HOME/.config
    fi
    cp -f $HOME/dotfiles/$file $XDG_CONFIG_HOME/nvim/init.vim
  fi
done

TOML_FILES=(dein.toml dein_lazy.toml)
for file in ${TOML_FILES[@]}
do
  if [ -z $XDG_CONFIG_HOME ]; then
    export XDG_CONFIG_HOME=$LOCALAPPDATA
  fi
  if [ -z $XDG_CONFIG_HOME ]; then
    export XDG_CONFIG_HOME=$HOME/.config
  fi
  cp -f $HOME/dotfiles/$file $XDG_CONFIG_HOME/nvim/$file
done
