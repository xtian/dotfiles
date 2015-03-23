" A lot of this is taken from https://github.com/spf13/spf13-vim

set nocompatible

let mapleader = ";"

if filereadable(expand("~/.vimrc.vundle"))
    source ~/.vimrc.vundle
endif

autocmd BufNewFile,BufRead *.json            set ft=javascript
autocmd BufNewFile,BufRead *.md              set ft=markdown
autocmd BufNewFile,BufRead Gemfile,Guardfile set ft=ruby

autocmd FileType vim      setlocal sw=4 sts=4
autocmd FileType markdown setlocal spell textwidth=80

autocmd BufWritePre <buffer> call StripTrailingWhitespace()

syntax enable

filetype plugin indent on

set backspace=indent,eol,start
set cursorline
set encoding=utf-8
set history=1000
set hlsearch
set ignorecase
set incsearch
set nojoinspaces
set mouse=nv
set mousehide
set number
set numberwidth=5
set showcmd
set showmode
set smartcase
set switchbuf=useopen
set t_Co=256
set wrap linebreak textwidth=0

" Window splitting
set splitright
set splitbelow

" Indentation
set autoindent
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

" Keep lines around cursor
set scrolljump=5

" Highlight problematic whitespace
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

" Command line completion
set wildmenu
set wildmode=longest,list,full

" Hide search highlighting
noremap / :set hlsearch<CR>/
nmap <silent> <Leader><Leader> :set invhlsearch<CR>

" Navigate wrapped lines visually
noremap j gj
noremap k gk

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Quicker buffer navigation
noremap <Leader>b :bp<CR>
noremap <Leader>n :bn<CR>

noremap <Space> :

nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>

inoremap jj <Esc>
inoremap <C-c> <Esc>

cabbrev ag Ag

" Highlight 81st column
call matchadd("ColorColumn", "\%81v", 100)
hi ColorColumn ctermbg=red

" Strip whitespace
function! StripTrailingWhitespace()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " do the business:
    %s/\s\+$//e
    " clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

