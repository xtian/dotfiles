set nocompatible
call pathogen#infect()

syntax enable
autocmd BufNewFile,BufRead *.json set ft=javascript

set encoding=utf-8
set showcmd
filetype plugin indent on

set wrap linebreak textwidth=0
set colorcolumn=80
set tabstop=4 shiftwidth=4
set softtabstop=4
set expandtab
set backspace=indent,eol,start
set hlsearch
set incsearch
set ignorecase
set smartcase
set mouse=nv
set wildmenu
set wildmode=longest,list,full

set number

noremap <Space> :
inoremap <c-Space> <esc>
inoremap <c-@> <esc>

set t_Co=256
colors molokai
hi ColorColumn ctermbg=black
