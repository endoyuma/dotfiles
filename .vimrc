set nocompatible
filetype off

if has('vim_starting')
  set nocompatible
  set runtimepath+=~/dotfiles/.vim/neobundle.vim/
end

call neobundle#begin(expand('~/dotfiles/.vim/bundle/'))

NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'altercation/vim-colors-solarized'

NeoBundleCheck
call neobundle#end()

filetype plugin indent on

set undolevels=100
set t_Co=256
set number
set ruler
set whichwrap=h,l
set tabstop=2
set softtabstop=2
set shiftwidth=2

colorscheme jellybeans

syntax on
let g:rehash256 = 1
set background=dark
