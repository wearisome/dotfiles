#!/bin/bash

DOT_FILES=(init.vim .zshrc)

for file in ${DOT_FILES[@]}
do
  if [ "init.vim" = $file ]; then
    if [ -z $XDG_CONFIG_HOME ]; then
      export XDG_CONFIG_HOME=$LOCALAPPDATA
    fi
    if [ -z $XDG_CONFIG_HOME ]; then
      export XDG_CONFIG_HOME=$HOME/.config
    fi
    cp -f `dirname ${0}`/$file $XDG_CONFIG_HOME/nvim/init.vim
  elif
    cp -f `dirname ${0}`/$file $HOME/$file
  fi
done

# nvim settings
if [ ! -e $HOME'/.cache/dein' ]; then
  curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
  bash installer.sh $HOME'/.cache/dein'
fi

TOML_FILES=(dein.toml dein_lazy.toml)

for file in ${TOML_FILES[@]}
do
  if [ -z $XDG_CONFIG_HOME ]; then
    export XDG_CONFIG_HOME=$LOCALAPPDATA
  fi
  if [ -z $XDG_CONFIG_HOME ]; then
    export XDG_CONFIG_HOME=$HOME/.config
  fi
  cp -f `dirname ${0}`/$file $XDG_CONFIG_HOME/nvim/dein/toml/$file
done
