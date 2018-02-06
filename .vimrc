" Author: NORA(nora75)
" Since: 2017 SEP 1?
" Last Changes: 2018 FEB 6

if has('vim_starting')
    if &rtp !~ expand("~/.vim/") && &rtp !~ '\~/\.vim/'
        " let &rtp += '~/.vim/'
        set runtimepath+=~/.vim/
    endif
    if has('gui')
        " don't load default menu
        set guioptions+=M
    endif
endif

runtime! rcfiles/default/*.vim
runtime! rcfiles/plugin/*.vim
