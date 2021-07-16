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
nnoremap <leader>tt  :tabnew<CR>
nnoremap <leader>tw :tabclose<CR>
nnoremap <leader>te :tabedit<Space>
nnoremap <leader>tf  :tabnext<CR>
nnoremap <leader>td  :tabprevious<CR>

inoremap <leader>tf  <C-o>:tabnext<CR>
inoremap <leader>td  <C-o>:tabprevious<CR>

nnoremap <leader>t1 1gt
nnoremap <leader>t2 2gt
nnoremap <leader>t3 3gt
nnoremap <leader>t4 4gt
nnoremap <leader>t5 5gt
nnoremap <leader>t6 6gt
nnoremap <leader>t7 7gt
nnoremap <leader>t8 8gt
nnoremap <leader>t9 9gt
nnoremap <leader>t0 10gt

" Quick undo in insert mode
inoremap <leader>u <C-o>u

" Quick fix and come back
inoremap <leader>sf <c-g>u<Esc>[s1z=`]a<c-g>u

" Add to dictionary and come back
inoremap <leader>sf <c-g>u<Esc>[s1zg`]a<c-g>u

" Ignore for this session and come back
inoremap <leader>si <c-g>u<Esc>[s1zG`]a<c-g>u
