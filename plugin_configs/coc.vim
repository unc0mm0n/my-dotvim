" CoC config (should be imported into any file type using CoC)
inoremap <silent><expr> <leader><space> coc#refresh()
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
