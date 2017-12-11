if neobundle#is_installed("vim-session")
    " vim-session
    "
    " only save loaded buffers
    set sessionoptions-=buffers
    " with 
    set sessionoptions-=options
    
    " session save directory
    let g:session_directory = expand('~')
    " autosave when leave vim
    let g:session_autosave = 'yes'
    " when launch vim without argments
    let g:session_autoload = 'yes'
    " command aliase
    let g:session_command_aliases = 1
endif

" vim: set fdm=marker fmr={{{,}}} fdl=1 :
