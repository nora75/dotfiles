scriptencoding utf-8

" declaration of wafu and mugyu {{{2

if exists('g:wafun')
    finish
endif

let g:echostr = []
let g:echoerrlong = []
let g:echoerrshort = []

let g:wafun = '(>ω<)'
let g:wafuw = '(>ω<)/ わふーっ！'
let g:wafuel = '(>ω<) わふーっ! しすてむ・えらーですーっ!'
let g:wafues = '(>ω<) えらーですーっ!'

let i = 0
while i < 6
    call add(g:echostr,g:wafun)
    call add(g:echoerrshort,g:wafun)
    call add(g:echoerrlong,g:wafun)
    let i += 1
endwhile
let i = 0
while i < 6
    call add(g:echostr,g:wafuw)
    call add(g:echoerrshort,g:wafues)
    call add(g:echoerrlong,g:wafuel)
    let i += 1
endwhile

let g:mugyun = 'むぎゅ～～～♪'
let g:mugyuw = 'むぎゅーーー!'
let g:mugyuel = 'むぎぃぃぃぃ...むぎぎぃぃーーーー'
let g:mugyues = 'むぎゅ?'

let i = 0
while i < 6
    call add(g:echostr,g:mugyun)
    call add(g:echoerrshort,g:mugyun)
    call add(g:echoerrlong,g:mugyun)
    let i += 1
endwhile
let i = 0
while i < 6
    call add(g:echostr,g:mugyuw)
    call add(g:echoerrshort,g:mugyues)
    call add(g:echoerrlong,g:mugyuel)
    let i += 1
endwhile
