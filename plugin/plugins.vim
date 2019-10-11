
" prevent arrow keys from interacting with YCM autocompetion suggestions
let g:ycm_key_list_stop_completion = ['<C-y', '<UP>', '<DOWN>']
"Not YCM related, but I do not like preview windows and YCM triggers them
set completeopt-=preview

" YouCompleteMe
" noremap <leader>. :YcmCompleter GoTo<CR>
" noremap <leader>/ :YcmCompleter GoToReferences<CR>
" noremap <leader>' :YcmCompleter FixIt<CR>

" CoC (the YCM replacement for haskell)
inoremap <silent><expr> <leader><space> coc#refresh()
nnoremap <silent> <leader>. :call CocAction('jumpDefinition')<CR>
nnoremap <silent> <leader>/ :call CocAction('jumpReferences')<CR>
nnoremap <silent> <leader>' :call CocActionAsync('doQuickFix')<CR>
nnoremap <silent> <leader>r :call CocActionAsync('rename')<CR>
nnoremap <silent> <leader>i :call CocAction('doHover')<CR>

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
