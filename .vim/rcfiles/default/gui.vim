if has('gui') " {{{2

    " 起動時にフォークをしない
    set guioptions+=f

    " ツールバー非表示
    set guioptions-=T
    " メニューバー非表示
    set guioptions-=m
    " 左右スクロールバー非表示
    set guioptions-=r
    set guioptions-=R
    set guioptions-=l
    set guioptions-=L
    set guioptions-=b

    " guiのタブバー非表示
    set guioptions+=e
    set guitablabel=""

    " カーソルが点滅しないようにする
    set guicursor=a:blinkon0
    "  no mouse
    set mouse+=a

    " 最大化での起動
    augroup gui
        au!
        au GUIEnter * simalt ~x
    augroup END

    syntax enable
    set background=dark
    " if とかにしてもいいかも
    try
        " colorscheme wombat256mod
        colorscheme iceberg
        " colorscheme twilight
    catch
        colorscheme default
    endtry

    " メニューの消去
    " source $VIMRUNTIME/delmenu.vim

    if has('win32')
        " Windows用
        set guifont=MS_Gothic:h12:cSHIFTJIS
        "set guifont=MS_Mincho:h12:cSHIFTJIS
        " 行間隔の設定
        set linespace=1
        " 一部のUCS文字の幅を自動計測して決める
        if has('kaoriya')
            set ambiwidth=auto
        endif
    elseif has('xfontset')
        " UNIX用 (xfontsetを使用)
        set guifontset=a14,r14,k14
    endif

    function! GuiTabLabel() " guitablabel setting func {{{3
        let label = ''
        let bufnrlist = tabpagebuflist(v:lnum)
        " このタブページに変更のあるバッファがるときには '+' を追加する
        for bufnr in bufnrlist
            if getbufvar(bufnr, "&modified")
                let label = '+'
                break
            endif
        endfor

        " ウィンドウが複数あるときにはその数を追加する
        let wincount = tabpagewinnr(v:lnum, '$')
        if wincount > 1
            let label .= wincount
        endif
        if label != ''
            let label .= ' '
        endif

        " バッファ名を追加する
        return label . 
        \substitute(bufname(bufnrlist[tabpagewinnr(v:lnum) - 1]),'^.*\\', '', '')
    endfunction

    set guitablabel=%{GuiTabLabel()}

else " {{{2

    set showtabline=2
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
" タブページ自体を左右に移動させる
" command! -bar TabMoveNext :execute "tabmove " tabpagenr() % tabpagenr("$") + (tabpagenr("$") == tabpagenr() ? 0 : 1)
" command! -bar TabMovePrev :execute "tabmove" (tabpagenr() + tabpagenr("$") - 2) % tabpagenr("$") + (tabpagenr() == 1 ? 1 : 0)

" vim: set fdm=marker fmr={{{,}}} fdl=1 :
