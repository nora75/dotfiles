" if neobundle#is_installed('matchit.vim')
" endif
if neobundle#is_installed('hl_matchit.vim')
    " func {{{2
    func! s:isExistCol(col) abort
        if !empty(globpath(&rtp,'colors/'.a:col.'.vim'))
            return v:true
        else
            retrun v:false
        endif
    endfunc

    " options {{{2
    " color setting {{{3
    let g:hl_matchit_enable_on_vim_startup = 1
    if exists('GetComOut')
        let cucol = GetComOut(colorscheme)
        if cucol ==# 'iceberg'
            let g:hl_matchit_hl_groupname = 'IncSearch'
        elseif cucol ==# 'twilight'
            let g:hl_matchit_hl_groupname = 'MatchParen'
        else
            let g:hl_matchit_hl_groupname = 'WildMenu'
        endif
    else
        let g:hl_matchit_hl_groupname = 'IncSearch'
    endif
    if s:isExistCol('iceberg')
        au ColorScheme iceberg let g:hl_matchit_hl_groupname = 'IncSearch'
    endif
    if s:isExistCol('twilight')
        au ColorScheme twilight let g:hl_matchit_hl_groupname = 'MatchParen'
    endif
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
    " }}}
endif

" vim: set fdm=marker fmr={{{,}}} fdl=1 :
