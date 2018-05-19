if !neobundle#is_installed('winresizer')
    finish
endif
let g:winresizer_finish_with_escape = 1
let g:winresizer_keycode_finish = 32 " <Space>
nnoremap <C-E> :<C-u>WinResizerStartMove<CR>
