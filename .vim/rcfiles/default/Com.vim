
" :CdCurrent
"  Change current directory to current file's one.
command! -nargs=0 CdCurrent cd %:p:h

" :ReloadVimrc
" Reload .vimrc files
command! -nargs=0 ReloadVimrc source $MYVIMRC

" :Cde
" edit file in current directory with don't move current directory.
command! -nargs=1 -complete=customlist,Cdcomp Cde e %:p:h\<args>

" :Cde
" Change current directory to current file's one and edit file in this
"  directory.
" command! -nargs=1 -complete=customlist,Cdcomp Cde cd %:p:h | e <args>
