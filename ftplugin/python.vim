
" python specific
au BufNewFile,BufRead *.jinja set syntax=htmljinja

" attempt to activate virtualenv (for youcompleteme) when modifying python
" files
python3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = "source {}".format(os.path.join(project_base_dir, 'bin/activate'))
    print(activate_this +"\n")
    os.system(activate_this)
EOF

setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal autoindent
setlocal fileformat=unix
setlocal showmatch

let python_highlight_all = 1
let b:stripWhitespaces=1
