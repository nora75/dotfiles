if !neobundle#is_installed('vim-session')
    finish
endif
" vim default session's options
" only save loaded buffers
set sessionoptions-=buffers
" with 
set sessionoptions-=options

" vim-session plugin's options
" session save directory
let g:session_directory = expand('~')
" autosave when leave vim
let g:session_autosave = 'yes'
" when launch vim without argments
let g:session_autoload = 'yes'
" command aliase
let g:session_command_aliases = 1
" don't load menu
let g:session_menu = 0

" vim: set fdm=marker fmr={{{,}}} fdl=1 :
