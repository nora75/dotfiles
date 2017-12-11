if neobundle#is_installed("vim-submode")
    " options {{{2
    let g:submode_always_show_submode = 1
    let g:submode_keep_leaving_key = 1
    " let g:submode_timeoutlen = 500
    let g:submode_keyseqs_to_leave = [ '<Space>', '<ESC>' ]

    " WinSize {{{2
    call submode#enter_with('WinSize', 'n', '', '<C-w>>', '<C-w>>')
    call submode#enter_with('WinSize', 'n', '', '<C-w><', '<C-w><')
    call submode#enter_with('WinSize', 'n', '', '<C-w>+', '<C-w>+')
    call submode#enter_with('WinSize', 'n', '', '<C-w>-', '<C-w>-')
    call submode#map('WinSize', 'n', '', '>', '<C-w>>')
    call submode#map('WinSize', 'n', '', '.', '<C-w>>')
    call submode#map('WinSize', 'n', '', '<', '<C-w><')
    call submode#map('WinSize', 'n', '', ',', '<C-w><')
    call submode#map('WinSize', 'n', '', '+', '<C-w>+')
    call submode#map('WinSize', 'n', '', '-', '<C-w>-')
    call submode#map('WinSize', 'n', '', '=', '<C-w>=')
    call submode#map('WinSize', 'n', '', 'h', '<C-w><')
    call submode#map('WinSize', 'n', '', 'j', '<C-w>-')
    call submode#map('WinSize', 'n', '', 'k', '<C-w>+')
    call submode#map('WinSize', 'n', '', 'l', '<C-w>>')
    
    " WinMove {{{2
"     call submode#enter_with('WinMove', 'n', '', '<C-w>t', '<C-w>t')
"     call submode#enter_with('WinMove', 'n', '', '<C-w>b', '<C-w>b')
    call submode#enter_with('WinMove', 'n', '', '<C-w>h', '<C-w>h')
    call submode#enter_with('WinMove', 'n', '', '<C-w>j', '<C-w>j')
    call submode#enter_with('WinMove', 'n', '', '<C-w>k', '<C-w>k')
    call submode#enter_with('WinMove', 'n', '', '<C-w>l', '<C-w>l')
    call submode#map('WinMove', 'n', '', 'h', '<C-w>h')
    call submode#map('WinMove', 'n', '', 'j', '<C-w>j')
    call submode#map('WinMove', 'n', '', 'k', '<C-w>k')
    call submode#map('WinMove', 'n', '', 'l', '<C-w>l')

    " TabWidth {{{3
    call submode#enter_with('TabWidth', 'n', '', '>>', '>>')
    call submode#enter_with('TabWidth', 'n', '', '<<', '<<')
    call submode#map('TabWidth', 'n', '', '>', '>>')
    call submode#map('TabWidth', 'n', '', '.', '>>')
    call submode#map('TabWidth', 'n', '', '<', '<<')
    call submode#map('TabWidth', 'n', '', ',', '<<')
    " visual {{{3
    call submode#enter_with('TabWidth', 'v', '', '>', '>')
    call submode#enter_with('TabWidth', 'v', '', '<', '<')
    call submode#map('TabWidth', 'v', '', '>', 'gv>')
    call submode#map('TabWidth', 'v', '', '.', 'gv>')
    call submode#map('TabWidth', 'v', '', '<', 'gv<')
    call submode#map('TabWidth', 'v', '', ',', 'gv<')
    " TabPageMove {{{2
    call submode#enter_with('TabPageMove', 'n', '', 'gt', 'gt')
    call submode#enter_with('TabPageMove', 'n', '', 'gT', 'gT')
    call submode#map('TabPageMove', 'n', '', 't', 'gt')
    call submode#map('TabPageMove', 'n', '', 'l', 'gt')
    call submode#map('TabPageMove', 'n', '', 'T', 'gT')
    call submode#map('TabPageMove', 'n', '', 'h', 'gT')
    " }}}
endif

" vim: set fdm=marker fmr={{{,}}} fdl=1 :
