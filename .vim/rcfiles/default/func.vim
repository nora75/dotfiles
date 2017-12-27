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

" :Cde completion
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
