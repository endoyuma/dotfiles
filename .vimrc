syntax enable
filetype off

if has('vim_starting')
  set nocompatible
  set runtimepath+=~/dotfiles/bundle/neobundle.vim/
end

filetype plugin on
filetype indent on

set undolevels=100
set t_Co=256
set number
set ruler
set whichwrap=h,l
set tabstop=2
set softtabstop=2
set shiftwidth=2

colorscheme solalized
syntax on
let g:molokai_original = 1
let g:rehash256 = 1
set background=dark
