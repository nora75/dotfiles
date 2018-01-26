" Author: NORA(nora75)
" Since: 2017 SEP 01?
" Last Changes: 2018 JAN 25

if has('vim_starting')
    if &rtp !~ expand("~/.vim/") && &rtp !~ '\~/\.vim/'
        " let &rtp += '~/.vim/'
        set runtimepath+=~/.vim/
    endif
endif

runtime! rcfiles/default/*.vim
runtime! rcfiles/plugin/*.vim
