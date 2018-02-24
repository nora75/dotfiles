" fold setting {{{1
if has('folding')

    " option of folding {{{2
    let s:leftbar = 4

    " s:removeextra(line,width) {{{2
    " return string removed commentstring,spaces,fold marker
    func! s:removeextra(line) abort
        let line = matchstr(a:line,'\M\S\.\*')
        if line == ''
            return ''
        elseif line =~ '\M\s\*$'
            let ridx = matchend(line,'\M\s\*$')
        else
            let ridx = len(line)
        endif
        let line = strcharpart(line,0,ridx)
        let line = substitute(line,'\M^\s\+\|\s\+$','','g')
        if &fdm ==# 'marker'
            let marks = matchstr(&fmr,'\M\.\+\ze,')
            let marke = matchstr(&fmr,'\M,\zs\.\+')
            let line = substitute(line,'\M\s\*'.marks.'\d\*\|\s\*'.marke.'\s\*','','g')
        endif
        let com = split(&commentstring,'\M%s')
        let com = '\M\s\*'.substitute(join(com,'\s\*\|\s\*'),'\s','','g').'\s\*'
        let line = substitute(line,com,'','g')
        return line
    endfunc

    " MyFoldText() {{{2
    " The function of setting fold text
    function! MyFoldText() abort
        let sub = []
        let line = getline(v:foldstart)
        let off = string(v:foldend-v:foldstart+1).','.v:foldlevel
        let line = s:removeextra(line)
        let width = strwidth(off)
        if &nu
            let width = width + &numberwidth
        endif
        if width + strwidth(line.g:wafuw) >= winwidth(0)
            let long = winwidth(0) - strwidth(off)
            let line = strcharpart(line,0,long)
        else
            let line .= ' '.g:wafuw
        endif
        call insert(sub,line)
        let width = winwidth(0) - ( strwidth(line) + width + len(sub))
        if width > 0 
            let r = s:leftbar + 2
            if width - r > 0
                let right = width - r
                call insert(sub,repeat('-',s:leftbar))
            else
                let right = 0
            endif
            call add(sub,repeat('-',right))
        endif
        call add(sub,off)
        let line = join(sub,' ')
        let long = strwidth(line) - winwidtha(0)
        if long >= 0
            let sub[-2] = sub[-2].repeat('-',long)
        else
            let sub[-2] = strcharpart(sub[-2],0,len(sub[-2])-long)
        endif
        return join(sub,' ')
    endfunction

    " foldtext {{{2
    set foldenable " == fen
    set foldtext=MyFoldText()
    set fdm=marker
    set fmr={{{,}}}
endif
