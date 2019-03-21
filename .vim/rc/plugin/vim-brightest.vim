if !dein#is_sourced('vim-brightest')
    finish
endif
" let g:brightest#enable_on_CursorHold = 0
" let g:brightest#enable_clear_highlight_on_CursorMoved = 1
" let g:brightest#enable_highlight_all_window = 1
nnoremap [bright] <Nop>
nmap <Space>b [bright]
nmap [bright]b :<C-u>BrightestToggle<CR>
nmap [bright]t :<C-u>BrightestToggle<CR>
