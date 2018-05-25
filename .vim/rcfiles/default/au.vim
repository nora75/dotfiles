" variables {{{1
" declation of tempname
let s:tmpn = { 'count' : '1' }

" functions {{{1
" s:lock() abort {{{2
" lock current tmp file
func! s:lock(co) abort
    exe 'let s:tmpn.file'.a:co.'.lock = v:true'
    let s:tmpn.last = a:co
    return
endfunc

" s:checklock() abort {{{2
" check are all tmp file locked
func! s:checklock() abort
    let i = 1
    let flag = v:false
    while (i < s:tmpn.count)
        if get(eval('s:tmpn.file'.i),'lock') == v:false
            break
        endif
        let i += 1
    endwhile
    return i
endfunc

" s:unlock(co) abort {{{2
" unlock current tmp file
func! s:unlock(co) abort
    %d_
    exe 'let s:tmpn.file'.a:co.'.lock = v:false'
    return
endfunc

" s:gettmpn() abort {{{2
" get tmp name from s:tmpn
func! s:gettmpn() abort
    let co = s:checklock()
    if co == s:tmpn.count
        call s:mktmp()
    endif
    let ret = get(eval('s:tmpn.file'.co),'name')
    call s:lock(co)
    return [ret,co]
endfunc

" s:getlast() abort {{{2
" get last locked s:tmpn
func! s:getlast() abort
    let tmpn = s:tmpn.ls
    return tmpn
endfunc

" s:mktmp() abort {{{2
" make new tmp file and lock it
func! s:mktmp() abort
    exe 'let s:tmpn.file'.get(s:tmpn,'count') '= {}'
    exe 'let s:tmpn.file'.get(s:tmpn,'count').'.name'.' = tempname()'
    let s:tmpn.count += 1
    return
endfunc

" s:delalltmp() abort {{{2
" delete all maked tmp file
func! s:delalltmp() abort
    let i = 0
    while i < s:tmpn.count
        call delete(get(eval('s:tmpn.file'.co),'name'))
    endwhile
    return
endfunc

" s:Pdftxt() {{{2
" exe au BufreadPost *.pdf
" optional argument is used when execute file needs output file earier than
" input in argument and optional command only must use in the execute file
func! s:Pdftxt() abort
    let input = ' "%"'
    " if v:true
    " endif
    let [tmpn,co] = s:gettmpn()
    if executable('pdftotext')
        let vexe = 'pdftotext -nopgbrk -enc UTF-8 -eol unix -q '.input.' '.tmpn
    elseif executable('mutool')
        let vexe = 'mutool draw -F txt -o '.tmpn.' '.input
    else
        echohl WarningMsg
        echo "Vim can't convert pdf to text.Because You don't have pdftotext or mutool"
        echohl NONE
        return
    endif
    exe 'silent !'.vexe
    exe 'e' tmpn
    return co
endfunc

" s:au(co) {{{2
" declare autocmd in current buffer
func! s:au(co) abort
    silent! exe 'g//d_'
    if getline(1,line('$')) ==# ['']
        echohl WarningMsg
        echo "Vim can't convert pdf to text.Because this file's format isn't support"
        echohl NONE
    else
        %center
        silent 1
        setl bt=nofile noswf nobl bh=wipe ft=pdf
        exe 'au BufWipeOut <buffer> call <SID>unlock('.a:co.')'
    endif
    return
endfunc

" au groups {{{1
aug Myau " {{{2
    au!
    " read pdf {{{3
    au BufReadPost *.pdf silent call s:au(s:Pdftxt())
    au VimLeave call s:delalltmp()
aug END

" augroup backup take backup by name{{{1
"     au!
"     autocmd BufWritePre * let &bex = '.' . strftime("%Y%m%d")
" augroup END

" BinaryXXD {{{2
" from web site
augroup BinaryXXD 
    autocmd!
    autocmd BufReadPre *.bin let &binary =1
    autocmd BufReadPost * if &binary | silent %!xxd -g 1
    autocmd BufReadPost * set ft=xxd | endif
    autocmd BufWritePre * if &binary | %!xxd -r | endif
    autocmd BufWritePost * if &binary | silent %!xxd -g 1
    autocmd BufWritePost * set nomod | endif
augroup END

" vim: set fdm=marker fdl=1 fmr={{{,}}} :
