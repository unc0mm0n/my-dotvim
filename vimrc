set nocompatible              " be iMproved, required
filetype off                  " required?
set encoding=utf-8            " We don't link non-utf stuff

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" let vim-plug manage plugins
call plug#begin('~/.vim/plugged')
  "Plug 'gmarik/Vundle.vim'

  " Fuzzy search and open
  Plug 'kien/ctrlp.vim'

  " Directory tree view
  Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'

  " Snippets
  Plug 'SirVer/ultisnips'

  " Actually a color scheme..
  Plug 'crusoexia/vim-monokai'

  " IDE features
  Plug 'Valloric/YouCompleteMe', {'for': 'python'}
  " IDE features 2
  Plug 'dense-analysis/ale'
  " IDE feautres 3  for now only for haskell, but a good candidate to replacing YCM
  Plug 'neoclide/coc.nvim', {'branch': 'release', 'for': ['haskell', 'c', 'cpp']}

  " status line
  Plug 'itchyny/lightline.vim'

  Plug 'neovimhaskell/haskell-vim', {'for': 'haskell'}
  
  Plug 'lervag/vimtex', {'for': 'tex'}
call plug#end()

filetype plugin on            " required so plugins can detect filetype
filetype indent on
filetype on

set autoread    " automatically read changed files on disk

syntax on
colorscheme monokai

" all hail
let mapleader = ';'

set wildmenu    " autocomplete using menu instead of rotation

" smart undo
set undodir=~/.vim/undodir
set undofile

" search
set ignorecase
set smartcase
set hlsearch "highlight
set incsearch "incremental

set fileformat=unix

" status
set laststatus=2

" Set default tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" don't close buffers
set hidden

" Numbers
set number
set ruler

" line highlighting
set cursorline

" highlight column 110
set colorcolumn=110
" color scheme
highlight colorcolumn ctermbg=darkgray

" slience
set noerrorbells
set vb t_vb=

" split default
set splitright
set splitbelow

" include .tex file settings
" source ~/.vimrc_tex


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
