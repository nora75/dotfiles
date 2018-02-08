if neobundle#is_installed('nerdtree')
    scriptencoding utf-8
        let g:NERDTreeDirArrowExpandable = '▸'
        let g:NERDTreeDirArrowCollapsible = '▾'
        let g:NERDTreeShowBookmarks = 1
        " map {{{2
        nnoremap [nerd] <Nop>
        nmap <Space>f [nerd]
        nnoremap <silent>[nerd]t :<C-u>NERDTreeToggle<CR>
        nnoremap <silent>[nerd]f :<C-u>NERDTreeFocus<CR>
        nnoremap <silent>[nerd]j :<C-u>NERDTreeCWD<CR>
        nnoremap <silent>[nerd]c :<C-u>NERDTreeClose<CR>
        nnoremap <silent>[nerd]x :<C-u>NERDTreeClose<CR>
        " au BufEnter NERD_tree 
endif

" vim: set fdm=marker fdl=1 fmr={{{,}}} :
