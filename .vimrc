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
Plugin 'taohex/lightline-buffer'        " show tabs for buffers
Plugin 'airblade/vim-gitgutter'         " show git modified lines
Plugin 'tpope/vim-fugitive'             " git integration
Plugin 'tommcdo/vim-fugitive-blame-ext' " git blame extension
Plugin 'tpope/vim-commentary'           " comments
Plugin 'shinchu/lightline-seoul256.vim' " lightline colorscheme
Plugin 'nginx.vim'                      " nginx configuration support
Plugin 'kien/ctrlp.vim'                 " search in files
Plugin 'vim-scripts/Align'              " align text plugin
Plugin 'vim-scripts/SQLUtilities'       " sql utils
Plugin 'nsf/gocode', {'rtp': 'vim/'}    " gocode support
Plugin 'Shougo/neocomplete.vim'         " autocomplete
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
set noshowmode               " get rid of the extraneous default vim mode information
set autochdir                " change directory
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
let g:go_highlight_types = 1
"-----------------------------------------------------------
let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir']
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
        \ 'filename': 'MyFilename'
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

function! MyFilename()
  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
       \ ('' != expand('%:p') ? expand('%:p') : '[NoName]')
endfunction
