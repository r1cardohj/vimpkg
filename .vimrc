" base with no plug --------------------------------------------------
set encoding=utf-8
set tabstop=4
syntax on
set nu
set showmatch
set cindent
set autoindent
set shiftwidth=4
set softtabstop=0              " 关闭softtabstop 永远不要将空格和tab混合输入
filetype plugin indent on
set completeopt=longest,menu
set nocompatible
set background=dark
set pumheight=10 " 设置补全菜单的高度为10行
" 颜色拉满
set t_Co=256
set updatetime=100
set signcolumn=yes

" set leader key
let mapleader = "\<space>"

"切换回车为补全
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" 补全结束后窗口自动消失

" tab split
nnoremap <leader>st :tab split<CR>
" close current tab
nnoremap <leader>ct :tabc <CR> 


"<Leader>[1-9] move to tab [1-9]
for s:i in range(1, 9)
  execute 'nnoremap <Leader>' . s:i . ' ' . s:i . 'gt'
endfor

augroup complete
  autocmd!
  autocmd CompleteDone * pclose
augroup end

if has('gui_running')
    if has("win32") || has("win64")
        set guifont=Consolas:h16
    else
        set guifont=MiscFixed\ Semi-Condensed\ 10
    endif
endif

" plug---------------------------------------------------------------
call plug#begin()
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'preservim/nerdtree'
  Plug 'noahfrederick/vim-hemisu'
  Plug 'tpope/vim-fugitive'
  Plug 'scrooloose/nerdcommenter' "快速注释
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-surround'
call plug#end()

colorscheme hemisu

" airline settings
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '>'
let g:airline_theme="tomorrow"
let g:airline#extensions#fugitive#enabled = 1

" NerdTree Settings-------------------------------------------------
augroup nerdtree_settings
  autocmd!
  map <leader>t :NERDTreeToggle<CR>
  nnoremap <leader>d :NERDTreeFind<cr>
  let NERDTreeShowHidden=2
    " 设置宽度
    let NERDTreeWinSize=30
    " 在终端启动vim时，共享NERDTree
    let g:nerdtree_tabs_open_on_console_startup=1
    " 忽略以下文件的显示
    let NERDTreeIgnore=['\.pyc','\~$',
                \ '\.swp',
                \ '\.o',
                \ '.DS_Store',
                \ '\.orig$',
                \ '@neomake_',
                \ '.coverage.',
                \ '.history',
                \ '__pycache__$[[dir]]',
                \ 'debug_json$[[dir]]',
                \ 'debug$[[dir]]',
                \ '.pytest_cache$[[dir]]',
                \ '.git$[[dir]]',
                \ '.idea[[dir]]',
                \ '.vscode[[dir]]',
                \ 'htmlcov[[dir]]',
                \ 'test-reports[[dir]]',
                \ '.egg-info$[[dir]]']
                " 显示书签列表
    let NERDTreeShowBookmarks=1
    " vim不指定具体文件打开时，自动使用nerdtree
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree |endif

    " 当vim打开一个目录时，nerdtree自动使用
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
    " 打开新的窗口，focus在buffer里而不是NerdTree里
    autocmd VimEnter * :wincmd l

    " 当vim中没有其他文件，值剩下nerdtree的时候，自动关闭窗口
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

augroup END
