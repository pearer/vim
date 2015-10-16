" vundle installation
"-----------------------------------------------------------
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"-----------------------------------------------------------
" fonts patching
" https://github.com/Lokaltog/vim-powerline/tree/develop/fontpatcher
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
Bundle 'altercation/vim-colors-solarized'
"-----------------------------------------------------------
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"-----------------------------------------------------------
scriptencoding utf-8         " script encoding
colorscheme molokai          " colorscheme
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
set shiftwidth=4             " 4 space for tab
set tabstop=4                " tab size
set autoindent               " autoindenting for new line
set smartindent              " smart autoindent
set undodir=~/.vim/undo//    " undo dir
set nobackup                 " disable backup
set noswapfile               " disable swap files
set linespace=0              " set spaces between lines
set mousemodel=popup         " show popup menu at mouse click
set background=dark          " dark background
set list                     " show tabs, eols, etc
syntax enable                " enable syntax
"-----------------------------------------------------------
if has("gui_running")
    set lines=999 columns=999  " maximized window
    colorscheme molokai        " colorscheme
else
    colorscheme solarized
endif
"-----------------------------------------------------------
" nerdtree tuning
let NERDTreeQuitOnOpen=1     " quit Nerd after opening file
let NERDTreeShowHidden=1     " show hidden files
" quit nerdtree with no files
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"-----------------------------------------------------------
" Keys mappings
" disable arrows
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
" c-n for nerdtree
map <C-n> :NERDTreeToggle<CR>
" Tab navigation like Firefox.
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
nnoremap <C-q>     :tabclose<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>i
" copy c-c with mouse selection
vmap <C-c> "+y
