if neobundle#is_installed("lightline.vim")
    " show always
    set laststatus=2
    " g:lightline {{{2
    let g:lightline = { 'active' : { 'left' : [ [ 'mycwd' , 'mycurfiledir' ] ,
    \ [ 'myfilename', 'modified' , 'readonly' ] ],
    \ 'right' : [ [ 'myfileformat', 'myfileencoding', 'myfiletype' ] , [ 'myunite' ] , [ 'mymovement' , 'mymdtoc' ] , [ 'mylastsearch' ] ] } ,
    \ 'inactive' : {
    \ 'left' : [ [ 'mycurfiledir' , 'myfilename', 'modified' , 'readonly' ] ] ,
    \ 'right' : [ [ 'lineinfo' ] , [ 'percent' ] ] } ,
    \ 'tabline' : {
    \ 'left' : [ [ 'tabs' ] ] ,
    \ 'right' : [ [ 'close' ] ] } ,
    \ 'tab' : {
    \ 'active' : [ 'tabnum' , 'filename' , 'modified' ] ,
    \ 'inactive' : [ 'tabnum' , 'filename' , 'modified' ] } ,
    \ 'colorscheme' : 'Tommorow_Night' ,
    \ 'component_function' : {
    \ 'mycurfiledir' : 'LightlineCurFileDir' ,
    \ 'mycwd' : 'LightlineCwd' ,
    \ 'myfileencoding' : 'LightlineFileEncoding' ,
    \ 'myfileformat' : 'LightlineFileFormat' ,
    \ 'myfilename' : 'LightlineFileName' ,
    \ 'myfiletype' : 'LightlineFileType' ,
    \ 'mylastsearch' : 'LightlineLastSearch' ,
    \ 'mymdtoc' : 'LightlineMdtoc' ,
    \ 'myunite' : 'LightlineUnite' ,
    \ 'mymovement' : 'LightlineMovement' }
    \ }
    " \ 'mydrive' : 'LightlineDrive' ,
    " return current file dir {{{2
    " only up two directory
    " when different by current directory
    " If base directory isn't C directory show whre
    func! LightlineCurFileDir() abort
        return (getcwd()!=expand('%:p:h'))&&(&ft!='help')&&(&ft!='unite')?
        \ ((strcharpart(getcwd(),-1,2)!=strcharpart(expand('%:p:h'),-1,2))
        \ &&(expand('%:p:h')!~'\M^'.strcharpart(expand('%:p:h'),-1,2))
        \ ?(strcharpart(expand('%:p:h'),-1,2).matchstr(expand('%:p:h'),'[^\\]\+\\[^\\]\+$')):
        \ matchstr(expand('%:p:h'),'[^\\]\+\\[^\\]\+$')):
        \ ''
        return ret
    endfunc
    " return current dir {{{2
    " only up two directory
    " If base directory is different by current directory show where
    func! LightlineCwd() abort
        return strcharpart(getcwd(),-1,2)!='C'?
        \ strcharpart(getcwd(),-1,2).'-':
        \ ''.matchstr(getcwd(),'[^\\]\+\\[^\\]\+$')
    endfunc
    " return file encoding {{{2
    " Upeer and is bomb or no bomb
    func! LightlineFileEncoding() abort
        return (&ft!='help')&&(&ft!='unite')?
        \ (substitute(toupper(&fenc),'\M-','','g')=~'UTF'?
        \ (&bomb?
        \ substitute(toupper(&fenc),'\M-','','g').'B':
        \ substitute(toupper(&fenc),'\M-','','g').'N'):
        \ substitute(toupper(&fenc),'\M-','','g')):
        \ ''
    endfunc
    " return file format {{{2
    " Upeer and only first arphabet
    func! LightlineFileFormat() abort
        return toupper(strcharpart(&ff,-1,2))
    endfunc
    " return file name {{{2
    " when unit return unite file status
    func! LightlineFileName() abort
        return expand('%:t')!~'unite'?expand('%:t'):
        \ strpart(unite#get_status_string(),0,stridx(unite#get_status_string(),' '))
    endfunc
    " return file type {{{2
    " no return when help file
    func! LightlineFileType() abort
        return (&ft!='help')&&(&ft!='unite')?&ft:''
    endfunc
    " return last search {{{2
    func! LightlineLastSearch() abort
        return @/
    endfunc
    " return auto Toc enable {{{2
    " enable = 'T' disable = ''
    func! LightlineMdtoc() abort
        return &ft=='markdown' ? (b:Markdown_AuToc ? 'T' : '') : ''
    endfunc
    " return movement switch enable {{{2
    " enable = 'M' disable = ''
    func! LightlineMovement() abort
        return hasmapto('j') ? 'M' : ''
    endfunc
    func! LightlineMdtoc() abort
        return (&ft=='unite')?matchstr(unite#get_status_string(),'\M|\.\+$'):''
    endfunc
    " other options {{{2
    let g:unite_force_overwrite_statusline = 0
    " \ &ft == 'unite' ? unite#get_status_string() :
endif

" vim: set fdm=marker fdl=1 fmr={{{,}}} :
