" CoC config (should be imported into any file type using CoC)
nnoremap <silent> <leader>. :call CocAction('jumpDefinition')<CR>
nnoremap <silent> <leader>/ :call CocAction('jumpReferences')<CR>
nnoremap <silent> <leader>' :call CocActionAsync('doQuickFix')<CR>
nnoremap <silent> <leader>r :call CocActionAsync('rename')<CR>
nnoremap <silent> <leader>i :call CocAction('doHover')<CR>
nnoremap <silent> <leader>o :CocList outline<CR>
nnoremap <silent> <leader>d :CocList diagnostics<CR>
nnoremap <silent> <leader>c :CocList commands<CR>

let g:coc_disable_startup_warning = 1

au CursorHold * sil call CocActionAsync('highlight')
au CursorHoldI * sil call CocActionAsync('showSignatureHelp')

highlight CocHighlightText ctermbg=LightMagenta ctermfg=Black
au ColorScheme * highlight CocHighlightText ctermbg=LightMagenta ctermfg=Black

highlight CocErrorFloat ctermfg=red
au ColorScheme * highlight CocErrorFloat ctermfg=red 

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
