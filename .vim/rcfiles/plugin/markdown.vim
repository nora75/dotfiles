if !neobundle#is_installed('vim-markdown')
    finish
endif
" markdown option
" let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_toc_autofit = 1
" disable ge mapping
let g:vim_markdown_follow_anchor = 1

augroup markdown " {{{2
    au!

    " mapping when markdown file
    autocmd FileType markdown call Markd()

    " preview by OpenBrowser
    autocmd FileType html nnoremap <buffer> <Space>p :execute "OpenBrowser" expand("%:p")<CR>

    " auto close Toc when buffer leaving
    " au BufWinLeave *.md,*.mdown,*.markdown 
augroup END

" mapping function {{{2
func! Markd()
    " normal {{{3
    nnoremap <buffer> [Markdown]  <Nop>
    nmap     <buffer> <Space>m    [Markdown]
    nnoremap <buffer><silent> [Markdown]t :<C-u>Toc<CR>
    nnoremap <buffer><silent> [Markdown]i :<C-u>HeaderIncrease<CR>
    nnoremap <buffer><silent> [Markdown]d :<C-u>HeaderDecrease<CR>
    nnoremap <buffer><silent> [Markdown]w :<C-u>call MarkToc()<CR>
    nnoremap <buffer> <Space>p    :<C-u>PrevimOpen<CR>
    " visual {{{3
    vnoremap <buffer> [Markdown]  <Nop>
    vmap     <buffer> <Space>m    [Markdown]
    vnoremap <buffer><silent> [Markdown]i :HeaderIncrease<CR>
    vnoremap <buffer><silent> [Markdown]d :HeaderDecrease<CR>
    let b:Markdown_AuToc = 0
endfunc
func! MarkToc() " TocToggle {{{ 2
    " auto do Toc command when bufwritepost in markdown file
    if (b:Markdown_AuToc)
        aug Toc
            au!
            au! BufWritePost <buffer>
        aug END
        let b:Markdown_AuToc = 0
    else
        aug Toc
            au!
            au BufWritePost <buffer> silent! Toc
        aug END
        let b:Markdown_AuToc = 1
    endif
endfunc

" vim:set fdm=marker fdl=1 :
