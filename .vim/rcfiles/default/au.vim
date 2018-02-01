aug Myau
    au!
    " au FileType help exe 'normal \<C-w>='
    if executable('mutool')
        au BufReadPost *.pdf silent exe '!mutool draw -F txt -o pftxt.txt "%"'
\ |e pftxt.txt
\ |g//d_
\ |setl bt=nofile noswf nobl bh=wipe ft=pdf
\ |au BufWipeout <buffer> call delete('%')
    else
        au BufReadPost *.pdf silent exe '%!"C:\Users\NORA\Programfile(x86)\mupdf-1.11-windows\mutool.exe" draw -F txt "C:\Users\NORA\Programfile(x86)\mupdf-1.11-windows\mupdf_explored.pdf"'
\ |e pftxt.txt
\ |g//d_
\ |setl bt=nofile noswf nobl bh=wipe ft=pdf
\ |au BufWipeout <buffer> call delete(expand('%'))
    endif
aug END
"
" aug debug
"     au!
"     au BufEnter C:\Program Files\vim80-kaoriya-win64\file cnoremap <buffer> q q!|bd! bufnr('%')delete(expand('%:p'))
" aug end
