if neobundle#is_installed('vim-anzu')
    " mapping
    nmap n <Plug>(anzu-n-with-echo)
    nmap N <Plug>(anzu-N-with-echo)
    nmap * <Plug>(anzu-star-with-echo)
    nmap # <Plug>(anzu-sharp-with-echo)

    " clear status
    nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

    " statusline
    " set statusline=%{anzu#search_status()}

    " can't recognize on * or # with echo no match pattern
	" map n nzzzv with anzu mode
	" nnoremap <expr> n anzu#mode#mapexpr("n", "", "zzzv")
	" map N Nzzzv with anzu mode
	" nnoremap <expr> N anzu#mode#mapexpr("N", "", "zzzv")
endif
