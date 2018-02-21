" functions {{{1
" s:Pdftxt(exe,...) {{{2
" exe au BufreadPost *.pdf
" optional argument is used when execute file needs output file earier than
" input in argument and optional command only must use in the execute file
func! s:Pdftxt() abort
    let input = ' "%"'
    let tmpn = tempname()
    if executable('pdftotext')
        let vexe = 'pdftotext -nopgbrk -layout -enc UTF-8 -eol unix -q '.input.tmpn
    elseif executable('mutool')
        let vexe = 'mutool draw -F txt -o '.tmpn.input
    else
        echohl WarningMsg
        echo "Vim can't convert pdf to text.Because You don't have pdftotext or mutool"
        echohl NONE
        return
    endif
    exe 'silent !'.vexe
    exe 'e' tmpn
    call s:au(tmpn)
    return
endfunc

" s:au(tmpn) {{{2
" declare autocmd in current buffer
func! s:au(tmpn) abort
    if filereadable(a:tmpn) && getftype(a:tmpn) == 'file' && expand('%:t') ==# a:tmpn
        silent! exe 'g//d_'
        silent 1
        setl bt=nofile noswf nobl bh=wipe ft=pdf
        au BufWipeOut <buffer> call delete(expand("<afile>"))'
    else
        echohl WarningMsg
        echo 'an error occur while convert pdf to txt'
        echohl NONE
    endif
    return
endfunc

" au groups {{{1
aug Myau " {{{2
    au!
    " read pdf {{{3
        au BufReadPost *.pdf silent call s:Pdftxt()
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
