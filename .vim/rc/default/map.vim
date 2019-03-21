" map {{{1
" normal mode {{{2
" command (ex) {{{3
" nnoremap ;                  :
" nnoremap :                  ;
" nmap     q;                 q:<C-u>
" movement {{{3
nnoremap j                  gj
nnoremap k                  gk
nnoremap gj                 j
nnoremap gk                 k
nnoremap <S-Space>          gt
nnoremap <C-Space>          gt
nmap     gl                 gt
nnoremap <S-Tab>            gT
nmap     gh                 gT
nnoremap <Tab>              <Nop>
" <Space>map {{{3
" <Space> <Nop> {{{4
nnoremap <Space>            <Nop>
vnoremap <Space>            <Nop>
nnoremap <BS>               <Nop>
vnoremap <BS>               <Nop>
" nnoremap <CR>               <Nop>
" vnoremap <CR>               <Nop>
" double <Space>
" nnoremap <silent> <Space><Space>     :<C-u>echo SwitchColorScheme()<CR>
" vnoremap <silent> <Space><Space>     :<C-u>echo SwitchColorScheme()<CR>
" misc {{{4
nnoremap <silent> <Space>a           :<C-u>keepjumps norm! ggVG<CR>
nnoremap <silent> <Space>y           :<C-u>call DoBuffer('ggVGy')<CR>
nnoremap <silent> <Space>=           :<C-u>call DoBuffer('gg=G')<CR>
" switch movement {{{4
nnoremap <silent> <Space>sm :<C-u>call SwitchMoves()<CR>
" switch autosave {{{4
nnoremap <silent> <Space>sa :<C-u>call SwitchASave()<CR>
" commands {{{4
nnoremap <silent> <Space>cd          :<C-u>CdCurrent<CR>
nnoremap <Space>e           :<C-u>echo<Space>
nnoremap <Space>r           :<C-u>Comcap<Space>
" map to <Space>o + j,k
nmap     <Space>o           [AppendLine]
nnoremap <silent>           [AppendLine]j       :<C-u>for i in range(1, v:count1)<Bar>call append(line('.'),'')<Bar>endfor<CR>
nnoremap <silent>           [AppendLine]k       :<C-u>for i in range(1, v:count1)<Bar>call append(line('.')-1,'')<Bar>endfor<CR>
" LineMove {{{3
nmap     <Space>l           [LineMove]
nnoremap <silent> [LineMove]j        :<C-u>call <SID>lineMove('j')<CR>
nnoremap <silent> [LineMove]k        :<C-u>call <SID>lineMove('k')<CR>
nnoremap <silent> [LineMove]    <Nop>
" Balnkline {{{3
nmap <Space>d [BlankLine]
nnoremap <silent> [BlankLine] :<C-u>set opfunc=<SID>blankLineOp<CR>g@
nnoremap <silent> [BlankLine]d :<C-u>call <SID>blankLineOp('visual',line('.'),line('.'))<CR>
vnoremap <silent> <Space>d :<C-u>call <SID>blankLineOp('visual',line("'<"),line("'>"))<CR>
nnoremap <silent> [BlankLine]    <Nop>
" search {{{3
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>
nnoremap /          :<C-u>set hlsearch<CR>/
nnoremap ?          :<C-u>set hlsearch<CR>?
nnoremap <silent>*          :<C-u>set hlsearch<CR>*
nnoremap <silent>#          :<C-u>set hlsearch<CR>#
nnoremap <C-h>              :<C-u>help<Space>
" else {{{3
nmap     gw                 <C-W>
nnoremap x                  "_x
nnoremap X                  "_X
vnoremap x                  "_x
vnoremap X                  "_X
nnoremap <Space>x           x
nnoremap <Space>X           X
vnoremap <Space>x           x
vnoremap <Space>X           X
nnoremap <Space>w           :<C-u>w<CR>
vnoremap <Space>w           :<C-u>w<CR>
" nnoremap dl                d2l
nnoremap yy                 y$
" nnoremap cc                 :<C-u>for i in range(1,v:count1)<Bar>call setline(line('.'),'')<Bar>endfor<CR>
nnoremap <silent> <C-p>     "0p
nnoremap <silent> <C-S-p>   "0P
nnoremap J gJ
nnoremap gJ J
" funcion key
nnoremap <silent> <F11>              :<C-u>tabnew<bar>e $vim\file1<bar>silent! exe 'vs $vim\file2'<bar>windo setl bt=nofile noswf noma nobl bh=wipe<bar>windo au WinEnter <bufer> silent! e!<CR>
vnoremap <silent> <F11>              :<C-u>tabnew<bar>e $vim\file1<bar>silent! exe 'vs $vim\file2'<bar>windo setl bt=nofile noswf noma nobl bh=wipe<bar>windo au WinEnter <bufer> silent! e!<CR>
nnoremap <silent> <F1>               :<C-u>ReloadVimrc<CR>
vnoremap <silent> <F1>               :<C-u>ReloadVimrc<CR>
nnoremap <silent> <F3>               :<C-u>Windom norm zR<CR>
vnoremap <silent> <F3>               :<C-u>Windom norm zR<CR>
nnoremap <silent> <F5>               :<C-u>call Rel()<CR>
vnoremap <silent> <F5>               :<C-u>call Rel()<CR>
nnoremap <silent> <F12>              :<C-u>tabe $MYVIMRC<CR>
vnoremap <silent> <F12>              :<C-u>tabe $MYVIMRC<CR>

