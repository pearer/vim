"-----------------------------------------------------------
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
Plugin 'VundleVim/Vundle.vim'           " plugin manager
Plugin 'itchyny/lightline.vim'          " status bar
Plugin 'scrooloose/nerdTree'            " filemanager
Plugin 'christianrondeau/vim-base64'    " base64 encoding/decoding
Plugin 'fatih/vim-go'                   " go language support
Plugin 'morhetz/gruvbox'                " colorscheme
Plugin 'vim-ctrlspace/vim-ctrlspace'    " buffer selector
Plugin 'airblade/vim-gitgutter'         " show git modified lines
Plugin 'tpope/vim-fugitive'             " git integration
Plugin 'tommcdo/vim-fugitive-blame-ext' " git blame extension
Plugin 'tpope/vim-commentary'           " comments
Plugin 'shinchu/lightline-seoul256.vim' " lightline colorscheme
Plugin 'nginx.vim'                      " nginx configuration support
Plugin 'Shougo/neocomplete.vim'         " autocomplete
Plugin 'Xuyuanp/nerdtree-git-plugin'	" show modified files in nerdtree
Plugin 'mhinz/vim-startify'				" startup screen
Plugin 'terryma/vim-smooth-scroll'      " smooth scroll
Plugin 'mileszs/ack.vim'                " grep replacement
Plugin 'gregsexton/gitv'                " gitk for vim
Plugin 'jiangmiao/auto-pairs'           " auto pairing parenthesis
Plugin 'rking/ag.vim'                   " silver searcher
"-----------------------------------------------------------
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"-----------------------------------------------------------
set clipboard=unnamed
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
set noshowmode               " get rid of the extraneous default vim mode information
set autochdir                " change directory
set hidden                   " hides buffer
set showtabline=0            " use ctrl space
let &colorcolumn="80,".join(range(120,999),",")
set backspace=indent,eol,start
set updatetime=100
"-----------------------------------------------------------
if has("gui_running")
    set lines=999 columns=999  " maximized window
    colorscheme gruvbox        " gui colorscheme
else
    set t_Co=256               " enable 256 colors
    colorscheme gruvbox        " terminal colorscheme
endif
"-----------------------------------------------------------
" install patched Terminus fonts
"-----------------------------------------------------------
set guifont=Terminus\ 16
set gfn=Terminus\ 16
"-----------------------------------------------------------
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd FileType gitcommit setlocal spell
"-----------------------------------------------------------
" nerdtree tuning
let NERDTreeQuitOnOpen=1     " quit Nerd after opening file
let NERDTreeShowHidden=1     " show hidden files
" quit nerdtree with no files
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"-----------------------------------------------------------
let g:ag_working_path_mode="r"
"-----------------------------------------------------------
" Keys mappings
" c-n for nerdtree
map <C-n> :NERDTreeToggle<CR>
" copy c-c with mouse selection
vmap <C-c> "+y
"-----------------------------------------------------------
" Highlight changes with gitgutter
map <C-S-g> :GitGutterLineHighlightsToggle<CR>
"-----------------------------------------------------------
" text Bubbling
" bubble single lines
nmap <C-Up> ddkP
nmap <C-Down> ddp
" bubble multiple lines
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]
"------------------------------------------------------------
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"------------------------------------------------------------
nmap <S-Enter> i<CR><ESC>
"------------------------------------------------------------
" make redo more natural with U
nnoremap U <C-R>
"------------------------------------------------------------
" Delete buffer
nmap <C-S-x> :bd<CR>
"------------------------------------------------------------
" smooth scroll
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>
"-----------------------------------------------------------
nnoremap <leader>r :redr!<CR>
"-----------------------------------------------------------
set completeopt-=preview
"-----------------------------------------------------------
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
"-----------------------------------------------------------
" let g:go_highlight_types = 1
" let g:go_auto_type_info = 1
" let g:go_def_mode = "godef"
"-----------------------------------------------------------
let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir']
"-----------------------------------------------------------
set omnifunc=syntaxcomplete#Complete
"-----------------------------------------------------------
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' },
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
        \ 'fugitive': 'LightlineFugitive',
        \ 'readonly': 'LightlineReadonly',
        \ 'modified': 'LightlineModified',
        \ 'filename': 'LightlineFilename'
        \ },
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ }

function! LightlineModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! LightlineReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return "⭤"
  else
    return ""
  endif
endfunction

function! LightlineFilename()
  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
       \ ('' != pathshorten(expand('%:F')) ? pathshorten(expand('%:F')) : '[No Name]') .
       \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFugitive()
  if exists("*fugitive#head")
    let branch = fugitive#head()
    return branch !=# '' ? '⭠ '.branch : ''
  endif
  return ''
endfunction

function! LightlineFilename()
  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
       \ ('' != expand('%:p') ? expand('%:p') : '[NoName]')
endfunction
