if neobundle#is_installed('vim-table-mode')
    " table mode
    " disable default map and set own map (<Space>,)
    let g:table_mode_map_prefix = '<Space>,'
    let g:table_mode_corner_corner = '|'
    let g:table_mode_corner='|'
endif
