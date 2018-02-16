if neobundle#is_installed('vim-jplus')
    " mapping {{{2
    nmap J <Plug>(jplus-input)<CR>
    vmap J <Plug>(jplus-input)<CR>
    nmap gJ <Plug>(jplus-input)
    vmap gJ <Plug>(jplus-input)
    nmap <Space>J <Plug>(jplus-input)<Space><CR>
    vmap <Space>J <Plug>(jplus-input)<Space><CR>
    " }}}
endif

" vim: set fdm=marker fmr={{{,}}} fdl=1 :
