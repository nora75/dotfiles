if !dein#tap('vim-table-mode')
    finish
endif
" table mode
" disable default map and set own map (<Space>,)
let g:table_mode_map_prefix = '<Space>,'
let g:table_mode_corner_corner = '|'
let g:table_mode_corner='|'
" auto align when recognize changed in file
let g:table_mode_auto_align = 1
