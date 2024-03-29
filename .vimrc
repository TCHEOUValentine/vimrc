"<==>==<==>==<==>==<==>==<==>==<==>==<PLUG>==<==>==<==>==<==>==<==>==<==>==<==>

"Install Plug if not already done
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Enable plugins
filetype plugin on

" Directory for plugins
call plug#begin('~/.vim/plugged')
    " My colorschemes and airline themes :3
    Plug 'TCHEOUValentine/raisen'
    Plug 'TCHEOUValentine/coffeebean'

    " Colorschemes
    Plug 'morhetz/gruvbox'
    Plug 'cocopon/iceberg.vim'
    Plug 'gosukiwi/vim-atom-dark'

    " Airline
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " Git commands in vim but better
    Plug 'tpope/vim-fugitive'

    " File System Explorer
    Plug 'preservim/nerdtree'

    " Comments
    Plug 'preservim/nerdcommenter'

    " Code completion menu auto
    Plug 'vim-scripts/AutoComplPop'

    " Snippets
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'

    " Auto pairs
    Plug 'jiangmiao/auto-pairs'

    " Syntax checking
    Plug 'vim-syntastic/syntastic'

    " Man pages in Vim
    Plug 'vim-utils/vim-man'

    " Color Preview
    Plug 'ap/vim-css-color'

    " Initialize plugin system
call plug#end()


"==>==<==>==<==>==<==>==<==>==<==>==<VISUAL>==<==>==<==>==<==>==<==>==<==>==<==

" Syntax
syntax on
set encoding=utf8

" Colorscheme
set background=dark
colorscheme raisen
let g:airline_theme='raisen'
set termguicolors
highlight Normal ctermbg=None

" Cursor
set cursorline

" Tabs
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab

" Indentation
set autoindent
set smartindent
set backspace=indent,eol,start

" Numbers
set number
set relativenumber

" Limit line length
set textwidth=80
set colorcolumn=80
highlight ColorColumn ctermbg=gray guibg=gray

" Keep 5 lines below and above the cursor
set scrolloff=5

" Show matching parenthesis
set showmatch

" fix splitting
set splitbelow splitright

" resize split automatically
autocmd VimResized * wincmd =


"==>==<==>==<==>==<==>==<==>==<==>==<OTHER>==<==>==<==>==<==>==<==>==<==>==<==>

" Search
set smartcase
set ignorecase
set hlsearch
set incsearch

" Code completion options
set complete+=kspell,d
set completeopt=menuone,popup
set shortmess+=c

" Don't redraw when executing macros
set lazyredraw

" No trash file
set noswapfile

" Auto load file when it has been changed outside of vim
set autoread

" Use the mouse at your own risk
set mouse=a

" Better completion experience
set completeopt=menuone,noinsert,noselect

" Silent errors
set noerrorbells


"==>==<==>==<==>==<==>==<==>==<==>REMAPS / CMD<==>==<==>==<==>==<==>==<==>==>==

" Set leader
let mapleader = "\<Space>"

" Avoid mistypes
command W w
command Q q
command WQ wq

" File Navigation
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

"Easier split navigation
map <C-h> <C-w>h
map <C-l> <C-w>l

" Create a vertical Split
noremap <C-M> :vs<CR>
inoremap <C-M> <Esc>:vs<CR><C-M>

" Create a new tab
noremap <C-T> :tabnew<CR>
inoremap <C-T> <Esc>:tabnew<CR>

" Normal mode from insert mode easier
inoremap ii <Esc>

" Move current or selected lines using shift+[jk]
nnoremap <C-j> :m .+1<CR>
nnoremap <C-k> :m .-2<CR>
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Fix indent in the whole file
noremap <C-I> gg=G

"Easier indent
noremap < <<Space>
noremap > ><Space>

"Fix indenting visual block
vmap < <gv
vmap > >gv

" ctrl+s to save
noremap <C-S> :w<CR>
inoremap <C-S> <Esc>:w<CR>

" ctrl+x to quit
noremap <C-X> :q<CR>
inoremap <C-X> <Esc>:q<CR>

" Destroy all trailing spaces on save
autocmd BufWritePre * %s/\s\+$//e

" Paste enabled
set pastetoggle=<F6>


"==>==<==>==<==>==<==>==<==>==<==>PLUGIN CONF<==>==<==>==<==>==<==>==<==>==<==>

"
" FUGITIVE
"

nnoremap <Leader>ga :Git add %<CR>
nnoremap <Leader>gc :Git commit<CR>i


"
" NERDTREE
"

" Start NERDTree. If a file is specified, move the cursor to its window
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" Exit Vim if NERDTree is the only window remaining in the only tab
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Toggle NerdTree
nnoremap <C-f> :NERDTreeToggle<CR>


"
" NERDCOMMENTER
"

" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1


"
" ACP
"

" Enable ACP at the start
let g:acp_enableAtStartup = 1

" Enable completion menu
map <F5> :AcpEnable<CR>

" Disable completion menu
map <F4> :AcpDisable<CR>

" Enter to select in completion menu
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"


"
" ULTISNIPS
"

" Trigger snippets
let g:UltiSnipsExpandTrigger="<tab>"

" Split your window to edit snippets
let g:UltiSnipsEditSplit="vertical"


"
" MAN
"

let g:vim_man_cmd = 'man'
