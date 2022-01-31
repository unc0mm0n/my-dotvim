" THESE SETTINGS ARE ONLY FOR GLOBAL PLUGINS!
" If a plugin is loaded conditionally (using 'for') then the settings
" must be added INDIVIDUALLY to each filetype loading it (in ftplugin)!!

" NERDTree
" Open nerdtree and leave to main buffer on open
au vimenter * NERDTree
au vimenter * wincmd p
" close nerdtree if it is the only open buffer
au bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowHidden=1
nnoremap <C-D> :NERDTreeToggle<CR>


"lightline
set noshowmode
"line customization (uses git-fugitive)i
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'fugitive#head'
      \ },
      \ }
set laststatus=2
  
" UltiSnips. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<leader>g"
let g:UltiSnipsJumpForwardTrigger="<leader>g"
let g:UltiSnipsJumpBackwardTrigger="<leader>f"
let g:UltiSnipsSnippetsDir="~/.config/nvim/UltiSnippets"
let g:UltiSnipsSnippetDirectories= ['UltiSnippets']
let g:UltiSnipsEditSplit="vertical"
nnoremap <leader>ue :UltiSnipsEdit<cr>

exec 'source' g:nvim_config_root . '/plugin_configs/fugitive.vim'
exec 'source' g:nvim_config_root . '/plugin_configs/ctrlp.vim'

let g:gutentags_ctags_executable="${HOME}/ctags/bin/ctags"
