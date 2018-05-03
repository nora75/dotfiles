scriptencoding utf-8

" declaration of wafu {{{2
if exists('g:wafun')
    finish
endif

let g:wafun = '(>ω<)'
" let g:wafun = '(>ω<)           '
let g:wafuw = '(>ω<)/ わふーっ！'
let g:wafuel = '(>ω<) わふーっ! しすてむ・えらーですーっ!'
let g:wafues = '(>ω<) えらーですーっ!'
" let g:wafun = '(>ω<)                                   '
" let g:wafuw = '(>ω<)/わふーっ！                        '
" let g:wafue = '(>ω<)わふーっ! しすてむ・えらーですーっ!'
let g:wafustr = []
let g:wafuerrlong = []
let g:wafuerrshort = []
let i = 0
while i < 6
    call add(g:wafustr,wafun)
    call add(g:wafuerrshort,wafun)
    call add(g:wafuerrlong,wafun)
    let i += 1
endwhile
let i = 0
while i < 6
    call add(g:wafustr,g:wafuw)
    call add(g:wafuerrshort,g:wafues)
    call add(g:wafuerrlong,g:wafuel)
    let i += 1
endwhile
