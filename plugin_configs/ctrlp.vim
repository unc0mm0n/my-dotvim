
"ctrlp trigger
let g:ctrlp_map = '<leader>p'
"search from project root.
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_root_markers = ["tvenv-pip.conf"]
" ignore .gitig files
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

let g:ctrlp_clear_caching_on_exit = 0
" file limit (open for experimentation)
let g:ctrlp_max_files = 0
" keep cache
let g:ctrlp_clear_caching_on_exit = 0

" don't use default matcher
" let g:ctrlp_match_func = { 'match': 'cpsm#CtrlPMatch' }
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

"search tag file
if executable('rg')
  let g:ctrlp_user_command = 'rg --files %s'
  let g:ctrlp_switch_buffer = 'et'
endif
