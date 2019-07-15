scriptencoding utf-8
"-----------------------------------------------------------
" vundle installation
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"-----------------------------------------------------------
set nocompatible                         " be iMproved, required
filetype off                             " required by vundle
set rtp+=~/.vim/bundle/Vundle.vim        " set the runtime path
call vundle#begin()                      " required by vundle
"-----------------------------------------------------------
Plugin 'VundleVim/Vundle.vim'            " plugin manager
Plugin 'vim-airline/vim-airline'         " status line
Plugin 'scrooloose/nerdTree'             " filemanager
Plugin 'fatih/vim-go'                    " go language support
Plugin 'christianrondeau/vim-base64'     " base64 encoding/decoding
Plugin 'morhetz/gruvbox'                 " colorscheme
Plugin 'vim-ctrlspace/vim-ctrlspace'     " buffer selector
Plugin 'airblade/vim-gitgutter'          " show git modified lines
Plugin 'tpope/vim-fugitive'              " git integration
Plugin 'tpope/vim-commentary'            " comments
Plugin 'tommcdo/vim-fugitive-blame-ext'  " git blame extension
Plugin 'shinchu/lightline-seoul256.vim'  " lightline colorscheme
Plugin 'nginx.vim'                       " nginx configuration support
Plugin 'Shougo/neocomplete.vim'          " autocomplete
Plugin 'Xuyuanp/nerdtree-git-plugin' 	 " show modified files in nerdtree
Plugin 'terryma/vim-smooth-scroll'       " smooth scroll
Plugin 'jiangmiao/auto-pairs'            " auto pairing parenthesis
Plugin 'rking/ag.vim'                    " silver searcher
Plugin 'mdempsky/gocode', {'rtp': 'vim/'}
"-----------------------------------------------------------
call vundle#end()                        " required by vundle
filetype plugin indent on                " required by vundle
"-----------------------------------------------------------
syntax enable                            " enable syntax
set encoding=utf-8                       " displayed encoding
set fileencoding=utf-8                   " encoding written to file
set clipboard=unnamed                    " use system clipboard
set encoding=utf-8                       " default encoding
set mousehide                            " hide mouse while typing
set laststatus=2                         " always show status bar
set encoding=utf-8                       " default encoding
set number                               " show line numbers
set mouse+=a                             " dont copy line numbers
set guioptions-=m                        " remove menu bar
set guioptions-=T                        " remove toolbar
set guioptions-=r                        " remove right-hand scroll bar
set guioptions-=L                        " remove left-hand scroll bar
set autoindent                           " autoindent
set hlsearch                             " highligh search
set incsearch                            " show search text immideately
set nowrapscan                           " stop search at the end of file
set ignorecase                           " ignore match case
set cursorline                           " highlight current line
set expandtab                            " replace tab with spaces
set smarttab                             " smart tabbing
set shiftwidth=4                         " 4 space for tab
set tabstop=4                            " tab size
set autoindent                           " autoindenting for new line
set smartindent                          " smart autoindent
set undofile                             " use undo history
set undodir=~/.vim/undo/                 " undo dir
set nobackup                             " disable backup
set noswapfile                           " disable swap files
set nowritebackup                        " do not make backup file while editing
set linespace=0                          " set spaces between lines
set mousemodel=popup                     " show popup menu at mouse click
set background=dark                      " dark background
set nowrap                               " no wrap
set noshowmode                           " hide extraneous default vim mode information
set autochdir                            " change directory
set hidden                               " hides buffer
set showtabline=0                        " use ctrl space
set backspace=indent,eol,start           " enable delete button
set updatetime=750                       " update time in ms
let &colorcolumn="80,".join(range(120,999),",") " draw line
"-----------------------------------------------------------
if has("gui_running")
    set lines=999 columns=999            " maximized window
    set guifont=Terminus\ 16
else
    set t_Co=256                         " enable 256 colors
endif
"-----------------------------------------------------------
colorscheme gruvbox
"-----------------------------------------------------------
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.go setlocal spell
autocmd FileType gitcommit setlocal spell
"-----------------------------------------------------------
let NERDTreeStatusline="%{matchstr(getline('.'), '\\s\\zs\\w\\(.*\\)')}"
let NERDTreeQuitOnOpen=1     " quit Nerd after opening file
let NERDTreeShowHidden=1     " show hidden files
" quit nerdtree with no files
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"-----------------------------------------------------------
let g:airline_powerline_fonts = 1                       " fancy characters
let g:ag_working_path_mode="r"                          " start searching from project root instead of the cwd
let g:acp_enableAtStartup = 0                           " disable autocomplpop
let g:neocomplete#enable_at_startup = 1                 " use neocomplete
let g:neocomplete#enable_smart_case = 1                 " use smartcase
let g:neocomplete#sources#syntax#min_keyword_length = 3 " set minimum syntax keyword length
let g:go_gocode_propose_source = 1                      " gocode should use source files instead of binary packages
let g:go_fmt_command = "goimports"                      " default gofmt tool
let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir']
"-----------------------------------------------------------
set completeopt-=preview
set omnifunc=syntaxcomplete#Complete
"-----------------------------------------------------------
nnoremap <C-n> :NERDTreeToggle<CR>
" copy c-c with mouse selection
vmap <C-c> "+y
" Highlight changes with gitgutter
map <C-S-g> :GitGutterLineHighlightsToggle<CR>
" switch splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" make redo more natural with U
nnoremap U <C-R>
" delete buffer
nnoremap <C-S-x> :bd<CR>
" smooth scroll
nnoremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
nnoremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
" redraw screen
nnoremap <leader>r :redr!<CR>
