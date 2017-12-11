if neobundle#is_installed("vim-markdown")
    " markdown option
    " let g:vim_markdown_folding_disabled = 1
    let g:vim_markdown_toc_autofit = 1

    augroup markdown " {{{2
        au!

        " markdownの時にキーバインドを
        autocmd FileType markdown call Markd()

        " OpenBrowser <Space>oでプレビュー
        autocmd FileType html nnoremap <buffer> <Space>p :execute "OpenBrowser" expand("%:p")<CR>

        " 自動でTocを閉じる
        " au BufWinLeave *.md,*.mdown,*.markdown 
    augroup END

    " augroup MdToc
    "     au!
    "     " markdownの時に保存時自動でTocする用のgr
    " aug END

    " keybind {{{2
    func! Markd()
        func! MarkToc() " TocToggle {{{ 3
            if exists("#BufWritePost#<buffer>")
                silent! au!  BufWritePost <buffer>
            else
                " markdownの時に保存時自動でToc
                au  BufWritePost *.md,*.mdown,*.markdown silent! Toc
            endif
        endfunc
        nnoremap <buffer> [Markdown]  <Nop>
        nmap     <buffer> <Space>m    [Markdown]

        nnoremap <buffer> [Markdown]t :<C-u>Toc<CR>
        nnoremap <buffer> [Markdown]i :<C-u>HeaderIncrease<CR>
        nnoremap <buffer> [Markdown]d :<C-u>HeaderDecrease<CR>
        nnoremap <buffer> [Markdown]w :<C-u>call MarkToc()<CR>
        nnoremap <buffer> <Space>p    :<C-u>PrevimOpen<CR>

        vnoremap <buffer> [Markdown]  <Nop>
        vmap     <buffer> <Space>m    [Markdown]

        vnoremap <buffer> [Markdown]i :HeaderIncrease<CR>
        vnoremap <buffer> [Markdown]d :HeaderDecrease<CR>
    endfunc
endif

" vim:set fdm=marker fdl=1 :
