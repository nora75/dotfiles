" Tab jump {{{2
" t1: jump to first(1) tabpage,t2: jump to second(2) tabpage...
for n in range(1, 9)
    execute 'nnoremap <silent> [TabG]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor

" map {{{2

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
" th move tab to left
nnoremap <silent> [TabG]h :<C-u>for i in range(1,v:count1)<Bar>tabm-<Bar>endfor<CR>
" tl move tab to right
nnoremap <silent> [TabG]l :<C-u>for i in range(1,v:count1)<Bar>tabm+<Bar>endfor<CR>
" tj move tab to first
nnoremap <silent> [TabG]k :<C-u>tabm0<CR>
" tk move tab to last
nnoremap <silent> [TabG]j :<C-u>tabm<CR>
nnoremap <silent> [TabG]s :<C-u>call NewTabScratch()<CR>

" vim:set fmr={{{,}}} fdl=1 fdm=marker :
