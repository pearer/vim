" vundle installation
"-----------------------------------------------------------
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"-----------------------------------------------------------
" fonts patching
" https://github.com/Lokaltog/vim-powerline/tree/develop/fontpatcher
" https://github.com/powerline/fonts
"-----------------------------------------------------------
" vundle configuration
"-----------------------------------------------------------
set nocompatible                   " be iMproved, required
filetype off                       " required
set rtp+=~/.vim/bundle/Vundle.vim  " set the runtime path
call vundle#begin()
"-----------------------------------------------------------
Plugin 'VundleVim/Vundle.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'tomasr/molokai'
Plugin 'sickill/vim-monokai'
Plugin 'scrooloose/nerdTree'
Plugin 'christianrondeau/vim-base64'
Plugin 'fatih/vim-go'
Plugin 'morhetz/gruvbox'
Plugin 'taohex/lightline-buffer'
"-----------------------------------------------------------
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"-----------------------------------------------------------
set encoding=utf-8
scriptencoding utf-8         " script encoding
set mousehide                " hide mouse while typing
set laststatus=2             " show line
set encoding=utf-8           " default encoding
set number                   " show line numbers
set mouse+=a                 " dont copy line numbers
set guioptions-=m            " remove menu bar
set guioptions-=T            " remove toolbar
set guioptions-=r            " remove right-hand scroll bar
set guioptions-=L            " remove left-hand scroll bar
set autoindent               " autoindent
set hlsearch                 " highligh search
set incsearch                " show search text immideately
set nowrapscan               " stop search at the end of file
set ignorecase               " ignore match case
set cursorline               " highlight current line
set expandtab                " replace tab with spaces
set smarttab                 " smart tabbing
set shiftwidth=4             " 4 space for tab
set tabstop=4                " tab size
set autoindent               " autoindenting for new line
set smartindent              " smart autoindent
set undofile                 " use undo history
set undodir=~/.vim/undo/     " undo dir
set nobackup                 " disable backup
set noswapfile               " disable swap files
set nowritebackup            " do not make backup file while editing
set linespace=0              " set spaces between lines
set mousemodel=popup         " show popup menu at mouse click
set background=dark          " dark background
syntax enable                " enable syntax
set nowrap                   " no wrap
set paste                    " paste mode
set noshowmode               " get rid of the extraneous default vim mode information
"-----------------------------------------------------------
if has("gui_running")
    set lines=999 columns=999  " maximized window
    colorscheme gruvbox        " gui colorscheme
else
    set t_Co=256
    colorscheme gruvbox        " terminal colorscheme
endif
" install patched Terminus fonts
set guifont=Terminus\ 16
"-----------------------------------------------------------
" nerdtree tuning
let NERDTreeQuitOnOpen=1     " quit Nerd after opening file
let NERDTreeShowHidden=1     " show hidden files
" quit nerdtree with no files
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"-----------------------------------------------------------
" Keys mappings
" c-n for nerdtree
map <C-n> :NERDTreeToggle<CR>
map <F3> :NERDTreeToggle<CR>
" copy c-c with mouse selection
vmap <C-c> "+y
"-----------------------------------------------------------
" tabline settings
set showtabline=2   " always show tabline
" remap arrow keys
nnoremap <Left> :bprev<CR>
nnoremap <Right> :bnext<CR>
" ligghtline-buffer ui settings
" lightline-buffer function settings
let g:lightline_buffer_show_bufnr = 1
let g:lightline_buffer_rotate = 0
let g:lightline_buffer_fname_mod = ':t'
let g:lightline_buffer_excludes = ['vimfiler']

let g:lightline_buffer_maxflen = 30
let g:lightline_buffer_maxfextlen = 3
let g:lightline_buffer_minflen = 16
let g:lightline_buffer_minfextlen = 3
let g:lightline_buffer_reservelen = 20
"-----------------------------------------------------------
let g:lightline = {
      \ 'colorscheme': 'wombat',
    \ 'tabline': {
        \ 'left': [ [ 'bufferinfo' ], [ 'bufferbefore', 'buffercurrent', 'bufferafter' ], ],
        \ 'right': [ [ 'close' ], ],
        \ },
    \ 'component_expand': {
        \ 'buffercurrent': 'lightline#buffer#buffercurrent2',
        \ },
    \ 'component_type': {
        \ 'buffercurrent': 'tabsel',
        \ },
    \ 'component_function': {
        \ 'bufferbefore': 'lightline#buffer#bufferbefore',
        \ 'bufferafter': 'lightline#buffer#bufferafter',
        \ 'bufferinfo': 'lightline#buffer#bufferinfo',
        \ },
      \ }
