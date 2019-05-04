" A lot of this is taken from:
"   - https://github.com/mathiasbynens/dotfiles
"   - https://github.com/spf13/spf13-vim
"   - https://github.com/thoughtbot/dotfiles

set nocompatible

let mapleader = "\<Space>"

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" Enable syntax highlighting
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif


" Automatically :write before running commands
set autowrite
" Allow backspace in insert mode
set backspace=2
" Use strong encryption algorithm
set cryptmethod=blowfish2
" Highlight current line
set cursorline
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Allow cursor keys in insert mode
set esckeys
" Add the g flag to search/replace by default
set gdefault
" Allow hidden buffers
set hidden
" Set history limit
set history=50
" Enable case-insensitive search
set ignorecase
set smartcase
" Highlight dynamically as pattern is typed
set incsearch
" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·
" Enable mouse in all modes
set mouse=a
" Hide the mouse cursor while typing
set mousehide
" Enable line numbers
set number
set numberwidth=5
" Bind paste mode
set pastetoggle=<F12>
" Keep lines around cursor
set scrolljump=5
" Show the (partial) command as it’s being typed
set showcmd
" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright
" Don't open duplicate buffers
set switchbuf=useopen
" Enable 256 colors
set t_Co=256
set termguicolors
" Show the filename in the window titlebar
set title
" Optimize for fast terminal connections
set ttyfast
" Allow for cursor beyond last character
set virtualedit=onemore
" Enhance command line completion
set wildmenu
set wildmode=longest:list,full

" Indentation
set autoindent
set expandtab
set shiftround
set shiftwidth=2
set tabstop=2

" Disable backup files
set nobackup
set nowritebackup
set noswapfile
" Use one space, not two, after punctuation.
set nojoinspaces

" Save file
nnoremap <Leader>s :w<CR>

" Quicker buffer navigation
noremap <Leader>b :bp<CR>
noremap <Leader>d :bd<CR>
noremap <Leader>n :bn<CR>

" Some Emacs bindings
inoremap <C-a> <Home>
inoremap <C-b> <Left>
inoremap <C-c> <Esc>
inoremap <C-e> <End>
inoremap <C-f> <Right>
inoremap <C-n> <Down>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Switch between the last two files
nnoremap <Leader><Leader> <C-^>

" Navigate wrapped lines visually
noremap j gj
noremap k gk

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<Tab>"
    else
        return "\<C-p>"
    endif
endfunction
inoremap <Tab> <C-r>=InsertTabWrapper()<CR>
inoremap <S-Tab> <C-n>

" Strip trailing whitespace
function! StripWhitespace()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  :%s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction


if has("autocmd")
  " Always switch to the current file directory
  autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif

  " Don't automatically expand comment blocks
  autocmd FileType * setlocal formatoptions-=r formatoptions-=o

  autocmd BufRead,BufNewFile .{jscs,jshint,eslint}rc set filetype=json
  autocmd BufNewFile,BufRead *.md set filetype=markdown
  autocmd BufNewFile,BufRead Gemfile,Guardfile set filetype=ruby

  autocmd BufWritePre <buffer> call StripWhitespace()
end

