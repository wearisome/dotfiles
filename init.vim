let $MY_VIMRUNTIME = $LOCALAPPDATA.'/nvim'

if &compatible
  set nocompatible
endif

" Add the dein installation directory into runtimepath
set runtimepath+=$MY_VIMRUNTIME/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('$MY_VIMRUNTIME/.cache/dein')
 call dein#begin('$MY_VIMRUNTIME/.cache/dein')

 call dein#add('$MY_VIMRUNTIME/.cache/dein')
 call dein#add('Shougo/deoplete.nvim')
 if !has('nvim')
   call dein#add('roxma/nvim-yarp')
   call dein#add('roxma/vim-hug-neovim-rpc')
 endif

 call dein#end()
 call dein#save_state()
endif

filetype plugin indent on
syntax enable
