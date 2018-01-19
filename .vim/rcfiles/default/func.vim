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

" function to :Windom {{{2
" separate all args with bar
func! WinDo(...) abort
    let l:cuwinid = win_getid()
    let l:save_search = @/
    let l:save_win = winsaveview()
    windo let b:reload_save_fold = &fdl
    let l:do = ''
    for l:cm in a:000
        let l:do .= ' '.l:cm
    endfor
    exe 'silent! windo '.l:do
    redraw!
    windo let &fdl = b:reload_save_fold
    windo unlet b:reload_save_fold
    call win_gotoid(l:cuwinid)
    let @/ = l:save_search
    call winrestview(l:save_win)
endfunc

" function for debugging {{{2
" do command and catch output in commandline
func! Comcap(com) abort
    let result = ''
    redir => result
    silent exe a:com
    redir end
    new
    let fname = 'output:'.a:com
    silent file`=fname`
    silent put =result
    silent delete _
    setl nonu bt=nofile noswf nobl bh=wipe ft=vim
endfunc

" function for memo {{{2
" make new tab for memo
func! NewTabScratch() abort
    tabnew
    let fname = 'memo'
    silent file`=fname`
    setl nonu bt=nofile noswf nobl bh=wipe ft=vim
endfunc

" function for memo {{{2
" make new buffer for memo
func! NewBufScratch() abort
    new
    let fname = 'memo'
    silent file`=fname`
    setl nonu bt=nofile noswf noma nobl bh=wipe ft=vim
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
