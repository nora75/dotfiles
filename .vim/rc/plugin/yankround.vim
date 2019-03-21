if !dein#is_sourced('yankround.vim')
    finish
endif

let g:yankround_max_history = 100
let g:yankround_use_region_hl = 1

nmap p <Plug>(yankround-p)
xmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
xmap gp <Plug>(yankround-gp)
nmap gP <Plug>(yankround-gP)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)

if !dein#is_sourced('unite.vim')
    finish
endif

" vim: set fdm=marker fdl=1 fmr={{{,}}} :
