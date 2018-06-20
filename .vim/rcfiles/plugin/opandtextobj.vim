" vim-operator-replace {{{2
if !dein#is_sourced('vim-operator-replace')
    finish
endif
nmap _  <Plug>(operator-replace)
vmap _  <Plug>(operator-replace)
if hasmapto('<C-p>')
    nunmap <C-p>
    vunmap <C-p>
endif
if hasmapto('<C-S-p>')
    nunmap <C-S-p>
    vunmap <C-S-p>
endif
" vim-operator-stay-cursor {{{2
if !dein#is_sourced('vim-operator-stay-cursor')
    finish
endif
map y <Plug>(operator-stay-cursor-yank)
map gu <Plug>(operator-stay-cursor-gu)
map gU <Plug>(operator-stay-cursor-gU)
map g~ <Plug>(operator-stay-cursor-g~)
" textobj-wiw {{{2
if !dein#is_sourced('textobj-wiw')
    finish
endif
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
