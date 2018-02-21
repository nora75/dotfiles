" Author: NORA(nora75)
" Since: 2017 SEP 1?
" Last Changes: 2018 FEB 6

if has('vim_starting')
    if &rtp !~ expand('~/.vim/') && &rtp !~? '\~/\.vim/'
        " let &rtp += '~/.vim/'
        set runtimepath+=~/.vim/
    endif
    if has('gui')
        " don't load default menu
        set guioptions+=M
    endif
    if &enc !=# 'utf-8'
        set enc=utf-8
    endif
    if &fencs !=# 'ucs-bom,utf-8,sjis'
        set fileencodings=ucs-bom,utf-8,sjis
    endif
    if &fenc !=# 'utf-8'
        set fileencoding=utf-8
    endif
endif

runtime! rcfiles/default/*.vim
if exists(':NeoBundle')
    runtime! rcfiles/plugin/*.vim
endif
