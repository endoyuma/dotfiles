syntax on
filetype off

if has('vim_starting')
  set runtimepath+=~/dotfiles/bundle/neobundle.vim
  call neobundle#rc(expand('~/dotfiles/bundle'))
endif

NeoBundle 'git://github.com/vim-scripts/Zenburn.git'
NeoBundle 'git://github.com/tomasr/molokai.git'

filetype plugin on
filetype indent on

set undolevels=100
set t_Co=256
set tabstop=4
				
colorscheme molokai
syntax on
let g:molokai_original = 1
let g:rehash256 = 1
set background=dark
