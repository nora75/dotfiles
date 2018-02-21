" Use {{{1
" DoNormal(com) {{{2
" do normal command and restore window view and last search
fu! DoNormal(com)
    let l:save_search = @/
    let l:save_win = winsaveview()
    execute 'keepjumps normal 'a:com
    let @/ = l:save_search
    call winrestview(l:save_win)
endfunction

" SwitchMoces() {{{2
" move mode switch over buffer
" use error occuer when don't map yet
func! SwitchMoves()
    try
        nunmap j
        nunmap k
        nunmap gj
        nunmap gk
        vunmap j
        vunmap k
        vunmap gj
        vunmap gk
    catch
        nnoremap j gj
        nnoremap k gk
        nnoremap gj j
        nnoremap gk k
        vnoremap j gj
        vnoremap k gk
        vnoremap gj j
        vnoremap gk k
    endtry
endfunc

" Effc() {{{2
" function to :EFFC
" if clipboard is file name return it. not file name return empty
func! Effc()
    let ret = getreg('*')
    if type(ret)!=1||getftype(ret)!=#'file'
        let ret = ''
    endif
    return ret
endfunc

" Windo(...) {{{2
" function to :Windom
" separate all args with bar
func! WinDo(...) abort
    let cuwinid = win_getid()
    let save_search = @/
    let save_win = winsaveview()
    windo let b:reload_save_fold = &fdl
    let do = ''
    for cm in a:000
        let do .= ' '.cm
    endfor
    exe 'silent! windo '.do
    redraw!
    if do=~#'\Mnorm\[^z]\*z\[^hjkl]'|unlet save_win|exe 'windo unlet b:reload_save_fold'|endif
    windo if exists("b:reload_save_fold")|let &fdl = b:reload_save_fold|unlet b:reload_save_fold|endif
call win_gotoid(cuwinid)
let @/ = save_search
if exists('save_win')|call winrestview(save_win)|unlet save_win|endif
unlet cuwinid
endfunc

"  ComcapOut(com) {{{2
" function for debugging
" do command and catch output in commandline
func! ComcapOut(com) abort
    let result = GetComOut(a:com)
    new
    let fname = 'output:'.a:com
    silent file`=fname`
    silent put =result
    silent 1d_
    setl nonu bt=nofile noswf nobl bh=wipe ft=vim
    return
endfunc

"  GetFunc(com) {{{2
" function for debugging
" do command and catch output in commandline
func! GetFunc(com) abort
    let result = GetComFunc(a:com)
    new
    let fname = 'output:'.a:com
    silent file`=fname`
    silent put =result
    silent 1d_
    setl nonu bt=nofile noswf nobl bh=wipe ft=vim
    return
endfunc

" NewTabScratch() {{{2
" function for memo
" make new tab for memo
func! NewTabScratch() abort
    tabnew
    silent file memo
    setl nonu bt=nofile noswf nobl bh=wipe ft=vim
endfunc

" NewBufScratch() {{{2
" function for memo
" make new buffer for memo
func! NewBufScratch() abort
    new
    silent file memo
    setl nonu bt=nofile noswf noma nobl bh=wipe ft=vim
endfunc

" GetComCont(com) {{{2
" function for :GetCom
" get command content and return
" need perfect matching command name input
" if setted command is not declared, return error message
" it is fast but not correct
func! GetComCont(com) abort
    if exists(':'.a:com)
        return 'No such a command'
    endif
    if a:com =~ '^\u'
        let ex = "redir => result|silent exe 'com' a:com|redir end"
    else
        let ex = 'redir => result|silent exe a:com|redir end'
    endif
    return result
    " let result = matchstr(split(result,"\n")[-1],'\M\S\.\*\s\*')
    " let i = stridx(result,'\M\(\S\+\\\@<!|\.\*\)\|\(\S\+(\.\*)\)')
    " while true
    "     " stridx(result,'\M0\|1\|?\|+\|*',stridx(result,a:com)+len(a:com)-1)+1
    "     stridx(result,a:com)+len(a:com)-1)+1
    "     let i = stridx(result,a:com,stridx(result,'\s',i))
    "     if exists(':'.matchstr(result,,i))>0
    "     endif
    " endwhile
    let i = stridx(result,a:com)
    let i = stridx(result,'  ',i)
    let result = strcharpart(result,i,len(result)-i+1)
    " let result = matchstr(result,'\M\S\.\+$')
endfunc

" GetComOut(com) {{{2
" function for matchit
" get vimscript command output and return
" need perfect matching command name input
func! GetComOut(com) abort
    if exists(':'.a:com)
        return 'No such a command'
    endif
    exe 'redir => result|silent exe' a:com.'|redir end'
    return result
endfunc

" :ReloadVimrc
" save current window and restore current winodow after reloading .vimrc
" func! ReloadVimrc() abort
"     let l:save_win = winsaveview()
"     source $MYVIMRC
"     set nohlsearch
"     call winrestview(l:save_win)
" endfunc


" ChangeAlp(case,text) {{{2
" function for :ChangeUpper
" change all argument text in current buffer to uppercase 
func! ChangeAlp(case,text,...) abort
    let backsearch = @/
    if a:1 != a:2
        let line1 = a:1
        let line2 = a:2
    else
        let line1 = 1
        let line2 = line('$')
    endif
    let text = split(a:text,'\s')
    if len(text) > 1
        let text = map(text,'"\\(".v:val."\\)"')
        let text = join(text,'\|')
    else
        let text = join(text)
    endif
    if a:case ==# 'u'
        let to = 'upper'
    else
        let to = 'lower'
    endif
    exe line1.','.line2.'s/'.text.'/\=to'.to.'(submatch(0))/g'
    let @/ = backsearch 
    return
