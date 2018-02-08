if neobundle#is_installed('vim-jplus')
    nmap J <Plug>(jplus-input)<CR>
    vmap J <Plug>(jplus-input)<CR>
    nmap gJ <Plug>(jplus-input)
    vmap gJ <Plug>(jplus-input)
    nmap <Space>J <Plug>(jplus-input-with-spaces)
    vmap <Space>J <Plug>(jplus-input-with-spaces)
endif
