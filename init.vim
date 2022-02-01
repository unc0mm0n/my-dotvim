set nocompatible              " be iMproved, required
filetype off                  " required?
set encoding=utf-8            " We don't link non-utf stuff

" set config dir for later use
" I tried creating a function that sources automatically, but had issues
" with importing it to other files...
let g:nvim_config_root = stdpath('config')
if (!empty($NVIM_CACHE))
  let g:nvim_cache = $NVIM_CACHE
else 
  let g:nvim_cache = expand('~/.cache')
endif

autocmd BufNewFile,BufRead *.ter setfiletype cpp
autocmd BufNewFile,BufRead *.ti setfiletype cpp

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" let vim-plug manage plugins
call plug#begin('~/.config/nvim/plugged')
  "Plug 'gmarik/Vundle.vim'

  " Git is our god
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'

  " Fuzzy search and open
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'FelikZ/ctrlp-py-matcher'


  " Directory tree view
  Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'

  " Snippets (should fix python issue)
  " Plug 'SirVer/ultisnips'

  " Actually a color scheme..
  Plug 'crusoexia/vim-monokai'

  " IDE feautres 3
  Plug 'neoclide/coc.nvim', {'branch': 'release', 'for': ['haskell', 'c', 'cpp', 'python', 'rust']}
  Plug 'ludovicchabant/vim-gutentags'
  Plug 'preservim/tagbar'
  
  " CPP semantic hilighting
  Plug 'jackguo380/vim-lsp-cxx-highlight'

  " status line
  Plug 'itchyny/lightline.vim'

  Plug 'neovimhaskell/haskell-vim', {'for': 'haskell'}
  
  Plug 'lervag/vimtex', {'for': 'tex'}

  "Plug 'rust-lang/rust.vim', {'for' : 'rust'}

  Plug 'dbmrq/vim-dialect'
call plug#end()

filetype plugin on            " required so plugins can detect filetype
filetype indent on
filetype on

set autoread    " automatically read changed files on disk
set updatetime=300 " default=4000
set autochdir   " cd do working file's directory
syntax on
colorscheme monokai

" all hail
let mapleader = ';'

set so=10
set wildmenu    " autocomplete using menu instead of rotation

" smart undo
set undodir=~/.config/nvim/undodir
set undofile

" search
set ignorecase
set smartcase
set hlsearch "highlight
set incsearch "incremental

set fileformat=unix

" status
set laststatus=2
set cmdheight=2

" Set default tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab

" don't close buffers
set hidden

" Line numbers and other trench features.
set number
set ruler "Display position on buttom left.. meh..
set signcolumn=number

" line highlighting
set cursorline

" highlight column 120
set colorcolumn=120
" color scheme
highlight colorcolumn ctermbg=darkgray
highlight MatchParen ctermfg=5
" slience
set noerrorbells
set vb t_vb=

" split default
set splitright
set splitbelow

" Spell check
setlocal spell
set spelllang=en_us,en_gb

" try setting tags
set tags=./tags,tags;

" Delete trailing white space on save
" will only run if the ftplugin/*.vim sets `b:stripWhitespaces=1`
fun! CleanExtraSpaces()
  if exists('b:stripWhitespaces')
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
  endif
endfun

autocmd BufWritePre * :call CleanExtraSpaces()

" Return to last edit position when opening files
augroup last_edit
  autocmd!
  autocmd BufReadPost *
       \ if line("'\"") > 0 && line("'\"") <= line("$") |
       \   exe "normal! g`\"" |
       \ endif
augroup END


" more files in plugin directory
