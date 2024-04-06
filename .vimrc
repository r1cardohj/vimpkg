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
:colorscheme fruity
if has('gui_running')
    if has("win32") || has("win64")
        set guifont=Consolas:h18
    else
        set guifont=MiscFixed\ Semi-Condensed\ 10
    endif
endif
