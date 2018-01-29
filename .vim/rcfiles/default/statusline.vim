set ls=2
set statusline=%!MyStl()

func! MyStl() abort
    call s:col()
    let first = '%<%#StlLeft0# '
    let cwd = s:cwd()
    let second = ' %#StlLeft1# %f '
    let mo = s:mod()
    let ro = s:ro()
    let third = '%#None#%='
    let waf = '%#StlLeft0# '.StlWafu().'  '
    let move = '%{hasmapto("j")&&(&ft!="unite")?"M":""}'
    let ff = '%#StlRight0#%{(&ft!="help")?'' ''.toupper(strcharpart(&ff,-1,2)).'' '':""}'
    let fenc = s:fenc()
    let ft =  '%{"| ".&ft." "}'
    return first.cwd.second.mo.ro.third.waf.move.ff.fenc.ft
endfunc

func! s:cwd() abort
    let cd = strcharpart(getcwd(),-1,2)
    let cwd = matchstr(getcwd(),'[^\\]\+\\[^\\]\+$')
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
\ wafuw ,
\ wafuw ,
\ wafuw ,
\ wafuw ,
\ ]
let s:wafuerr = [ 
\ wafue ,
\ wafue ,
\ wafue ,
\ wafue ,
\ ]

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

func! s:col() abort
    hi StlLeft0 term=bold gui=bold ctermfg=22 ctermbg=148 guifg=#005f00 guibg=#afdf00
    hi StlLeft1 ctermfg=231 ctermbg=240 guifg=#ffffff guibg=#585858
    hi StlRight0 term=bold gui=bold ctermfg=241 ctermbg=252 guifg=#606060 guibg=#d0d0d0
    hi StlRight1 term=bold gui=bold ctermfg=231 ctermbg=240 guifg=#ffffff guibg=#585858
endfunc

func! s:mod() abort
    return (&mod)?'| + ':''
endfunc

func! s:ro() abort
    return (&ro)?'| - ':''
endfunc

func! s:fenc() abort
    let en = substitute(toupper(&fenc!=''?&fenc:&enc),'\M-','','g')
    if en =~ 'UTF'
        let en .= &bomb ? 'B': 'N'
    endif
    return '| '.en.' '
endfunc
