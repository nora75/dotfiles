" if neobundle#is_installed("matchit.vim")
" endif
if neobundle#is_installed('hl_matchit.vim')
    let g:hl_matchit_hl_groupname = 'IncSearch'
    let g:hl_matchit_enable_on_vim_startup = 1
    " define :ReloadVimrc again {{{2
    command! -nargs=0 ReloadVimrc let g:reload_save_win = winsaveview()|
    \ let g:reload_save_cuwinid = win_getid()|
    \ exe 'windo let b:reload_save_fold = &fdl'|
    \ exe 'NoHiMatch'|
    \ exe 'HiMatchOff'|
    \ source $MYVIMRC|
    \ set nohlsearch|
    \ exe 'HiMatchOn'|
    \ exe 'silent! windo let &fdl = b:reload_save_fold'|
    \ exe 'silent! windo unlet b:reload_save_fold'|
    \ call win_gotoid(g:reload_save_cuwinid)|
    \ call winrestview(g:reload_save_win)|
    \ unlet g:reload_save_win|
    \ unlet g:reload_save_cuwinid
endif
