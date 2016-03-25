set nocompatible
filetype off

if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.dotfiles/.vim/neobundle.vim/
end

if has('persistent_undo')      "check if your vim version supports it
  set undofile                 "turn on the feature  
  set undodir=$HOME/.vim/undo  "directory where the undo files will be stored
  endif     

call neobundle#begin(expand('~/.dotfiles/.vim/bundle/'))

NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'tomasr/molokai'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'vim-scripts/AnsiEsc.vim'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'Shougo/neocomplete.vim'


NeoBundleCheck
call neobundle#end()

let g:indent_guides_enable_on_vim_startup = 1
let g:unite_enable_start_insert=1
noremap <C-P> :Unite buffer<CR>
noremap <C-N> :Unite -buffer-name=file file<CR>
noremap <C-Z> :Unite file_mru<CR>
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

autocmd QuickFixCmdPost *grep* cwindow
set statusline+=%{fugitive#statusline()}

function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme * call ZenkakuSpace()
        autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
    augroup END
    call ZenkakuSpace()
endif


set completeopt=menuone
for k in split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_",'\zs')
    exec "imap <expr> " . k . " pumvisible() ? '" . k . "' : '" . k . "\<C-X>\<C-P>\<C-N>'"
  endfor

if neobundle#tap('neocomplete')
  call neobundle#config({
  \   'depends': ['Shougo/context_filetype.vim', 'ujihisa/neco-look', 'pocke/neco-gh-issues', 'Shougo/neco-syntax'],
  \ })

  let g:neocomplete#enable_at_startup = 1
  let g:neocomplete#enable_smart_case = 1
  let g:neocomplete#enable_underbar_completion = 1
  let g:neocomplete#enable_camel_case_completion  =  1
  let g:neocomplete#max_list = 20
  let g:neocomplete#sources#syntax#min_keyword_length = 3
  let g:neocomplete#auto_completion_start_length = 2
  let g:neocomplete#enable_auto_close_preview = 0
  AutoCmd InsertLeave * silent! pclose!

  let g:neocomplete#max_keyword_width = 10000


  if !exists('g:neocomplete#delimiter_patterns')
    let g:neocomplete#delimiter_patterns= {}
  endif
  let g:neocomplete#delimiter_patterns.ruby = ['::']

  if !exists('g:neocomplete#same_filetypes')
    let g:neocomplete#same_filetypes = {}
  endif
  let g:neocomplete#same_filetypes.ruby = 'eruby'


  if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
  endif

  let g:neocomplete#force_omni_input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
  let g:neocomplete#force_omni_input_patterns.typescript = '[^. \t]\.\%(\h\w*\)\?' " Same as JavaScript
  let g:neocomplete#force_omni_input_patterns.go = '[^. \t]\.\%(\h\w*\)\?'         " Same as JavaScript

  let s:neco_dicts_dir = $HOME . '/dicts'
  if isdirectory(s:neco_dicts_dir)
    let g:neocomplete#sources#dictionary#dictionaries = {
    \   'ruby': s:neco_dicts_dir . '/ruby.dict',
    \   'javascript': s:neco_dicts_dir . '/jquery.dict',
    \ }
  endif
  let g:neocomplete#data_directory = $HOME . '/.vim/cache/neocomplete'

  call neocomplete#custom#source('look', 'min_pattern_length', 1)

  call neobundle#untap()
endif

let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'

if has('syntax')
  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction


imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>





filetype plugin indent on

set undolevels=100
set t_Co=256
set number
set ruler
set whichwrap=h,l
set tabstop=2
set autoindent
set expandtab
set softtabstop=2
set shiftwidth=2

syntax enable
colorscheme molokai

syntax on
let g:rehash256 = 1

