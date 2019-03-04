scriptencoding utf-8

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,cp932,utf-16le,euc-jp

"---------------------------------------------------------------------------
" 検索の挙動に関する設定:
"
" 検索時に大文字小文字を無視 (noignorecase:無視しない)
set ignorecase
" 大文字小文字の両方が含まれている場合は大文字小文字を区別
set smartcase

"---------------------------------------------------------------------------
" 編集に関する設定:
"
" タブの画面上での幅
set tabstop=2
" タブをスペースに展開しない (expandtab:展開する)
set expandtab
" 自動的にインデントする (noautoindent:インデントしない)
set autoindent
" バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start
" 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
set wrapscan
" 括弧入力時に対応する括弧を表示 (noshowmatch:表示しない)
set showmatch
" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set wildmenu
" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM

"---------------------------------------------------------------------------
" GUI固有ではない画面表示の設定:
"
" 行番号を非表示 (number:表示)
" set nonumber
set number
" ルーラーを表示 (noruler:非表示)
set ruler
" タブや改行を表示 (list:表示)
" set nolist
set nolist
" どの文字でタブや改行を表示するかを設定
"set listchars=tab:>-,extends:<,trail:-,eol:<
" 長い行を折り返して表示 (nowrap:折り返さない)
" set wrap
set wrap
" 常にステータス行を表示 (詳細は:he laststatus)
set laststatus=2
" コマンドラインの高さ (Windows用gvim使用時はgvimrcを編集すること)
set cmdheight=2
" コマンドをステータス行に表示
set showcmd
" タイトルを表示
set title
" 画面を黒地に白にする (次行の先頭の " を削除すれば有効になる)
"colorscheme evening " (Windows用gvim使用時はgvimrcを編集すること)


"---------------------------------------------------------------------------
" ファイル名に大文字小文字の区別がないシステム用の設定:
"   (例: DOS/Windows/MacOS)
"
if filereadable($VIM . '/vimrc') && filereadable($VIM . '/ViMrC')
  " tagsファイルの重複防止
  set tags=./tags,tags
endif

"---------------------------------------------------------------------------
" コンソールでのカラー表示のための設定(暫定的にUNIX専用)
if has('unix') && !has('gui_running')
  let s:uname = system('uname')
  if s:uname =~? "linux"
    set term=builtin_linux
  elseif s:uname =~? "freebsd"
    set term=builtin_cons25
  elseif s:uname =~? "Darwin"
    set term=beos-ansi
  else
    set term=builtin_xterm
  endif
  unlet s:uname
endif

"---------------------------------------------------------------------------
" コンソール版で環境変数$DISPLAYが設定されていると起動が遅くなる件へ対応
if !has('gui_running') && has('xterm_clipboard')
  set clipboard=exclude:cons\\\|linux\\\|cygwin\\\|rxvt\\\|screen
endif

"---------------------------------------------------------------------------
" プラットホーム依存の特別な設定

" WinではPATHに$VIMが含まれていないときにexeを見つけ出せないので修正
if has('win32') && $PATH !~? '\(^\|;\)' . escape($VIM, '\\') . '\(;\|$\)'
  let $PATH = $VIM . ';' . $PATH
endif

if has('mac')
  " Macではデフォルトの'iskeyword'がcp932に対応しきれていないので修正
  set iskeyword=@,48-57,_,128-167,224-235
endif

"----------------------------------------------------------------------------

" swapファイルの出力先を変更する
if has('win32')
  if !isdirectory($LOCALAPPDATA . '/Temp/vimfiles/swap')
    call mkdir($LOCALAPPDATA . '/Temp/vimfiles/swap', 'p')
  endif
  set directory=$LOCALAPPDATA/Temp/vimfiles/swap
else
  set noswapfile
endif

" backupファイルの出力先を変更する
if has('win32')
  if !isdirectory($LOCALAPPDATA . '/Temp/vimfiles/backup')
    call mkdir($LOCALAPPDATA . '/Temp/vimfiles/backup', 'p')
  endif
  set backupdir=$LOCALAPPDATA/Temp/vimfiles/backup
else
  set nobackup
endif

" viminfoファイルの出力先を変更する
if has('win32')
  if !has('nvim')
    if !isdirectory($LOCALAPPDATA . '/Temp/vimfiles/viminfo')
      call mkdir($LOCALAPPDATA. '/Temp/vimfiles/viminfo', 'p')
    endif
    set viminfo+=n$LOCALAPPDATA/Temp/vimfiles/viminfo/viminfo
  else
    if !isdirectory($LOCALAPPDATA . 'Temp/vimfiles/nviminfo')
      call mkdir($LOCALAPPDATA . '/Temp/vimfiles/nviminfo', 'p')
    endif
    set viminfo+=n$LOCALAPPDATA/Temp/vimfiles/nviminfo/viminfo
  endif
endif


" undoファイルの出力先を変更する
if has('win32')
  if !isdirectory($LOCALAPPDATA . '/Temp/vimfiles/undo')
    call mkdir($LOCALAPPDATA . '/Temp/vimfiles/undo', 'p')
  endif
  set undodir=$LOCALAPPDATA/Temp/vimfiles/undo
else
  set noundofile
endif

" XMLのタグ自動補完
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END

if has('nvim')
  let g:python3_host_prog = $LOCALAPPDATA . '/Programs/Python/Python37-32/python.exe'
  "dein Scripts-----------------------------
  if &compatible
    set nocompatible               " Be iMproved
  endif
  
  " Required:
  set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim
  
  " Required:
  if dein#load_state($HOME.'/.cache/dein')
    call dein#begin($HOME.'/.cache/dein')
  
    " Let dein manage dein
    " Required:
    call dein#add($HOME.'/.cache/dein/repos/github.com/Shougo/dein.vim')
  
    " Load toml
    if $XDG_CONFIG_HOME ==? ''
      let $XDG_CONFIG_HOME = $LOCALAPPDATA
    endif
    if $XDG_CONFIG_HOME ==? ''
      let $XDG_CONFIG_HOME = $HOME/.config
    endif
    let s:toml_dir = $XDG_CONFIG_HOME . '/nvim'
    let s:toml = s:toml_dir . '/dein.toml'
    let s:lazy_toml = s:toml_dir . '/dein_lazy.toml'
    if filereadable(s:toml)
      call dein#load_toml(s:toml, {'lazy': 0})
    endif
    if filereadable(s:lazy_toml)
      call dein#load_toml(s:lazy_toml, {'lazy': 1})
    endif
    " Add or remove your plugins here:
    call dein#add('Shougo/neosnippet.vim')
    call dein#add('Shougo/neosnippet-snippets')
    call dein#add('Shougo/deoplete.nvim')
    let g:deoplete#enable_at_startup = 1
  
    " You can specify revision/branch/tag.
    call dein#add('Shougo/deol.nvim', { 'rev': '01203d4c9' })
  
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

endif
