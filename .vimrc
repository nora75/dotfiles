" Author: NORA(nora75)
" Since: 2017 SEP 01?
" Last Changes: 2017 DEC 11

if has('vim_starting')
    if (&rtp !~ expand("~/.vim/"))
        set runtimepath+=~/.vim/
    endif

endif

runtime! rcfiles/default/*.vim
runtime! rcfiles/plugin/*.vim

