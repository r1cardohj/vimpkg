" base with no plug
set tabstop=4
syntax on
set nu
set showmatch
set cindent
set autoindent
set shiftwidth=4
set softtabstop=4
filetype plugin indent on
set completeopt=longest,menu
set nocompatible
set background=dark
:colorscheme fruity
if has('gui_running')
    if has("win32") || has("win64")
        set guifont=Consolas:h18
    else
        set guifont=MiscFixed\ Semi-Condensed\ 10
    endif
endif

" plug
call plug#begin()
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
call plug#end()

" airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_theme='angr'