" help file {{{3
augroup  helpf
    au!
    " au Filetype help nnoremap <buffer> q       <C-w>c
    au Filetype help nnoremap <buffer> <Enter> <C-]>
augroup END

" visual mode {{{2
" command {{{3
" vnoremap ;        :
" vnoremap :        ;
" vmap     q;       q:
" move {{{3
vnoremap j        gj
vnoremap k        gk
vnoremap gj       j
vnoremap gk       k
" switch move {{{4
vnoremap <silent> <Space>sm  :<C-u>call SwitchMoves()<CR>gv
" else {{{3
vnoremap <silent> <C-p>   "0p
vnoremap <silent> <C-S-p> "0P
" don't show message and don't set v:errmsg
try
    vunmap <C-X>
catch
endtry
vnoremap x                  "_x

" command mode {{{2
" ] {{{3
cnoreabbre w]      w
cnoreabbre we      w
cnoreabbre q]      q
cnoreabbre qa]     qa
cnoreabbre tabnew] tabnew
cnoreabbre new]    new
cnoreabbre qq q

" insert mode {{{2
inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>

" practice for vim {{{2

" functions {{{3

" s:rec() {{{4
" start timer and stop timer if already exists
func! s:rec() abort
    if exists('s:n')
        call timer_stop(s:n)
    endif
    let s:n = timer_start(1000,function('<SID>wafun'),{'repeat':5})
    return
endfunc

" s:wafun(...) {{{4
" echo g:wafuw
func! s:wafun(...) abort
    echo g:wafun
    let s:w = timer_start(400,function('<SID>wafuw'))
    return
endfunc

" s:wafuw(...) {{{4
" echo g:wafun and g:wafuw
func! s:wafuw(...) abort
    echo g:wafuw
    return
endfunc

" s:mapkey(k) {{{4
" map key of arg to s:rec()
func! s:mapkey(k,...) abort
    if a:0
        let arg = string(a:000)
        if arg !~ 'n'
            exe 'nnoremap <silent>' a:k ':<C-u>call <SID>rec()<CR>'
        endif
        if arg !~ 'v'
            exe 'vnoremap <silent>' a:k ':<C-u>call <SID>rec()<CR>'
        endif
        if arg !~ 'i'
            exe 'inoremap <silent>' a:k '<C-o>:<C-u>call <SID>rec()<CR>'
        endif
        return
    endif
    exe 'nnoremap <silent>' a:k ':<C-u>call <SID>rec()<CR>'
    exe 'vnoremap <silent>' a:k ':<C-u>call <SID>rec()<CR>'
    exe 'inoremap <silent>' a:k '<C-o>:<C-u>call <SID>rec()<CR>'
    return
endfunc

