#!/bin/bash

DOT_FILES=(.vimrc)

for file in ${DOT_FILES[@]}
do
  cp -f $HOME/dotfiles/$file $HOME/$file
  if [ ".vimrc" = $file ]; then
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
