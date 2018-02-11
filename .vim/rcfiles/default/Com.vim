" :CdCurrent {{{2
"  Change current directory to current file's one
command! -nargs=0 CdCurrent cd %:p:h

" :CheckCom {{{2
" Get command content by input command name
command! -nargs=1 -complete=command CheckCom echo GetComCont(<f-args>)

" :EFFC {{{2
" Edit File From Clipboard
command! -nargs=0 -complete=file EFFC exe 'e '.Effc()

" :ReloadVimrc {{{2
" Reload .vimrc files
command! -nargs=0 ReloadVimrc let g:reload_save_win = winsaveview()|
\ let g:reload_save_cuwinid = win_getid()|
\ exe 'windo let b:reload_save_fold = &fdl'|
\ source $MYVIMRC|
\ set nohlsearch|
\ exe 'silent! windo let &fdl = b:reload_save_fold'|
\ exe 'silent! windo unlet b:reload_save_fold'|
\ call win_gotoid(g:reload_save_cuwinid)|
\ call winrestview(g:reload_save_win)|
\ unlet g:reload_save_win|
\ unlet g:reload_save_cuwinid

" :Renamefn {{{3
" rename current file
command! -nargs=1 Renamefn exe 'file '.<f-args>|call delete(expand('#'))|filetype detect|w

" :Renamet {{{3
" change current filename entension
command! -nargs=1 Renamefe exe 'file '.expand('%:r').'.'.<f-args>|call delete(expand('#'))|filetype detect|w

" :Windom {{{2
" don't move with do command to all windows
command! -nargs=+ -complete=command Windom call WinDo(<f-args>)

" :Comcap {{{2
" get comamnd output and put it to new empty buffer
command! -nargs=1 -complete=command Comcap call Comcap(<f-args>)

" :GetFunc {{{2
command! -nargs=1 -complete=command GetFunc call GetFunc(<f-args>)

" :Memot {{{2
" open new tab for memo
command! -nargs=0 Memot call NewTabScratch()

" :Memoo {{{2
" open new buffer for memo
command! -nargs=0 Memoo call NewBufScratch()

