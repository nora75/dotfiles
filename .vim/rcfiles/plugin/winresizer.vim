if !dein#is_sourced('winresizer')
    finish
endif

" functions {{{1
func! s:winres() abort
    nnoremap <C-e> :<C-u>WinResizerStartMove<CR>
    if exists('Winresize')
        aug! Winresize
    endif
    WinResizerStartMove
    return
endfunc

" settings {{{1
let g:winresizer_finish_with_escape = 1
let g:winresizer_keycode_finish = 32 " <Space>

" mapping {{{1
" au {{{2
aug Winresize " {{{3
    au!
    if dein#is_sourced('vim-startify')
        au User Startified nnoremap <C-e> :<C-u>call <SID>winres()<CR>
    else
        au VimEnter nnoremap <C-e> :<C-u>call <SID>winres()<CR>
    endif
aug END
vnoremap <C-e> :<C-u>WinResizerStartMove<CR>
