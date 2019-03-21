if !dein#is_sourced('matchit.vim')
    finish
endif
if !dein#is_sourced('hl_matchit.vim')
    finish
endif
" func {{{2
func! s:isExistCol(col) abort
    if !empty(globpath(&rtp,'colors/'.a:col.'.vim'))
        return v:true
    else
        retrun v:false
    endif
endfunc

" au {{{2
" aug Myau
"     au WinLeave * silent HiMatchOff
"     au WinEnter * silent HiMatchOn
" aug end

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
" au {{{{3
if s:isExistCol('iceberg')
    au ColorScheme iceberg let g:hl_matchit_hl_groupname = 'IncSearch'
endif
if s:isExistCol('twilight')
    au ColorScheme twilight let g:hl_matchit_hl_groupname = 'MatchParen'
endif
" define :ReloadVimrc again {{{2
if !exists(':ReloadVimrc')
    command! -nargs=0 ReloadVimrc exe g:ReloadVimrc.ret()
else
    if exists('g:ReloadVimrc')
        let i = 0
        while i < len(g:ReloadVimrc.data)
            if g:ReloadVimrc.data[i] =~? 'MYVIMRC'
                call insert(g:ReloadVimrc.data,'exe "HiMatchOff"',i)
                call insert(g:ReloadVimrc.data,'exe "NoHiMatch"',i)
                break
            endif
            let i += 1
        endwhile
    else
        " g:ReloadVimrc.ret() {{{2
        " save current window and restore current winodow after reloading .vimrc
        let g:ReloadVimrc = {'data':['let g:ReloadVimrc.save_cuwinid = win_getid()','exe "NoHiMatch"','exe "HiMatchOff"','source $MYVIMRC','exe "HiMatchOn"','set nohlsearch','call win_gotoid(g:ReloadVimrc.save_cuwinid)'],'save_winid':''}
        func! g:ReloadVimrc.ret() abort
            return join(self.data,'|')
        endfunc
    endif
endif
" }}}

" vim: set fdm=marker fmr={{{,}}} fdl=1 :
