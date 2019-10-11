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