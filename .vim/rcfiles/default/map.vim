" map {{{1
" normal {{{2
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
nnoremap <Space>            <Nop>
" yank select all {{{4
nnoremap <silent> <Space>a           ggVG
nnoremap <silent> <Space>y           :<C-u>call DoNormal('ggVGy')<CR>
nnoremap <silent> <Space>=           :<C-u>call DoNormal('gg=G')<CR>
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
nnoremap     <F1>               :<C-u>ReloadVimrc<CR>
vnoremap     <F1>               :<C-u>ReloadVimrc<CR>
if has('gui')
    nnoremap     <F2>               :<C-u>RestartVim<CR>
    vnoremap     <F2>               :<C-u>RestartVim<CR>
endif
nnoremap     <F3>               :<C-u>Windom norm zR<CR>
vnoremap     <F3>               :<C-u>Windom norm zR<CR>
nnoremap     <F5>               :<C-u>e!<CR>
vnoremap     <F5>               :<C-u>e!<CR>
nnoremap <F12>              :<C-u>tabe $MYVIMRC<CR>
vnoremap <F12>              :<C-u>tabe $MYVIMRC<CR>

" help file {{{3
augroup  helpf
    au!
    au Filetype help nnoremap <buffer> q<Space>       <C-w>c
    au Filetype help nnoremap <buffer> <Enter> <C-]>
augroup END

" visual {{{2
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

" command {{{2
cnoreabbre w]      w
cnoreabbre q]      q
cnoreabbre qa]     qa
cnoreabbre tabnew] tabnew
cnoreabbre new]    new

" insert{{{2
inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>

" no CursorKey {{{2
nnoremap <Up>    :<C-u>qa!<CR>
nnoremap <Down>  :<C-u>qa!<CR>
nnoremap <Left>  :<C-u>qa!<CR>
nnoremap <Right> :<C-u>qa!<CR>
vnoremap <Up>    :<C-u>qa!<CR>
vnoremap <Down>  :<C-u>qa!<CR>
vnoremap <Left>  :<C-u>qa!<CR>
vnoremap <Right> :<C-u>qa!<CR>
inoremap <Up>    <ESC>:<C-u>qa!<CR>
inoremap <Down>  <ESC>:<C-u>qa!<CR>
inoremap <Left>  <ESC>:<C-u>qa!<CR>
inoremap <Right> <ESC>:<C-u>qa!<CR>

" vim: set fdm=marker fdl=1 fmr={{{,}}} :
