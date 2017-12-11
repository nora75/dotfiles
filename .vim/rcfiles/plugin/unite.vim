if neobundle#is_installed("unite.vim")
    " unite general settings {{{2
    " start with insert mode
    let g:unite_enable_start_insert = 1
    " mru limit to 20
    let g:unite_source_file_mru_limit = 20

    " mru format set none it improves pafformance
    let g:unite_source_file_mru_filename_format = ''

    " bookmark save direvtory
    let g:unite_source_bookmark_directory = $HOME . '/.vim/ubookmark'

    " unite prefix key. {{{2
    nnoremap [unite] <Nop>
    nmap <Space>u [unite]

    " open current files directory on unite filer 
    " when no file opened open current directory
    nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
    " buffers
    nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
    " registers
    nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
    " mru
    nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
    " bookmarks
    nnoremap <silent> [unite]c :<C-u>Unite bookmark<CR>
    " add bookmark
    nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>
    " jumplist
    nnoremap <silent> [unite]j :<C-u>Unite jump<CR>
    " unite output
    " it provide command output with unite interface
    nnoremap [unite]o :<C-u>Unite output:
    " output variables(let) on unite output
    nnoremap <silent> [unite]l :<C-u>Unite output:let<CR>
    " output set on unite output
    nnoremap <silent> [unite]s :<C-u>Unite output:set<CR>
    augroup unite
        au!
        " map only on unite
        autocmd FileType unite call s:unite_my_settings()
    augroup END

    function! s:unite_my_settings()" {{{2
        " exit unite with <ESC>
        nmap <buffer> <ESC> <Plug>(unite_exit)
        " type jj to exit insert mode
        imap <buffer> jj <Plug>(unite_insert_leave)
        " extend <C-w> command to delete /
        imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
        " map on insert and normal {{{3
        " <C-o> open file on split
        nnoremap <silent> <buffer> <expr> <C-o> unite#do_action('split')
        inoremap <silent> <buffer> <expr> <C-o> unite#do_action('split')
        " <C-j> open file on split
        nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
        inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
        " t tabopen
        nnoremap <silent> <buffer> <expr> t unite#do_action('tabopen')
        " o open
        nnoremap <silent> <buffer> <expr> o unite#do_action('open')
        " inoremap <silent> <buffer> <expr> o unite#do_action('open')
    endfunction
    " }}}
endif

" vim: set fdm=marker fdl=1 fmr={{{,}}} :
