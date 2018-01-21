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

    " mapping {{{2
    func! Markd()
        nnoremap <buffer> [Markdown]  <Nop>
        nmap     <buffer> <Space>m    [Markdown]

        nnoremap <buffer><silent> [Markdown]t :<C-u>Toc<CR>
        nnoremap <buffer><silent> [Markdown]i :<C-u>HeaderIncrease<CR>
        nnoremap <buffer><silent> [Markdown]d :<C-u>HeaderDecrease<CR>
        nnoremap <buffer><silent> [Markdown]w :<C-u>call MarkToc()<CR>
        nnoremap <buffer> <Space>p    :<C-u>PrevimOpen<CR>

        vnoremap <buffer> [Markdown]  <Nop>
        vmap     <buffer> <Space>m    [Markdown]

        vnoremap <buffer><silent> [Markdown]i :HeaderIncrease<CR>
        vnoremap <buffer><silent> [Markdown]d :HeaderDecrease<CR>
        let b:Markdown_AuToc = 0
    endfunc
    func! MarkToc() " TocToggle {{{ 2
        " markdownの時に保存時自動でToc
        if b:Markdown_AuToc
            au! BufWritePost <buffer>
            let b:Markdown_AuToc = 0
        else
            au BufWritePost <buffer> silent! Toc
            let b:Markdown_AuToc = 1
        endif
    endfunc
endif

" vim:set fdm=marker fdl=1 :
