set nobackup
set noundofile
set noswapfile
set expandtab
set smarttab
set tabstop=2
set shiftwidth=2

let g:python3_host_prog = '/usr/bin/python3'

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/tomita.ryosuke/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/tomita.ryosuke/.cache/dein')
  call dein#begin('/home/tomita.ryosuke/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/home/tomita.ryosuke/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')
  let s:toml = '/home/tomita.ryosuke/.config/nvim/dein/toml/dein.toml'
  let s:toml_lazy = '/home/tomita.ryosuke/.config/nvim/dein/toml/dein_lazy.toml'

  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:toml_lazy, {'lazy': 1})

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------
