syntax on

filetype off




if has('vim_starting')
  set runtimepath+=~/.bundle/neobundle.vim
  call neobundle#rc(expand('~/.bundle'))
endif

NeoBundle 'git://github.com/vim-scripts/Zenburn.git'
NeoBundle 'git://github.com/tomasr/molokai.git'

filetype plugin on
filetype indent on

set undolevels=100

colorscheme molokai 
set t_Co=256

set tabstop=4
