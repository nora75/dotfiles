" aug Myau
"     au!
"     au FileType help exe 'normal \<C-w>='
" aug END
"
" aug debug
"     au!
"     au BufEnter C:\Program Files\vim80-kaoriya-win64\file cnoremap <buffer> q q!|bd! bufnr('%')delete(expand('%:p'))
" aug end
