if !dein#is_sourced('vim-go')
    finish
endif
let g:go_fmt_command = "goimports"
let g:go_metalinter_autosave = 1
