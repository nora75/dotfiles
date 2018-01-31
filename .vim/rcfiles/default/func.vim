" ノーマルコマンドの実行後カーソル位置の復元 {{{2
fu! DoNormal(com)
    let l:save_search = @/
    let l:save_win = winsaveview()
    execute "normal "a:com
    let @/ = l:save_search
    call winrestview(l:save_win)
endfunction

" move mode switch over buffer {{{2
" unmapでエラーが起きるのを利用
fu! SwitchMoves()
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

" function to :EFFC {{{2
" if clipboard is file name return it. not file name return empty
func! Effc()
    let ret = getreg('*')
    if type(ret)!=1||getftype(ret)!='file'
        let ret = ''
    endif
    return ret
endfunc

" function to :Windom {{{2
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
    if do=~'\Mnorm\[^z]\*z\[^hjkl]'|unlet save_win|exe 'windo unlet b:reload_save_fold'|endif
    windo if exists("b:reload_save_fold")|let &fdl = b:reload_save_fold|unlet b:reload_save_fold|endif
call win_gotoid(cuwinid)
let @/ = save_search
if exists('save_win')|call winrestview(save_win)|unlet save_win|endif
unlet cuwinid
endfunc

" function for debugging {{{2
" do command and catch output in commandline
func! Comcap(com) abort
    let result = GetCom(a:com)
    new
    let fname = 'output:'.a:com
    silent file`=fname`
    silent put =result
    silent 1d_
    setl nonu bt=nofile noswf nobl bh=wipe ft=vim
    return
endfunc

" function for memo {{{2
" make new tab for memo
func! NewTabScratch() abort
    tabnew
    silent file memo
    setl nonu bt=nofile noswf nobl bh=wipe ft=vim
endfunc

" function for memo {{{2
" make new buffer for memo
func! NewBufScratch() abort
    new
    silent file memo
    setl nonu bt=nofile noswf noma nobl bh=wipe ft=vim
endfunc

" function for :GetCom {{{2
" get command content and return
" if setted command is not declared, return error message
func! GetCom(com) abort
    if exists(':'.a:com)!=2
        return 'No such a command'
    endif
    redir => result
    silent exe 'com '.a:com
    redir end
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
    let i = stridx(result,"  ",i)
    let result = strcharpart(result,i,len(result)-i+1)
    " let result = matchstr(result,'\M\S\.\+$')
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

" :Cde completion {{{2
func! Cdcomp(...)
    return split(substitute(substitute(glob('%:p:h'.'**'),'\M'.substitute(expand('%:p:h'),'\\','\\\\','g'),'','g'),'\\','','g'), '\n')
endfunc

" その他 {{{2
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
" }}}

" vim: set fdm=marker fdl=1 fmr={{{,}}} :
