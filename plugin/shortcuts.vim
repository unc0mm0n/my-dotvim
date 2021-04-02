" navigation (I really do not want to get used to hjkl, as my jikl makes a lot
" more sense. But I do want to use i for insert :(
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

inoremap <C-H> <C-o><C-W><C-H>
inoremap <C-J> <C-o><C-W><C-J>
inoremap <C-K> <C-o><C-W><C-K>
inoremap <C-L> <C-o><C-W><C-L>

" leader exit key
inoremap <leader><space> <leader><space>
" exit modes (jk versions are legacy.. NO MORE LEGACY)
"inoremap jk    <esc>
inoremap <leader>k <esc>
inoremap <leader>l <esc>

"vnoremap jk    <esc>
vnoremap <leader>k <esc>
vnoremap <leader>l <esc>

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
