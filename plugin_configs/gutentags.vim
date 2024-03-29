
let g:gutentags_ctags_executable = "/usr/local/bin/ctags"

" enable gtags module
let g:gutentags_modules = ['ctags']

" config project root markers.
let g:gutentags_project_root = ['.root']

" generate datebases in my cache directory, prevent gtags files polluting my project
let g:gutentags_cache_dir = expand(g:nvim_cache . '/tags')

" change focus to quickfix window after search (optional).
let g:gutentags_plus_switch = 1

nnoremap <leader>fs :TagbarToggle<CR>
" Open nerdtree and leave to main buffer on open
au vimenter * TagbarToggle
