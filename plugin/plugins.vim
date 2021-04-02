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

"ctrlp
let g:ctrlp_map = '<leader>p'

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
let g:UltiSnipsExpandTrigger="<C-g>"
let g:UltiSnipsJumpForwardTrigger="<C-g>"
let g:UltiSnipsJumpBackwardTrigger="<C-f>"
let g:UltiSnipsSnippetsDir="~/.vim/UltiSnippets"
let g:UltiSnipsSnippetDirectories= ['UltiSnippets']
let g:UltiSnipsEditSplit="vertical"
nnoremap <leader>ue :UltiSnipsEdit<cr>