endfunc

" SortFold(line1,line2) {{{2
" get lines of selected area and sort by fold header
" only support marker
func! SortFold(line1,line2,bang) abort
    if a:line1 ==# a:line2 || &fdm !=# 'marker'
        return
    endif
    let marks = matchstr(&fmr,'\M\.\+\ze,')
    let marke = matchstr(&fmr,'\M,\zs\.\+')
    let lines = getline(a:line1,a:line2)
    let back_lines = deepcopy(lines)
    call filter(lines,'v:val =~# "\\M'.marks.'\\d\\*"')
    " call filter(lines,'v:val =~# "\\M'.marks.'\\d\\*" || v:val =~# "\\M'.marke.'"')
    let back_sortlines = deepcopy(lines)
    let sortlist = {}
    let i = 0
    let k = 0
    let count = { 1 : 0 , 2 : 0 , 3 : 0 , 4 : 0 , 5 : 0 , 6 : 0 , 7 : 0 , 8 : 0 , 9 : 0 , 10 : 0 , 11 : 0 , 12 : 0 , 13 : 0 , 14 : 0 , 15 : 0 , 16 : 0 , 17 : 0 , 18 : 0 , 19 : 0 , 20 : 0 }
    let t = ''
    while i < len(lines)
        let n = matchstr(lines[i],'M'.marks.'\(\d\*\)')
        while true
            if lines[i] =~# '\M'.marks.'\d\*'
                if n >= matchstr(lines[i],'M'.marks.'\(\d\*\)')
                    let k += 1
                    if k > 0
                        continue
                    else
                        break
                    endif
                endif
            elseif lines[i] =~# '\M'.marks
            endif
            let i += 1
        endwhile
    endwhile
    for d in lines
        try
            exe 'call extend(sortlist.'.matchstr(d,'\d').',[d])'
        catch
            exe 'call extend(sortlist,{'.matchstr(d,'\d').':[d]})'
        endtry
    endfor
    " let i = 0
    " let list = []
    " let innerlist = []
    " while i < len(back_lines)
    "     if lines[i] !~ '{{{\d'
    "         let i += 1
    "         continue
    "     else
    "         let n = matchstr(lines[i],mark.'\(\d\)')
    "         while true
    "             if lines[i] =~# mark.'\d' || lines[i] =~# mark
    "                 if n >= matchstr(lines[i],mark.'\(\d\)')
    "                     let k -= 1
    "                     if k > 0
    "                         continue
    "                     else
    "                         break
    "                     endif
    "                 endif
    "             endif
    "             let i += 1
    "         endwhile
    "     endif
    " endwhile
    " if len()
    "     return
    " endif
    return
endfunc

" " GetCurrentFoldPath() abort
" " get current fold line by directory style
" func! GetCurrentFoldPath() abort
"     if &fdm !=# 'marker'
"         return
"     endif
"     let gcfp = ''
"     let marks = matchstr(&fmr,'\M\.\+\ze,')
"     let marke = matchstr(&fmr,'\M,\zs\.\+')
"     let lines = getline(a:line1,a:line2)
"     let back_lines = deepcopy(lines)
"     call filter(lines,'v:val =~# "\\M'.marks.'\\d\\*" || v:val =~# "\\M'.marke.'"')
"     let back_sortlines = deepcopy(lines)
"     let sortlist = {}
"     let i = 0
"     let k = 0
"     let count = { 1 : 0 , 2 : 0 , 3 : 0 , 4 : 0 , 5 : 0 , 6 : 0 , 7 : 0 , 8 : 0 , 9 : 0 , 10 : 0 , 11 : 0 , 12 : 0 , 13 : 0 , 14 : 0 , 15 : 0 , 16 : 0 , 17 : 0 , 18 : 0 , 19 : 0 , 20 : 0 }
"     let t = ''
"     while i < len(lines)
"         let n = matchstr(lines[i],'M'.marks.'\(\d\*\)')
"         while true
"             if lines[i] =~# '\M'.marks.'\d\*'
"                 if n >= matchstr(lines[i],'M'.marks.'\(\d\*\)')
"                     let k += 1
"                     if k > 0
"                         continue
"                     else
"                         break
"                     endif
"                 endif
"             elseif lines[i] =~# '\M'.marks
"             endif
"             let i += 1
"         endwhile
"     endwhile
"     for d in lines
"         try
"             exe 'call extend(sortlist.'.matchstr(d,'\d').',[d])'
"         catch
"             exe 'call extend(sortlist,{'.matchstr(d,'\d').':[d]})'
"         endtry
"     endfor
"     echo gcfp
"     return
" endfunc

" don't use{{{1
" misc {{{2
" move mode switch only current buffer with augroup {{{3
" augroup SwitchMoves
"     au!
"     au BufEnter * call SwitchMoves()
" augroup END

" fu! SwitchMoves()
"     try
"         call exists(b:SwitchMoves)
"     catch
"         let b:SwitchMoves = 0
"     finally
"         if b:SwitchMoves == 0
"             nnoremap j gj
"             nnoremap k gk
"             nnoremap gj j
"             nnoremap gk k
"             vnoremap j gj
"             vnoremap k gk
"             vnoremap gj j
"             vnoremap gk k
"             let b:SwitchMoves = 1
"         else
"             nunmap j
"             nunmap k
"             nunmap gj
"             nunmap gk
"             vunmap j
"             vunmap k
"             vunmap gj
"             vunmap gk
"             let b:SwitchMoves = 0
"         endif
"     endtry
" endfunc

" vim: set fdm=marker fdl=1 fmr={{{,}}} :
