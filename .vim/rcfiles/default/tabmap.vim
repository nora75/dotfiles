" Tab jump {{{2
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ
for n in range(1, 9)
  execute 'nnoremap <silent> [TabG]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor

" map {{{2

" Tab prefix key.
nnoremap [TabG]   <Nop>
nmap     <Space>t [TabG]

" tI make new tab at last
nnoremap <silent> [TabG]I :<C-u>tablast <bar> tabnew<CR>
" tx close current tab
nnoremap <silent> [TabG]x :<C-u>tabclose<CR>
" tc same as above one
nnoremap <silent> [TabG]c :<C-u>tabclose<CR>
" tn go to next tab
" nnoremap <silent> [TabG]n :<C-u>tabnext<CR>
" tp go to previous tab
" nnoremap <silent> [TabG]p :<C-u>tabprevious<CR>
" ti make tab at next by current tab
nnoremap <silent> [TabG]i :<C-u>tabnew<CR>
" th move tab to left
nnoremap <silent> [TabG]h :<C-u>tabmove-<CR>
" tl move tab to right
nnoremap <silent> [TabG]l :<C-u>tabmove+<CR>
" tj move tab to first
nnoremap <silent> [TabG]j :<C-u>tabmove0<CR>
" tk move tab to last
nnoremap <silent> [TabG]k :<C-u>tabmove<CR>

" vim:set fmr={{{,}}} fdl=1 fdm=marker :
