" vim-operator-replace {{{2
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
" vim-operator-stay-cursor {{{2
if neobundle#is_installed("vim-operator-stay-cursor")
    map y <Plug>(operator-stay-cursor-yank)
    map gu <Plug>(operator-stay-cursor-gu)
    map gU <Plug>(operator-stay-cursor-gU)
    map g~ <Plug>(operator-stay-cursor-g~)
endif
" textobj-wiw {{{2
if neobundle#is_installed("textobj-wiw")
    " nmap ,w  <Plug>(textobj-wiw-n)
    " nmap ,b  <Plug>(textobj-wiw-p)
    " nmap ,e  <Plug>(textobj-wiw-N)
    " nmap ,ge  <Plug>(textobj-wiw-P)
    " vmap ,w  <Plug>(textobj-wiw-n)
    " vmap ,b  <Plug>(textobj-wiw-p)
    " vmap ,e  <Plug>(textobj-wiw-N)
    " vmap ,ge  <Plug>(textobj-wiw-P)
    " omap ,w  <Plug>(textobj-wiw-n)
    " omap ,b  <Plug>(textobj-wiw-p)
    " omap ,e  <Plug>(textobj-wiw-N)
    " omap ,ge  <Plug>(textobj-wiw-P)
endif
