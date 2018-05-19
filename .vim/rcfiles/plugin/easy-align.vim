if !neobundle#is_installed('vim-easy-align')
    finish
endif
" not live
" nmap ga <Plug>(EasyAlign)
" xmap ga <Plug>(EasyAlign)
" live
nmap     ga <Plug>(LiveEasyAlign)
xmap     ga <Plug>(LiveEasyAlign)
vnoremap <Space><Space> <Plug>(LiveEasyAlign)
