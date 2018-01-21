if neobundle#is_installed("vim-quickhl")
    let g:quickhl_manual_enable_at_startup = 1
    nmap <Space>h <Plug>(quickhl-manual-this)
    vmap <Space>h <Plug>(quickhl-manual-this)
    nmap <Space>H <Plug>(quickhl-manual-reset)
    vmap <Space>H <Plug>(quickhl-manual-reset)
    nmap <F4>     <Plug>(quickhl-manual-toggle)
    vmap <F4>     <Plug>(quickhl-manual-toggle)
endif
