if neobundle#is_installed("lightline.vim")
    " options {{{2
    set laststatus=2
    let g:unite_force_overwrite_statusline = 0

    " g:lightline {{{2
    let g:lightline = {}

    " active {{{3
    let g:lightline.active = { 'left' : [ [ 'mycwd' , 'mycurfiledir' ] ,
    \ [ 'myfname', 'modified' , 'readonly' ] ],
    \ 'right' : [ [ 'myff', 'myfenc', 'filetype' ] , [ 'myunite' ] , [ 'mymove' , 'mymdtoc' ] , [ 'mysearch' ] ] }

    " inactive {{{3
    let g:lightline.inactive = {
    \ 'left' : [ [ 'mycurfiledir' , 'myfname', 'modified' , 'readonly' ] ] ,
    \ 'right' : [ [ 'lineinfo' ] , [ 'percent' ] ] }

    " tabline {{{3
    let g:lightline.tabline = {
    \ 'left' : [ [ 'tabs' ] ] ,
    \ 'right' : [ [ 'close' ] ] }

    " tab {{{3
    let g:lightline.tab = {
    \ 'active' : [ 'tabnum' , 'filename' , 'modified' ] ,
    \ 'inactive' : [ 'tabnum' , 'filename' , 'modified' ] }

    " colorscheme {{{3
    let g:lightline.colorscheme = 'default'

    " component {{{3
    let g:lightline.component = {
    \ 'modified': '%M',
    \ 'bufnum': '%n',
    \ 'readonly': '%R',
    \ 'filetype': '%{(&ft!="unite")?(&ft!=#""?&ft:"NONE"):""}',
    \ 'percent': '%3p%%',
    \ 'lineinfo': '%3l:%-2v',
    \ 'close': '%999X X ',
    \ 'myff' : '%{(&ft!="help")&&(&ft!="unite")?toupper(strcharpart(&ff,-1,2)):""}' ,
    \ 'myfname' : '%{expand("%:t")!~"unite"?expand("%:t"):strpart(unite#get_status_string(),0,stridx(unite#get_status_string()," "))}' ,
    \ 'mysearch' : '%{@/}' ,
    \ 'mymdtoc' : '%{(&ft=="markdown")&&(b:Markdown_AuToc)?"T":""}' ,
    \ 'mymove' : '%{hasmapto("j")&&(&ft!="unite")?"M":""}' ,
    \ 'myunite' : '%{(&ft!="unite")?matchstr(unite#get_status_string(),"\M|\.\+$"):""}' }

    " componet function {{{3
    let g:lightline.component_function = {
    \ 'mycurfiledir' : 'LightlineCurFileDir' ,
    \ 'mycwd' : 'LightlineCwd' ,
    \ 'myfenc' : 'LightlineFenc' }


    " component visible {{{3
    let g:lightline.component_visible_condition = {
    \ 'mymove': '(&ft=="markdown")&&(b:Markdown_AuToc)' ,
    \ 'myfname': 'v:true' ,
    \ 'myff' : '(&ft!="help")&&(&ft!="unite")' ,
    \ 'modified': '&modified||!&modifiable' ,
    \ 'readonly': '&readonly' }
    " \ 'mycwd' : '' ,
    " \ 'mycurfiledir' : '' ,
    " \ 'myfname' : '' ,
    " \ 'mylastsearch' : '' ,
    " \ 'mymdtoc' : '' ,
    " \ 'mymove' : '' ,
    " \ 'myunite' : '' ,
    " \ 'filetype' : '' ,

    " component function visible {{{3
    let g:lightline.component_function_visible_condition = {
    \ 'myfenc' : '(&ft!="help")&&(&ft!="unite")' ,
    \ 'mycurfiledir' : '(getcwd()!=expand("%:p:h"))&&(&ft!="help")&&(&ft!="unite")'
    \ }

    " separator and subseparator {{{3
    " let g:lightline.separator = { 'left': '', 'right': '' }
    " let g:lightline.subseparator = { 'left': '|', 'right': '|' }

    " comment {{{2
    " \ 'mydrive' : 'LightlineDrive' ,
    " \ &ft == 'unite' ? unite#get_status_string() :

    " lightline functions {{{2
    " return current file dir {{{3
    " only up two directory
    " when different by current directory
    " If base directory isn't C directory show whre
    func! LightlineCurFileDir() abort
        if (getcwd()==expand("%:p:h"))||(ft=="help")||(&ft=="unite")
            return ''
        endif
        let cdr = strcharpart(expand('%:p:h'),-1,2)
        let cfd = matchstr(expand('%:p:h'),'[^\\]\+\\[^\\]\+$')
        if (strcharpart(getcwd(),-1,2)!=cdr) && (expand('%:p:h')!~'\M^'.cdr)
            let cdr = cdr.':'.cfd
        endif
        let licwd = split(cwd, '\')
        let i = 0
        while i < len(licwd)
            if len(licwd[i]) > 5
                let licwd[i] = strcharpart(licwd[i],0,5)
            endif
            let i += 1
        endwhile
        let cwd = join(licwd, '\')
        return cfd
    endfunc
    " return current dir {{{3
    " only up two directory
    " If base directory is different by current directory show where
    func! LightlineCwd() abort
        let cd = strcharpart(getcwd(),-1,2)
        let cwd = matchstr(getcwd(),'[^\\]\+\\[^\\]\+$')
        let licwd = split(cwd, '\')
        let i = 0
        while i < len(licwd)
            if len(licwd[i]) > 5
                let licwd[i] = strcharpart(licwd[i],0,5)
            endif
            let i += 1
        endwhile
        let cwd = join(licwd, '\')
        if cd !='C'
            let cd .= ':'
        endif
        let cwd = cd.cwd
        return cwd
    endfunc
    " return file encoding {{{3
    " Upeer and is bomb or no bomb
    func! LightlineFenc() abort
        let en = substitute(toupper(&fenc!=''?&fenc:&enc),'\M-','','g')
        if en =~ 'UTF'
            let en .= &bomb ? 'B': 'N'
        endif
        return en
    endfunc
endif

" vim: set fdm=marker fdl=1 fmr={{{,}}} :
