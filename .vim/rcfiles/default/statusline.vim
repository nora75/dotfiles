set ls=2
set statusline=%!MyStl()

" functions {{{2
" function of setting statusline value {{{3
" number name variable is separator (colorscheme or alignment)
func! MyStl() abort
    call s:col()
    let first = '%<%#StlLeft0# '
    let cwd = StlCwd()
    let waf = ' | '.StlWafu().'  '
    let second = ' %#StlLeft1# %f '
    let mo = s:mod()
    let ro = s:ro()
    let third = '%#None#%='
    let forth = '%#StlRight0#'
    let move = '%{hasmapto("j")?" M ":""}'
    let ff = '%{(&ft!="help")?''| ''.toupper(strcharpart(&ff,-1,2)).'' '':""}'
    let fenc = s:fenc()
    let ft =  '%{"| ".&ft." "}'
    return first.cwd.waf.second.mo.ro.third.forth.move.ff.fenc.ft
endfunc

" functino of cwd {{{3
" return current dir
" only up two directory
" if base directory is different by current directory show where
" if readlink is supported, return actually dir
func! StlCwd() abort
    let fcwd = getcwd()
    let cd = strcharpart(fcwd,-1,2)
    let cwd = matchstr(fcwd,'[^\\]\+\\[^\\]\+$')
    let licwd = split(cwd, '\')
    let i = 0
    while i < len(licwd)
        if len(licwd[i]) > 5
            let licwd[i] = strcharpart(licwd[i],0,5)
        endif
        let i += 1
    endwhile
    let cwd = join(licwd, '\')
    if cd !='C'
        let cd .= ':'
    else
        let cd = ''
    endif
    let cwd = cd.cwd
    return cwd
endfunc

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
" function of wafu {{{3
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

" function of declation colorscheme {{{3
func! s:col() abort
    hi StlLeft0 term=bold gui=bold ctermfg=22 ctermbg=148 guifg=#005f00 guibg=#afdf00
    hi StlLeft1 ctermfg=231 ctermbg=240 guifg=#ffffff guibg=#585858
    hi StlRight0 term=bold gui=bold ctermfg=241 ctermbg=252 guifg=#606060 guibg=#d0d0d0
    hi StlRight1 term=bold gui=bold ctermfg=231 ctermbg=240 guifg=#ffffff guibg=#585858
endfunc

" function of modified {{{3
func! s:mod() abort
    return (&mod)?'| + ':''
endfunc

func! s:ro() abort
    return (&ro)?'| - ':''
endfunc

" function of fenc {{{3
func! s:fenc() abort
    let en = substitute(toupper(&fenc!=''?&fenc:&enc),'\M-','','g')
    if en =~ 'UTF'
        let en .= &bomb ? 'B': 'N'
    endif
    return '| '.en.' '
endfunc

" function to return erromsgs {{{3
func! s:RetError() abort
    return get(s:, 'lasterrormsg', '')
endfunc

" Commands {{{2
" :ShowError {{{3
" show last errors
command! -nargs=0 ShowError echo s:RetError()
