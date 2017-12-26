" map {{{1
" normal {{{2
" command (ex) {{{3
nnoremap ;                  :
nnoremap :                  ;
nmap     q;                 q:
" movement {{{3
nnoremap j                  gj
nnoremap k                  gk
nnoremap gj                 j
nnoremap gk                 k
nnoremap <S-Space>          gt
nnoremap <S-Tab>            gT
" <Space>map {{{3
nnoremap <Space>            <Nop>
nnoremap <Space>a           ggVG
nnoremap <Space>y           :<C-u>call DoNormal('ggVGy')<CR>
nnoremap <Space>=           :<C-u>call DoNormal('gg=G')<CR>
nnoremap <silent> <Space>sm  :<C-u>call SwitchMoves()<CR>
nnoremap <Space>cd          :<C-u>CdCurrent<CR>
nnoremap <Space>e           :<C-u>echo<Space>
" map to <Space>o + j,k
nmap     <Space>o           [BlankLine]
nnoremap <silent> [BlankLine]j :<C-u>for i in range(1, v:count1) <Bar> call append(line('.'), '') <Bar> endfor <CR>
nnoremap <silent> [BlankLine]k :<C-u>for i in range(1, v:count1) <Bar> call append(line('.')-1, '') <Bar> endfor <CR>
" LineMove {{{3
nmap     <Space>l           [LineMove]
nnoremap [LineMove]         <Nop>
nmap     [LineMove]j        dd]p
nmap     [LineMove]k        ddk[p
" search {{{3
nnoremap <silent><Esc><Esc> :<C-u>set  nohlsearch!<CR>
nnoremap /                  :<C-u>set  hlsearch<CR>/
nnoremap ?                  :<C-u>set  hlsearch<CR>?
nnoremap *                  :<C-u>set  hlsearch<CR>*
nnoremap #                  :<C-u>set  hlsearch<CR>#
nnoremap <C-h>              :<C-u>help<Space>
" else {{{3
nmap     gw                 <C-W>
nnoremap x                  "_x
nnoremap X                  "_X
nnoremap <silent><C-p>      "0p
nnoremap <silent><C-S-p>    "0P

" helpファイル {{{3
augroup  helpf
    au!
    au Filetype help nnoremap <buffer> q       <C-w>c
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
vnoremap <silent> <C-p>   "0p<CR>
vnoremap <silent> <C-S-p> "0P<CR>

" command {{{2
cnoreabbre w]       w
cnoreabbre tabnew]       tabnew
cnoreabbre new]       new

" insert{{{2
inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>

" no CursorKey {{{2
vnoremap <Up>    :<C-u>qa!<CR>
vnoremap <Down>  :<C-u>qa!<CR>
vnoremap <Left>  :<C-u>qa!<CR>
vnoremap <Right> :<C-u>qa!<CR>
nnoremap <Up>    :<C-u>qa!<CR>
nnoremap <Down>  :<C-u>qa!<CR>
nnoremap <Left>  :<C-u>qa!<CR>
nnoremap <Right> :<C-u>qa!<CR>
inoremap <Up>    <ESC>:<C-u>qa!<CR>
inoremap <Down>  <ESC>:<C-u>qa!<CR>
inoremap <Left>  <ESC>:<C-u>qa!<CR>
inoremap <Right> <ESC>:<C-u>qa!<CR>

" vim: set fdm=marker fdl=1 fmr={{{,}}} :
