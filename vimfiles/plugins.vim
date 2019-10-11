
" prevent arrow keys from interacting with YCM autocompetion suggestions
let g:ycm_key_list_stop_completion = ['<C-y', '<UP>', '<DOWN>']

"Not YCM related, but I do not like preview windows and YCM triggers them
set completeopt-=preview

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
