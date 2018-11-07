if !dein#is_sourced('vim-submode')
    finish
endif
" options {{{1
let g:submode_always_show_submode = 1
let g:submode_keep_leaving_key = 1
" let g:submode_timeoutlen = 500
let g:submode_keyseqs_to_leave = [ '<Space>', '<ESC>' ]

" mapping {{{1
" s:remap() abort {{{2
func! s:remap() abort
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
    " call submode#enter_with('WinMove', 'n', '', '<C-w>t', '<C-w>t')
    " call submode#enter_with('WinMove', 'n', '', '<C-w>b', '<C-w>b')
    call submode#enter_with('WinMove', 'n', '', '<C-w>h', '<C-w>h')
    call submode#enter_with('WinMove', 'n', '', '<C-w>j', '<C-w>j')
    call submode#enter_with('WinMove', 'n', '', '<C-w>k', '<C-w>k')
    call submode#enter_with('WinMove', 'n', '', '<C-w>l', '<C-w>l')
    call submode#map('WinMove', 'n', '', 'h', '<C-w>h')
    call submode#map('WinMove', 'n', '', 'j', '<C-w>j')
    call submode#map('WinMove', 'n', '', 'k', '<C-w>k')
    call submode#map('WinMove', 'n', '', 'l', '<C-w>l')

    " TabWidth {{{2
    " TabWidth normal {{{3
    call submode#enter_with('TabWidthn', 'n', '', 'g>', '>>')
    call submode#enter_with('TabWidthn', 'n', '', 'g<', '<<')
    call submode#map('TabWidthn', 'n', '', '>', '>>')
    call submode#map('TabWidthn', 'n', '', '.', '>>')
    call submode#map('TabWidthn', 'n', '', '<', '<<')
    call submode#map('TabWidthn', 'n', '', ',', '<<')
    " TabWidth visual {{{3
    call submode#enter_with('TabWidthv', 'v', '', '>', '>gv')
    call submode#enter_with('TabWidthv', 'v', '', '<', '<gv')
    call submode#map('TabWidthv', 'v', '', '>', '>gv')
    call submode#map('TabWidthv', 'v', '', '.', '>gv')
    call submode#map('TabWidthv', 'v', '', '<', '<gv')
    call submode#map('TabWidthv', 'v', '', ',', '<gv')
    call submode#map('TabWidthv', 'v', '', 'j', 'j')
    call submode#map('TabWidthv', 'v', '', 'k', 'k')
    call submode#map('TabWidthv', 'v', '', 'h', 'h')
    call submode#map('TabWidthv', 'v', '', 'l', 'l')

    " TabPageMove {{{2
    call submode#enter_with('TabPageMove', 'n', '', 'gt', 'gt')
    call submode#enter_with('TabPageMove', 'n', '', 'gT', 'gT')
    call submode#map('TabPageMove', 'n', '', 't', 'gt')
    call submode#map('TabPageMove', 'n', '', 'l', 'gt')
    call submode#map('TabPageMove', 'n', '', 'T', 'gT')
    call submode#map('TabPageMove', 'n', '', 'h', 'gT')

    " TabMove {{{2
    call submode#enter_with('TabMove', 'n', 'r', '<Space>th','[TabG]h')
    call submode#enter_with('TabMove', 'n', 'r', '<Space>tl','[TabG]l')
    call submode#map('TabMove', 'n', 'r', 'h', '[TabG]h')
    call submode#map('TabMove', 'n', 'r', 'l', '[TabG]l')
    call submode#map('TabMove', 'n', 'r', 'j', '[TabG]j')
    call submode#map('TabMove', 'n', 'r', 'k', '[TabG]k')

    " LineMove {{{2
    " swap current line to up or down
    call submode#enter_with('LineMove', 'n', 'r',  '<Space>lj', '[LineMove]j')
    call submode#enter_with('LineMove', 'n', 'r', '<Space>lk', '[LineMove]k')
    call submode#map('LineMove', 'n', 'r', 'j', '[LineMove]j')
    call submode#map('LineMove', 'n', 'r', 'k', '[LineMove]k')

    " Trans {{{2
    " change transparency
    call submode#enter_with('Trans', 'n', 'r', '<Space>+', '[TransP]')
    call submode#enter_with('Trans', 'n', 'r', '<Space>-', '[TransM]')
    call submode#map('Trans', 'n', 'r', 'k', '[TransP]')
    call submode#map('Trans', 'n', 'r', 'j', '[TransM]')
    call submode#map('Trans', 'n', 'r', '+', '[TransP]')
    call submode#map('Trans', 'n', 'r', '-', '[TransM]')
    call submode#map('Trans', 'n', 'r', 'l', '[TransP]')
    call submode#map('Trans', 'n', 'r', 'h', '[TransM]')

    return
endfunc
" }}}

" s:unmap() abort {{{2
func! s:unmap() abort
    try
        nunmap <C-w>>
        nunmap <C-w><
        nunmap <C-w>+
        nunmap <C-w>-

        " nunmap <C-w>t
        " nunmap <C-w>b
        nunmap <C-w>h
        nunmap <C-w>j
        nunmap <C-w>k
        nunmap <C-w>l

        nunmap g>
        nunmap g<
        " >vunmap 
        " vunmap <

        nunmap gt
        nunmap gT

        nunmap <Space>th
        nunmap <Space>tl

        nunmap <Space>lj
        nunmap <Space>lk
    catch
    endtry

    return
endfunc

call s:remap()

" command {{{1
" :SubUnmap {{{2
command! -nargs=0 SubUnmap call s:unmap()

" :SubRemap {{{2
command! -nargs=0 SubRemap call s:remap()

" au {{{1
aug terminal
    au!
    au FileType terminal SubUnmap
    au FileType terminal au BufWinLeave <buffer> SubRemap
aug END

" }}}

" vim: set fdm=marker fmr={{{,}}} fdl=1 :
