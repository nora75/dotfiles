" markdown option {{{1
" let g:vim_markdown_folding_disabled = 1
" let g:vim_markdown_toc_autofit = 1
" disable ge mapping

let g:vim_markdown_folding_style_pythonic = 1
" let g:vim_markdown_follow_anchor = 1
" disable default mapping
let g:vim_markdown_no_default_key_mappings = 1
" fold level setting
let g:vim_markdown_folding_level = 2

" global function {{{1
" Mmap() abort {{{2
func! Mmap() abort
    let bid = win_getid(winnr())
    Toc
    exe 'nnoremap <buffer><silent> <Space>mt :<C-u>call win_gotoid('.bid.')<CR>'
    exe 'vnoremap <buffer><silent> <Space>mt :<C-u>call win_gotoid('.bid.')<CR>'
    call win_gotoid(bid)
    return bid
endfunc

" local function {{{1
" s:toc() abort {{{2
func! s:toc() abort
    nnoremap <buffer><silent> [Markdown]t :<C-u>Toc<CR>
    vnoremap <buffer><silent> [Markdown]t :<C-u>Toc<CR>
    let b:Markdown_IsToc = Mmap()
    return
endfunc

" s:updateToc() abort {{{2
func! s:updateToc()
    echom 'updatetoc'
    if !exist('b:Markdown_IsToc') || b:Markdown_IsToc == 0
        return
    endif
    let bid = win_getid(winnr())
    Toc
    call win_gotoid(bid)
    return
endfunc


" command {{{1
" :Toc {{{2
" command! -nargs=0 Toce call Mmap()

" au {{{1
augroup markdown " {{{2
    au!

    " mapping when markdown file
    autocmd FileType markdown call Markd()
    " autocmd FileType markdown au WinEnter <buffer> if exists('t:toc')|call <SID>backmap()|endif
    " autocmd FileType markdown au QuickfixCmdPost <buffer> au WinEnter <buffer> if exists('t:toc')|call <SID>backmap()|endif
    " autocmd FileType markdown au QuickfixCmdPost <buffer> au WinEnter <buffer> nnoremap <buffer><silent> :<C-u>call win_gotoid(w:toc)<CR>

    " auto update when modified
    " maybe use timer is better(best)
    " an error occured!!
    " autocmd BufRead *.markdown au CursorHold <buffer><silent> if &modified|echom 'mod'|call <SID>updateToc()|endif

    " preview by OpenBrowser
    " mapping on html files
    autocmd FileType html nnoremap <buffer> <Space>p :execute "OpenBrowser" expand("%:p")<CR>

    " auto close Toc when buffer leaving
    " au BufWinLeave *.md,*.mdown,*.markdown 
augroup END

" mapping function {{{1
" Markd() {{{3
func! Markd()
    " normal {{{3
    nnoremap <buffer> [Markdown]  <Nop>
    nmap     <buffer> <Space>m    [Markdown]
    nnoremap <buffer><silent> [Markdown]t :<C-u>call <SID>toc()<CR>
    nnoremap <buffer><silent> [Markdown]i :<C-u>HeaderIncrease<CR>
    nnoremap <buffer><silent> [Markdown]d :<C-u>HeaderDecrease<CR>
    nnoremap <buffer><silent> [Markdown]w :<C-u>call MarkToc()<CR>
    nnoremap <buffer> <Space>p    :<C-u>PrevimOpen<CR>
    " visual {{{3
    vnoremap <buffer> [Markdown]  <Nop>
    vmap     <buffer> <Space>m    [Markdown]
    vnoremap <buffer><silent> [Markdown]t :<C-u>call <SID>toc()<CR>
    vnoremap <buffer><silent> [Markdown]i :HeaderIncrease<CR>
    vnoremap <buffer><silent> [Markdown]d :HeaderDecrease<CR>
    let b:Markdown_AuToc = 0
    let b:Markdown_IsToc = 0
endfunc

" TocToggle {{{ 2
func! MarkToc()
    " auto execute Toc command when bufwritepost in markdown file
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
    return
endfunc

" Create Markdown Hyperlink Automatically
" Requires mattn/webapi-vim (or vital.vim), tpope/vim-surround,
" kana/vim-textobj-user, mattn/vim-textobj-url
" functions {{{2
function! GetWebPageTitle(url)
    let url = s:remove(a:url)
    let res = webapi#http#get(url)
    let dom = webapi#html#parse(res.content)
    let title = dom.childNode('head').childNode('title').value()
    let title = s:remove(title)
    return title
endfunction
function! CreateMarkdownHyperLinkWithTitle()
    let areg = @a
    normal viu
    normal! "ay
    let url = @a
    try
        let title = GetWebPageTitle(url)
    catch
        echo "Can't get url title.Please input by yourself."
        call <SID>createMarkdownHyperLink()
        return
    endtry
    execute 'normal viusa(i['.title.']'
    let @a = areg
endfunction
function! s:createMarkdownHyperLink()
    execute 'normal viusa(i[]'
    startinsert
endfunction
" mappings {{{2
function! Marklink()
    if !mapcheck('[Markdown]','n')
        call Markd()
    endif
    nnoremap <buffer><silent>  [Markdown]u :<C-u>call CreateMarkdownHyperLinkWithTitle()<CR>
endfunction
func! s:remove(...) abort
    if a:0 > 1
        let curline = a:2
    else
        let curline = a:1
    endif
    let curline = substitute(curline,'\M\n\|\r\|\r\n','','g')
    let curline = matchstr(curline,'\M\S\.\*')
    let curline = substitute(curline,'\M\s\*$','','g')
    if curline == ''
        throw 1
    endif
    return curline
endfunc

aug markdown
    autocmd FileType markdown call Marklink()
aug END

" vim:set fdm=marker fdl=1:
