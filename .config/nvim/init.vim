scriptencoding utf-8
"-----------------------------------------------------------
" vundle installation
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"-----------------------------------------------------------
set nocompatible                         " be iMproved, required
filetype off                             " required by vundle
" pecify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/autoload/plug.vim')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fatih/vim-go'
Plug 'itchyny/lightline.vim'         " status line
Plug 'scrooloose/nerdTree'             " filemanager
Plug 'christianrondeau/vim-base64'     " base64 encoding/decoding
Plug 'morhetz/gruvbox'                 " colorscheme
Plug 'vim-ctrlspace/vim-ctrlspace'     " buffer selector
Plug 'airblade/vim-gitgutter'          " show git modified lines
Plug 'tpope/vim-fugitive'              " git integration
Plug 'tpope/vim-commentary'            " comments
Plug 'tommcdo/vim-fugitive-blame-ext'  " git blame extension
Plug 'shinchu/lightline-seoul256.vim'  " lightline colorscheme
Plug 'Xuyuanp/nerdtree-git-plugin' 	   " show modified files in nerdtree
Plug 'terryma/vim-smooth-scroll'       " smooth scroll
Plug 'jiangmiao/auto-pairs'            " auto pairing parenthesis
Plug 'rking/ag.vim'                    " silver searcher
Plug 'treycucco/vim-monotonic'
Plug 'junegunn/goyo.vim'
Plug 'shmup/vim-sql-syntax'
Plug 'vim-scripts/SQLComplete.vim'
Plug 'shinchu/lightline-gruvbox.vim'
" Initialize plugin system
call plug#end()
"-----------------------------------------------------------
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
set background=dark                      " light background
set nowrap                               " no wrap
set noshowmode                           " hide extraneous default vim mode information
set autochdir                            " change directory
set hidden                               " hides buffer
set showtabline=0                        " use ctrl space
set backspace=indent,eol,start           " enable delete button
set updatetime=750                       " update time in ms
set termguicolors
let &colorcolumn="80,".join(range(120,999),",") " draw line
"-----------------------------------------------------------
set encoding=utf8
let g:airline_powerline_fonts = 1
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
let g:CtrlSpaceDefaultMappingKey = "<C-space> "
"-----------------------------------------------------------
let g:ag_working_path_mode="r"                          " start searching from project root instead of the cwd
let g:acp_enableAtStartup = 0                           " disable autocomplpop
let g:neocomplete#enable_at_startup = 1                 " use neocomplete
let g:neocomplete#enable_smart_case = 1                 " use smartcase
let g:neocomplete#sources#syntax#min_keyword_length = 3 " set minimum syntax keyword length
let g:go_auto_sameids = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_auto_type_info = 1
let g:go_fmt_command = "goimports"                      " default gofmt tool
let g:go_def_mapping_enabled = 0
let g:go_fmt_fail_silently = 1
let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir']
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠' 
let g:airline#extensions#ale#enabled = 1                " Enable integration with airline.
let g:goyo_width = 120
let g:goyo_height = '100%'
hi clear SpellBad
hi SpellBad cterm=underline
hi SpellBad gui=undercurl
"-----------------------------------------------------------
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ }

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

set foldmethod=indent   
set foldnestmax=10
set nofoldenable
set foldlevel=2

" -------------------------------------------------------------------------------------------------
" coc.nvim default settings
" -------------------------------------------------------------------------------------------------

" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
