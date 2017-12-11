
" :CdCurrent
"  Change current directory to current file's one.
command! -nargs=0 CdCurrent cd %:p:h

" :ReloadVimrc
" Reload .vimrc files
command! -nargs=0 ReloadVimrc source $MYVIMRC
