set ls=2
set statusline=%!MyStl()

" functions {{{2
" MyStl() {{{3
" function of setting statusline value
" number name variable is separator (colorscheme or alignment)
func! MyStl() abort
    call s:col()
    let first = '%<%#StlLeft0# '
    let cwd = StlCwd()
    let cfd = StlCurFileDir()
    let waf = ' | '.StlWafu().'  '
    let second = ' %#StlLeft1# %f '
    let mo = s:mod()
    let ro = s:ro()
    let third = '%#None#%='
    let forth = '%#StlRight0#'
    let move = '%{hasmapto("j")?" M ":""}'
    let ff = '%{(&ft!="help")?''| ''.toupper(strcharpart(&ff,-1,2)).'' '':""}'
    let fenc = '| '.StlFenc().' '
    let ft =  '%{"| ".&ft." "}'
    return first.cwd.cfd.waf.second.mo.ro.third.forth.move.ff.fenc.ft
endfunc

" StlCwd() {{{3
" functino of cwd
" return current dir
" only end two directory
" if base directory is different by current directory show where
func! StlCwd() abort
    let fcwd = getcwd()
    let cd = strcharpart(fcwd,-1,2)
    let cwd = matchstr(fcwd,'[^\\]\+\\[^\\]\+$')
    if cwd == ''
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
    if (cd!='C')
        let cd .= ':'
    else
        let cd = ''
    endif
    if cwd!~'^'.cd
        let cwd = cd.cwd
    endif
    return cwd
endfunc

" StlCurFileDir() {{{3
" if current file dir isn't match current working directory return current
" file directory
func! StlCurFileDir() abort
    let cwd = getcwd()
    let cfd = expand('%:p:h')
    if (cwd==cfd)||(cfd=='')
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

" declation of wafu {{{3
let wafun = '(>ω<)'
" let wafun = '(>ω<)           '
let wafuw = '(>ω<)/ わふーっ！'
let wafue = '(>ω<) わふーっ! しすてむ・えらーですーっ!'
" let wafun = '(>ω<)                                   '
" let wafuw = '(>ω<)/わふーっ！                        '
" let wafue = '(>ω<)わふーっ! しすてむ・えらーですーっ!'
let s:wafustr = [ 
\ wafun ,
\ wafun ,
\ wafun ,
\ wafun ,
\ wafun ,
\ wafun ,
\ wafuw ,
\ wafuw ,
\ wafuw ,
\ wafuw ,
\ wafuw ,
\ wafuw ,
\ ]
let s:wafuerr = [ 
\ wafun ,
\ wafun ,
\ wafun ,
\ wafun ,
\ wafun ,
\ wafun ,
\ wafue ,
\ wafue ,
\ wafue ,
\ wafue ,
\ wafue ,
\ wafue ,
\ ]
" StlWafu() {{{3
" function of wafu
" return some variation of wafu
function! StlWafu()
    let wafuenc = get(s:, "wafuenc", &encoding)
    if wafuenc != &encoding
        let s:wafustr = map(s:wafustr, 'iconv(v:val,s:wafuenc,&encoding)')
        let s:wafuerr = map(s:wafuerr, 'iconv(v:val,s:wafuenc,&encoding)')
    endif
    let s:wafuenc = &encoding
    let wafupos = get(w:, "wafupos", -1) + 1
    if len(v:errmsg) && wafupos >= 0
        let wafupos = -24
        let s:lasterrormsg = v:errmsg
        let v:errmsg = ''
    endif
    if wafupos >= 0
        let wafupos = wafupos % len(s:wafustr)
    endif
    let w:['wafupos'] = wafupos
    if wafupos >= 0
        return s:wafustr[wafupos]
    else
        return s:wafuerr[(wafupos+24) % len(s:wafuerr)].' '.matchstr(get(s:, 'lasterrormsg', ''),'^E\d\+')
    endif
endfunction

" s:col() {{{3
" function of declation colorscheme
func! s:col() abort
    hi StlLeft0 term=bold gui=bold ctermfg=22 ctermbg=148 guifg=#005f00 guibg=#afdf00
    hi StlLeft1 ctermfg=231 ctermbg=240 guifg=#ffffff guibg=#585858
    hi StlRight0 term=bold gui=bold ctermfg=241 ctermbg=252 guifg=#606060 guibg=#d0d0d0
    hi StlRight1 term=bold gui=bold ctermfg=231 ctermbg=240 guifg=#ffffff guibg=#585858
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
    if en =~ 'UTF'
        let en .= &bomb ? 'B': 'N'
    endif
    return en
endfunc

" s:RetError() {{{3
" function to return erromsgs
func! s:RetError() abort
    return get(s:, 'lasterrormsg', '')
endfunc

" Commands {{{2
" :ShowError {{{3
" show last errors
command! -nargs=0 ShowError echo s:RetError()
