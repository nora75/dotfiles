if has('gui') " options for gvim {{2
    " don't fork when start
    set guioptions+=f
    " don't show tool bar
    set guioptions-=T
    " don't show menu bar
    set guioptions-=m
    " don't show any scroll bar
    set guioptions-=r
    set guioptions-=R
    set guioptions-=l
    set guioptions-=L
    set guioptions-=b
    " don't show gui tab label
    " set guioptions+=e
    " set guitablabel=''

    " don't blink coursor
    set guicursor=a:blinkon0
    "  no mouse
    set mouse+=a

    " Maximize when starting gui vim
    augroup gui
        au!
        au GUIEnter * simalt ~x
    augroup END

    syntax enable
    set background=dark
    " change to if statement
    try
        " colorscheme wombat256mod
        " colorscheme iceberg
        colorscheme twilight
    catch
        colorscheme default
    endtry

    if has('win32')
        " for windows
        " set guifont=MS_Gothic:h12:cSHIFTJIS
        " set guifont=MS_Mincho:h12:cSHIFTJIS
        set guifont=Myrica_M:h12:cSHIFTJIS
        " set guifont=MyricaM_M:h12:cSHIFTJIS
        " want use directx, but move very slow in my device
        " if v:version >= 800
        "     let s:gf = &guifont
        "     if s:gf =~? '\M^MS'
        "         set rop=type:directx,gamma:3.4,contrast:6.0,geom:2,renmode:2,level:1.0,taamode:1
        "     elseif s:gf =~ '\M^Myrica'
        "         set rop=type:directx,gamma:0.0,contrast:0.0,geom:2,renmode:1,level:1.0,taamode:1
        "     else
        "         set rop=
        "     endif

        " endif
        " set line space(vertical)
        set linespace=1
        " Automatically measure the width of some UCS characters and decide
        if has('kaoriya')
            set ambiwidth=auto
        endif
    elseif has('xfontset')
        " for unix
        set guifontset=a14,r14,k14
    endif

    function! GuiTabLabel() " guitablabel setting func {{{3
        let label = ''
        let bufnrlist = tabpagebuflist(v:lnum)
        " add '+' when modified
        for bufnr in bufnrlist
            if getbufvar(bufnr, '&modified')
                let label = '+'
                break
            endif
        endfor

        " add number of windows when open multiple windows
        let wincount = tabpagewinnr(v:lnum, '$')
        if wincount > 1
            let label .= wincount
        endif
        if label !=#''
            let label .= ' '
        endif

        " add bufer name
        return label . 
        \substitute(bufname(bufnrlist[tabpagewinnr(v:lnum) - 1]),'^.*\\', '', '')
    endfunction

    set guitablabel=%{GuiTabLabel()}

else " {{{2

    syntax on
    set background=dark

    function! s:SID_PREFIX()
        return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
    endfunction

    " Set tabline.{{{3
    function! s:my_tabline()
        let s = ''
        for i in range(1, tabpagenr('$'))
            let bufnrs = tabpagebuflist(i)
            let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
            let no = i  " display 0-origin tabpagenr.
            let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
            let title = fnamemodify(bufname(bufnr), ':t')
            let title = '[' . title . ']'
            let s .= '%'.i.'T'
            let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
            let s .= no . ':' . title
            let s .= mod
            let s .= '%#TabLineFill# '
        endfor
        let s .= '%#TabLineFill#%T%=%#TabLine#'
        return s
    endfunction

    let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
    " }}}
endif
" move tabpage command
" command! -bar TabMoveNext :execute 'tabmove ' tabpagenr() % tabpagenr('$') + (tabpagenr('$') == tabpagenr() ? 0 : 1)
" command! -bar TabMovePrev :execute 'tabmove' (tabpagenr() + tabpagenr('$') - 2) % tabpagenr('$') + (tabpagenr() == 1 ? 1 : 0)

" vim: set fdm=marker fmr={{{,}}} fdl=1 :
