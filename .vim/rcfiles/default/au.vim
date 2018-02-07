" functions {{{1
" s:Pdftxt(exe,...) {{{2
" exe au BufreadPost *.pdf
" optional argument is used when execute file needs output file earier than
" input in argument and optional command only must use in the execute file
func! s:Pdftxt(exe,...) abort
    let voutput = ' "$vim\%:t:r.pdftxt"'
    let loutput = ' "%:p:r.pdftxt"'
    let input = ' "%"'
    if a:0
        let vexe = a:exe.a:1.voutput.input."'"
        let lexe = a:exe.a:1.loutput.input."'"
    else
        let vexe = a:exe.input.voutput."'"
        let lexe = a:exe.input.loutput."'"
    endif
    let vexe .= '|exe "e $vim\%:t:r.pdftxt"'
    let lexe .= '|exe "e %:p:r.pdftxt"'
    if a:0 > 1
        let vexe .= '|'.a:2
        let lexe .= a:2
    endif
    exe 'au BufReadPost *.pdf if filereadable(expand("%:p:r").".pdftxt")
    \|exe ''silent !'.vexe.'
    \|else|exe ''silent !'.lexe.'
    \|endif
    \|silent 1
    \|setl bt=nofile noswf nobl bh=wipe ft=pdf
    \|au BufWinLeave <buffer> call delete(expand("%"))'
    return
endfunc

" au groups {{{1
aug Myau " {{{2
    au!
    " read pdf {{{3
    if executable('pdftotext')
        silent call s:Pdftxt('pdftotext -nopgbrk -layout -enc UTF-8 -eol unix -q')
    elseif executable('mutool')
        silent call s:Pdftxt('mutool draw -F txt',' -o','exe "g//d_"')
    else
        au BufReadPost *.pdf echo "Vim can't convert pdf to text.Because You don't have pdftotext or mutool"
    endif
aug END

" augroup backup take backup by name{{{1
"     au!
"     autocmd BufWritePre * let &bex = '.' . strftime("%Y%m%d")
" augroup END


" aug debug {{{2
"     au!
"     au BufEnter C:\Program Files\vim80-kaoriya-win64\file cnoremap <buffer> q q!|bd! bufnr('%')delete(expand('%:p'))
" aug end

" vim: set fdm=marker fdl=1 fmr={{{,}}} :
