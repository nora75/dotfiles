" options {{{2
set laststatus=2
let g:unite_force_overwrite_statusline = 0
aug StlAu
    au!
aug END

" g:lightline {{{2
let g:lightline = {}

" active {{{3
let g:lightline.active = { 'left' : [ [ 'mycwd' , 'mycurfiledir' , 'mywafu' ] ,
\ [ 'myfname', 'modified' , 'readonly' ] ] ,
\ 'right' : [ [ 'myfenc', 'filetype' ] , [ 'myunite' ] , [ 'mymdtoc' ] ] }

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
\ 'modified': '%{(&ft!=#"unite")&&(&ft!=#"help")&&(&mod)&&(&buftype!="terminal")?"+":""}',
\ 'bufnum': '%n',
\ 'readonly': '%{(&ft!=#"unite")&&(&ft!=#"help")&&(&ro)?"R":""}',
\ 'filetype': '%{(&ft!=#"unite")?&ft:""}',
\ 'percent': '%3p%%',
\ 'lineinfo': '%3l:%-2v',
\ 'close': '%999X X ',
\ 'myff' : '%{(&ft!=#"help")&&(&ft!=#"unite")&&(&ff!="unix")?toupper(strcharpart(&ff,-1,2)):""}' ,
\ 'myfname' : '%{(&ft!=#"unite")?expand("%:t:r"):strpart(unite#get_status_string(),0,stridx(unite#get_status_string()," "))}' ,
\ 'mysearch' : '%{strcharpart(@/,0,5)}' ,
\ 'mymdtoc' : '%{(&ft==#"markdown")&&(b:Markdown_AuToc)?"T":""}' ,
\ 'mymove' : '%{hasmapto("gj")?"M":""}' }

if dein#is_sourced('unite.vim')
    call extend(g:lightline.component,{'myunite' : '%{(&ft!="unite")?matchstr(unite#get_status_string(),"\M|\.\+$"):""}'})
endif

" componet function {{{3
let g:lightline.component_function = {
\ 'mycurfiledir' : 'LightlineCurFileDir' ,
\ 'mycwd' : 'StlCwd' ,
\ 'mywafu' : 'StlEch' ,
\ 'myfenc' : 'LightlineFenc' }

" component visible {{{3
let g:lightline.component_visible_condition = {
\ 'myfname': 'v:true' ,
\ 'myff' : '(&ft!=#"help")&&(&ft!=#"unite")' ,
\ 'filetype' : '(&ft!=#"")&&(&ft!=#"unite")' ,
\ 'modified': '(expand("%:t:r")!=#"")&&(&modified)&&(&ft!="unite")&&(&ft!=?"help")&&(&buftype!="terminal")' ,
\ 'readonly': '(&readonly)&&(&ft!="unite")&&(&ft!=?"help")' }
" \ 'mycwd' : '' ,
" \ 'mycurfiledir' : '' ,
" \ 'myfname' : '' ,
" \ 'mylastsearch' : '' ,
" \ 'mymdtoc' : '' ,
" \ 'mymove' : '' ,
" \ 'myunite' : '' ,

" component function visible {{{3
let g:lightline.component_function_visible_condition = {
\ 'mycurfiledir' : '(getcwd()!=?expand("%:p:h"))&&(expand("%:p:h")!=#"")&&(&ft!=#"unite")' }
" \ 'myfenc' : '(&ft!=#"unite")' ,

" separator and subseparator {{{3
" let g:lightline.separator = { 'left': '', 'right': '' }
" let g:lightline.subseparator = { 'left': '|', 'right': '|' }

" comment {{{2
" \ 'mydrive' : 'LightlineDrive' ,
" \ &ft == 'unite' ? unite#get_status_string() :

" lightline functions {{{2
" LightlineCurFileDir {{{3
" return current file dir only end two directory
" when current file dir is different by current directory
" if base directory isn't C directory show whre
func! LightlineCurFileDir() abort
    if (&ft==#"unite")
        return ''
    endif
    return StlCurFileDir()
endfunc

" LightlineFenc() {{{3
" return file encoding Upeer and bomb?
func! LightlineFenc() abort
    if (&ft==#'unite')
        return ''
    endif
    return StlFenc()
endfunc

" vim: set fdm=marker fdl=1 fmr={{{,}}} :