" s:dontusethiskey() {{{4
" mapping by using s:mapkey()
func! s:dontusethiskey() abort
    call s:mapkey('<Left>')
    call s:mapkey('<Down>')
    call s:mapkey('<Up>')
    call s:mapkey('<Right>')
    call s:mapkey('<PageUp>')
    call s:mapkey('<PageDown>')
    call s:mapkey('<Home>')
    call s:mapkey('<End>')
    call s:mapkey('<Insert>')
    call s:mapkey('<Del>')
    return
endfunc

" map {{{3
call s:dontusethiskey()
" }}}

" change transparency when gui and kaoriya {{{2
if has('gui') && has('kaoriya')
    nnoremap <silent> <Space>+ [TransP]
    nnoremap <silent> <Space>- [TransM]
    nnoremap <silent> [TransP] :<C-u>let &transparency=&transparency+10<CR>
    nnoremap <silent> [TransM] :<C-u>let &transparency=&transparency-10<CR>
endif

" tabmaps {{{2

" Tab jump {{{3
" t1: jump to first(1) tabpage,t2: jump to second(2) tabpage...
for n in range(1, 9)
    execute 'nnoremap <silent> [TabG]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor

" map {{{3

" Tab prefix key.
nmap     <Space>t [TabG]

" tI make new tab at last
nnoremap <silent> [TabG]I :<C-u>tabl<Bar>tabnew<CR>
" tx close! current tab
nnoremap <silent> [TabG]x :<C-u>try<Bar>tabc!<Bar>catch<Bar>qa!<Bar>endtry<CR>
" tc same as above one
nnoremap <silent> [TabG]c :<C-u>try<Bar>tabc<Bar>catch<Bar>qa<Bar>endtry<CR>
" tn go to next tab
" nnoremap <silent> [TabG]n :tabnext<CR>
" tp go to previous tab
" nnoremap <silent> [TabG]p :tabprevious<CR>
" ti make tab at next by current tab
nnoremap <silent> [TabG]i :<C-u>tabnew<CR>
" tn make tab at next by current tab
nnoremap <silent> [TabG]n :<C-u>tabnew<CR>
" th move tab to left
nnoremap <silent> [TabG]h :<C-u>for i in range(1,v:count1)<Bar>tabm-<Bar>endfor<CR>
" tl move tab to right
nnoremap <silent> [TabG]l :<C-u>for i in range(1,v:count1)<Bar>tabm+<Bar>endfor<CR>
" tj move tab to first
nnoremap <silent> [TabG]k :<C-u>tabm0<CR>
" tk move tab to last
nnoremap <silent> [TabG]j :<C-u>tabm<CR>
nnoremap <silent> [TabG]s :<C-u>call NewTabScratch()<CR>

" BlankLine function {{{2
" operator func for blankline mapping
func! s:blankLineOp(type,...) abort
    if a:type ==# 'char'
        let [line1,line2] = [getpos("'[")[2],getpos("']")[2]]
        let culi = getline(line('.'))
        let afli = strcharpart(culi,0,line1-1).repeat('',line2-line1).strcharpart(culi,line2+1)
        call setline(line('.'),afli)
    elseif a:type ==# 'visual'
        let [line1,line2] = [a:1,a:2]
        for i in range(line1,line2)
            call setline(i,'')
        endfor
    else
        let [line1,line2] = [line("'["),line("']")]
        for i in range(line1,line2)
            call setline(i,'')
        endfor
    endif
    return
endfunc

" LineMove function {{{2
" function for linemove mapping
func! s:lineMove(type) abort
    let line1 = line('.')
    if a:type == 'j'
        let line2 = line1 + 1
        if line2 == line('$')
            return
        endif
    else
        let line2 = line1 - 1
        if line2 == 0
            return
        endif
    endif
    let bline = getline(line1)
    let aline = getline(line2)
    let old_undolevels = &undolevels
    setl undolevels=-1
    call setline(line2,bline)
    call setline(line1,aline)
    exe 'keepjumps norm '.a:type
    let &undolevels = old_undolevels
    return
endfunc

" }}}

" vim: set fdm=marker fdl=1 fmr={{{,}}} :
