call plug#begin('~/.vim/plugged')
Plug 'w0ng/vim-hybrid'
Plug 'pangloss/vim-javascript'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'othree/jspc.vim'
Plug 'elzr/vim-json'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'ternjs/tern_for_vim'
call plug#end()

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

set number
set nowrap
set showmatch
set visualbell

set hlsearch
set smartcase
set ignorecase
set incsearch

set autoindent
set expandtab
set shiftwidth=2
set smartindent
set smarttab
set softtabstop=2

set ruler
set undolevels=1000
set backspace=indent,eol,start

filetype plugin indent on
set cursorline
set wildmenu
set lazyredraw

syntax enable
set background=dark
silent! colorscheme hybrid
