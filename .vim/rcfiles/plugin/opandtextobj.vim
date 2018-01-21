if neobundle#is_installed("vim-operator-replace")
    nmap _  <Plug>(operator-replace)
    vmap _  <Plug>(operator-replace)
    if hasmapto("<C-p>")
        nunmap <C-p>
        vunmap <C-p>
    endif
    if hasmapto("<C-S-p>")
        nunmap <C-S-p>
        vunmap <C-S-p>
    endif
endif
if neobundle#is_installed("vim-operator-stay-cursor")
    map y <Plug>(operator-stay-cursor-yank)
    map c <Plug>(operator-stay-cursor-change)
    map gu <Plug>(operator-stay-cursor-gu)
    map gU <Plug>(operator-stay-cursor-gU)
    map g~ <Plug>(operator-stay-cursor-g~)
endif
if neobundle#is_installed("textobj-wiw")
    let g:textobj_wiw_default_key_mappings_prefix = ','
    " ,w	nxo	<Plug>(textobj-wiw-n)
    " ,b	nxo	<Plug>(textobj-wiw-p)
    " ,e	nxo	<Plug>(textobj-wiw-N)
    " ,ge	nxo	<Plug>(textobj-wiw-P)

    " a,w	xo	<Plug>(textobj-wiw-a)
    " i,w	xo	<Plug>(textobj-wiw-i)
endif
