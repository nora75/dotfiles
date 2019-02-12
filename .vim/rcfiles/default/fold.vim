" fold setting {{{1
" initialize {{{2
if !has('folding')
    finish
endif
if !exists('g:wafun')
    if has('win32') || has('win64')
        "exe 'source '.expand('%:h').'\wafu.vim'
        source ~\.vim\rcfiles\default\wafu.vim
    else
        source ~/.vim/rcfiles/default/wafu.vim
        "exe 'source '.expand('%:h').'/wafu.vim'
    endif
endif

" script variables of folding {{{2
let s:leftbar = 4

" s:removeextra(line,width) {{{2
" return string removed commentstring,spaces,fold marker
func! s:removeextra(line) abort
    let line = matchstr(a:line,'\M\S\.\*')
    if line == ''
        return ''
    elseif line =~ '\M\s\*$'
        let ridx = matchend(line,'\M\s\*$')
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
    let off = '['.string(v:foldend-v:foldstart+1).','.v:foldlevel.']'
    let line = s:removeextra(line)
    call add(sub,repeat('-',s:leftbar))
    call add(sub,line)
    call add(sub,g:wafuw)
    call add(sub,off)
    let width = strwidth(off) + s:leftbar
    if &nu
        let width += &numberwidth
    endif
    let flag = v:false
    let wwidth = strdisplaywidth(g:wafuw)
    let long = winwidth(0) - width - wwidth
    let width += strdisplaywidth(line) + wwidth + len(sub)-1
    if width >= winwidth(0)
        let long -= wwidth
        let flag = v:true
    endif
    let line = strcharpart(line,0,long)
    if flag
        call remove(sub,2)
    endif
    let width = winwidth(0) - (strdisplaywidth(join(sub,' '))-1)
    if width > 0
        let r = s:leftbar + 2
        if width - r > 0
            let right = width - r
        else
            let right = 0
        endif
        call insert(sub,repeat('-',right),-1)
    endif
    let line = join(sub,' ')
    let long = winwidth(0) - strdisplaywidth(line)
    if long >= 0
        let sub[-1] = sub[-1].repeat('-',long)
    else
        let sub[-1] = strcharpart(sub[-1],0,len(sub[-1])-long)
    endif
    return join(sub,' ')
endfunction

" foldtext {{{2
set foldenable " == fen
set foldtext=MyFoldText()
set fdm=marker
set fmr={{{,}}}
