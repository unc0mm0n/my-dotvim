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
  Plug 'kien/ctrlp.vim'
  Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'SirVer/ultisnips'
  Plug 'lervag/vimtex', {'for': 'tex'}
  Plug 'crusoexia/vim-monokai'
  Plug 'Valloric/YouCompleteMe'
  Plug 'dense-analysis/ale'
  Plug 'itchyny/lightline.vim'
  Plug 'neovimhaskell/haskell-vim'
call plug#end()

filetype plugin on            " required so plugins can detect filetype
filetype indent on
filetype on

set autoread    " automatically read changed files on disk

" venv
python3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = "source {}".format(os.path.join(project_base_dir, 'bin/activate'))
    print(activate_this +"\n")
    os.system(activate_this)
EOF

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

" status
set laststatus=2

" Set default tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab


" Column Numbers
set number

" line highlighting
set cursorline

" highlight column 110
set colorcolumn=110
" color scheme
highlight colorcolumn ctermbg=darkgray


" split default
set splitright
set splitbelow

" navigation
nnoremap <C-J> <C-W><C-H>
nnoremap <C-K> <C-W><C-J>
nnoremap <C-I> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

inoremap <C-J> <C-o><C-W><C-H>
inoremap <C-K> <C-o><C-W><C-J>
inoremap <C-I> <C-o><C-W><C-K>
inoremap <C-L> <C-o><C-W><C-L>

" exit modes (jk versions are legacy..)
inoremap jk    <esc>
inoremap <leader>k <esc>

vnoremap jk    <esc>
vnoremap <leader>k <esc>

" close
nnoremap <leader>q :q<CR>
nnoremap <silent> <leader>ww :silent w<CR>
nnoremap <leader>wq :wq<CR>
nnoremap <leader>qq :q!<CR>

inoremap <leader>q <C-o>:q<CR>
inoremap <silent> <leader>ww <C-o>:silent w<CR>
inoremap <leader>wq <C-o>:wq<CR>
inoremap <leader>qq <C-o>:q!<CR>

vnoremap <leader>wq <esc>:wq<CR>
vnoremap <leader>qq <esc>:q!<CR>

" sudo write
cmap w!! w !sudo tee > /dev/null &

" go back in search
noremap <leader>, <C-O>

" tab navigation
nnoremap <leader>t  :tabnew<CR>
nnoremap <leader>wt :tabclose<CR>
nnoremap <leader>et :tabedit<Space>
nnoremap <leader>f  :tabnext<CR>
nnoremap <leader>d  :tabprevious<CR>

inoremap <leader>f  <C-o>:tabnext<CR>
inoremap <leader>d  <C-o>:tabprevious<CR>

nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt
nnoremap <leader>0 10gt
" YouCompleteMe
noremap <leader>. :YcmCompleter GoTo<CR>
noremap <leader>/ :YcmCompleter GoToReferences<CR>
noremap <leader>' :YcmCompleter FixIt<CR>

let g:ycm_key_list_stop_completion = ['<C-y', '<UP>', '<DOWN>']
set completeopt-=preview "Not YCM related, but I do not like preview windows and YCM triggers them

" NERDTree
au vimenter * NERDTree
au vimenter * wincmd p
au bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowHidden=1
nnoremap <C-D> :NERDTreeToggle<CR>

"ctrlp
let g:ctrlp_map = '<leader>p'

"lightline
set noshowmode

" UltiSnips. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<C-g>"
let g:UltiSnipsJumpForwardTrigger="<C-g>"
let g:UltiSnipsJumpBackwardTrigger="<C-f>"
let g:UltiSnipsSnippetsDir="~/.vim/UltiSnippets"
let g:UltiSnipsSnippetDirectories= ['UltiSnippets']
let g:UltiSnipsEditSplit="vertical"
nnoremap <leader>ue :UltiSnipsEdit<cr>

" include .tex file settings
" source ~/.vimrc_tex

" python specific
let python_highlight_all = 1
au BufNewFile,BufRead *.jinja set syntax=htmljinja

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
