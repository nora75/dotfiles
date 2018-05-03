" map {{{1
" normal mode {{{2
" command (ex) {{{3
nnoremap ;                  :<C-u>
nnoremap :                  ;
nmap     q;                 q:<C-u>
" movement {{{3
nnoremap j                  gj
nnoremap k                  gk
nnoremap gj                 j
nnoremap gk                 k
nnoremap <S-Space>          gt
nnoremap <S-Tab>            gT
" <Space>map {{{3
" <Space> <Nop> {{{4
nnoremap <Space>            <Nop>
" yank select all {{{4
nnoremap <silent> <Space>a           :<C-u>keepjumps norm! ggVG<CR>
nnoremap <silent> <Space>y           :<C-u>call DoBuffer('ggVGy')<CR>
nnoremap <silent> <Space>=           :<C-u>call DoBuffer('gg=G')<CR>
" switch movement {{{4
nnoremap <silent> <Space>sm :<C-u>call SwitchMoves()<CR>
" commands {{{4
nnoremap <silent> <Space>cd          :<C-u>CdCurrent<CR>
nnoremap <Space>e           :<C-u>echo<Space>
nnoremap <Space>r           :<C-u>Comcap<Space>
" map to <Space>o + j,k
nmap     <Space>o           [BlankLine]
nnoremap <silent>           [BlankLine]j       :<C-u>for i in range(1, v:count1)<Bar>call append(line('.'),   '')<Bar>endfor<CR>
nnoremap <silent>           [BlankLine]k       :<C-u>for i in range(1, v:count1)<Bar>call append(line('.')-1, '')<Bar>endfor<CR>
" LineMove {{{3
nmap     <Space>l           [LineMove]
nnoremap [LineMove]         <Nop>
nmap     [LineMove]j        dd]p
nmap     [LineMove]k        ddk[p
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
nnoremap dl                 d2l
nnoremap yy                 y$
nnoremap <silent> <C-p>     "0p
nnoremap <silent> <C-S-p>   "0P
nnoremap J gJ
nnoremap gJ J
" funcion key
nnoremap <F11>              :<C-u>tabnew<bar>e $vim\file1<Bar>silent! exe 'vs $vim\file2'<Bar>windo setl bt=nofile noswf noma nobl bh=wipe<bar><CR>
vnoremap <F11>              :<C-u>tabnew<bar>e $vim\file1<Bar>silent! exe 'vs $vim\file2'<Bar>setl bt=nofile noswf noma nobl bh=wipe<bar><CR>
nnoremap <F1>               :<C-u>ReloadVimrc<CR>
vnoremap <F1>               :<C-u>ReloadVimrc<CR>
nnoremap <F3>               :<C-u>Windom norm zR<CR>
vnoremap <F3>               :<C-u>Windom norm zR<CR>
nnoremap <F5>               :<C-u>e!<CR>
vnoremap <F5>               :<C-u>e!<CR>
nnoremap <F12>              :<C-u>tabe $MYVIMRC<CR>
vnoremap <F12>              :<C-u>tabe $MYVIMRC<CR>

" help file {{{3
augroup  helpf
    au!
    au Filetype help nnoremap <buffer><nowait> q       <C-w>c
    au Filetype help nnoremap <buffer> <Enter> <C-]>
augroup END

" visual mode {{{2
" command {{{3
vnoremap ;        :
vnoremap :        ;
vmap     q;       q:
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
cnoreabbre q]      q
cnoreabbre qa]     qa
cnoreabbre tabnew] tabnew
cnoreabbre new]    new
cnoreabbre qq q

" insert mode {{{2
inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>

" practice for vim {{{2

" s:rec() {{{3
" start timer and stop timer if already exists
func! s:rec() abort
    " for i in range(0,10)
    if exists('s:n')
        call timer_stop(s:n)
    endif
    let s:n = timer_start(1000,function('<SID>wafun'),{'repeat':5})
    " endfor
    return
endfunc

" s:wafun(...) {{{3
" echo g:wafuw
func! s:wafun(...) abort
    echo g:wafun
    let s:w = timer_start(400,function('<SID>wafuw'))
    return
endfunc

" s:wafuw(...) {{{3
" echo g:wafun and g:wafuw
func! s:wafuw(...) abort
    echo g:wafuw
    return
endfunc

" s:mapkey(k) {{{3
" map key of arg to s:rec()
func! s:mapkey(k) abort
    exe 'nnoremap <silent>' a:k ':<C-u>call <SID>rec()<CR>'
    exe 'vnoremap <silent>' a:k ':<C-u>call <SID>rec()<CR>'
    exe 'inoremap <silent>' a:k '<ESC>:<C-u>call <SID>rec()<CR>'
    return
endfunc

" s:dontusethiskey() {{{3
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
" }}}
" }}}

" vim: set fdm=marker fdl=1 fmr={{{,}}} :

