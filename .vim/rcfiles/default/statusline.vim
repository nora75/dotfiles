scriptencoding utf-8

" initialize {{{2
" set variables if not exist
set ls=2
if !exists('g:wafun')
    source ~\.vim\rcfiles\default\wafu.vim
endif

" functions {{{2
" MyStl() {{{3
" function of setting statusline value
" number name variable is separator (colorscheme or alignment)
func! s:stl(active) abort
    call s:col()
    let first = ''
    let cfd = StlCurFileDir()
    let cwd = ''
    let waf = ''
    let second = ' %#StlLeft1# %f '
    if !a:active
        let cwd = StlCwd()
        let waf = ' | '.StlWafu()
        let first = '%#StlLeft0# '
    endif
    let mo = s:mod()
    let ro = s:ro()
    let third = '%#StlCent#%='
    let forth = '%#StlRight0#'
    let move = '%{hasmapto("j")?" M ":""}'
    let ff = '%{(&ft!="help")?''| ''.toupper(strcharpart(&ff,-1,2)).'' '':""}'
    let fenc = ' '.StlFenc().' '
    let ft =  '%{"| ".&ft." "}'
    return first.cwd.cfd.waf.second.mo.ro.third.move.ff.forth.fenc.ft
endfunc

" StlCwd() {{{3
" functino of cwd
" return current dir
" only end two directory
" show which partition if current directory's partition isn't match
" home directory's partition
func! StlCwd() abort
    let fcwd = getcwd()
    let cd = matchstr(fcwd,'\M^\/\?\zs\[^\\\/]\+\ze\(\/\|\\\)\?')
    let cwd = matchstr(fcwd,'\M\[^\\\/]\+\(\\\|\/\)\[^\\\/]\+$')
    if cwd ==# ''
        let cwd = fcwd
    endif
    let licwd = split(cwd, '\')
    let i = 0
    while i < len(licwd)
        if len(licwd[i]) > 5
            let licwd[i] = strcharpart(licwd[i],0,5)
        endif
        let i += 1
    endwhile
    let cwd = join(licwd, '\')
    if cd !~? matchstr(expand('~'),'\M^\/\?\zs\[^\\\/]\+\ze\(\/\|\\\)\?')
        let cd = toupper(cd)
        if cwd !~? '^'.strcharpart(cd,0,5)
            if cd !~ ':$'
                let cwd = cd.':'.cwd
            else
                let cwd = cd.cwd
            endif
        endif
    endif
    return cwd
endfunc

" StlCurFileDir() {{{3
" if current file dir isn't match current working director
" return current file directory
func! StlCurFileDir() abort
    let cwd = getcwd()
    let cfd = expand('%:p:h')
    if (cwd==?cfd)||(cfd==#'')
        return ''
    endif
    let cdr = strcharpart(cfd,-1,2)
    let cfd = matchstr(cfd,'[^\\]\+\\[^\\]\+$')
    if (strcharpart(cwd,-1,2)!=cdr) && (cfd!~'\M^'.cdr)
        let cdr = cdr.':'
    else
        let cdr = ''
    endif
    let licwd = split(cfd, '\')
    let i = 0
    while i < len(licwd)
        if len(licwd[i]) > 5
            let licwd[i] = strcharpart(licwd[i],0,5)
        endif
        let i += 1
    endwhile
    let cwd = join(licwd, '\')
    return cdr.cwd
endfun

" StlWafu() {{{3
" function of wafu
" return some variation of wafu
function! StlWafu()
    " if !exists('b:myvariables_iswinactive')
    "     return ''
    " endif
    let wafuenc = get(s:, 'wafuenc', &encoding)
    if wafuenc != &encoding
        let g:wafustr = map(g:wafustr, 'iconv(v:val,g:wafuenc,&encoding)')
        let g:wafuerrlong = map(g:wafuerrlong, 'iconv(v:val,g:wafuenc,&encoding)')
    endif
    let g:wafuenc = &encoding
    let wafupos = get(w:, 'wafupos', -1) + 1
    if len(v:errmsg) && wafupos >= 0
        let wafupos = -24
        let s:lasterrormsg = v:errmsg
        let v:errmsg = ''
    endif
    if wafupos >= 0
        let wafupos = wafupos % len(g:wafustr)
    endif
    let w:['wafupos'] = wafupos
    if wafupos >= 0
        return g:wafustr[wafupos]
    else
        if winwidth('') >= 100
            return g:wafuerrlong[(wafupos+24) % len(g:wafuerrlong)].' '.matchstr(get(s:, 'lasterrormsg', ''),'^E\d\+')
        else
            return g:wafuerrshort[(wafupos+24) % len(g:wafuerrshort)].' '.matchstr(get(s:, 'lasterrormsg', ''),'^E\d\+')
        endif
    endif
endfunction

" s:col() {{{3
" function of declation colorscheme
func! s:col() abort
    hi StlLeft0 term=bold gui=bold ctermfg=22 ctermbg=148 guifg=#005f00 guibg=#afdf00
    hi StlLeft1 ctermfg=231 ctermbg=240 guifg=#ffffff guibg=#585858
    hi StlRight0 term=bold gui=bold ctermfg=241 ctermbg=252 guifg=#606060 guibg=#d0d0d0
    hi StlRight1 term=bold gui=bold ctermfg=231 ctermbg=240 guifg=#ffffff guibg=#585858
    hi StlCent term=bold gui=bold ctermfg=235 ctermbg=235 guifg=#262626 guibg=#262626
endfunc

" s:mod() {{{3
" function of modified
func! s:mod() abort
    return (&mod)?'| + ':''
endfunc

func! s:ro() abort
    return (&ro)?'| - ':''
endfunc

" StlFenc() {{{3
" function of fenc
func! StlFenc() abort
    let en = substitute(toupper(&fenc!=''?&fenc:&enc),'\M-','','g')
    if en =~? 'utf'
        let en .= &bomb ? 'B': 'N'
    endif
    return en
endfunc

" s:RetError() {{{3
" function to return erromsgs
func! s:RetError() abort
    return get(s:, 'lasterrormsg', '')
endfunc

" s:stlupdate() abort {{{3
" update stl in all window
func! s:stlupdate() abort
    let w = winnr()
    let s = winnr('$') == 1 ? [s:stl(0)] : [s:stl(0), s:stl(1)]
    for n in range(1, winnr('$'))
        call setwinvar(n, '&statusline', s[n!=w])
    endfor
endfunc

" Commands {{{2
" :ShowError {{{3
" show last error
command! -nargs=0 ShowError echo s:RetError()

" :GoError {{{3
" Go help file of last error
command! -nargs=0 GoError exe 'help' matchstr(s:RetError(),'\ME\d\+')

" au {{{2
" StlAu
aug StlAu
    au!
    au BufUnload * call s:stlupdate()
    au BufWinEnter * call s:stlupdate()
    au WinEnter * call s:stlupdate()
    au FileType * call s:stlupdate()
    au CursorMoved * call s:stlupdate()
    au BufWritePost * call s:stlupdate()
aug END

" initialize {{{2
call s:stlupdate()
