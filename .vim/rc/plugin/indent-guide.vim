if !dein#tap('vim-indent-guides')
    finish
endif
" func! s:en() abort
"     IndentGuidesEnable
"     return
" endfunc

augroup indent
    au!
    au InsertEnter * try|IndentGuidesEnable|catch|au! indent InsertEnter *|endtry
aug END

" let g:indent_guides_enable_on_vim_startup = 1
" set highligit Normal in term because,don't exists Normal highlight in term
if !has("gui") " {{{2
    let g:indent_guides_auto_colors = 0
    augroup indent " {{{3
        autocmd VimEnter,Colorscheme * hi Normal ctermfg=252 ctermbg=234 guifg=#c6c8d1 guibg=#161821
        autocmd VimEnter,Colorscheme * hi IndentGuidesOdd  ctermbg=DarkGray
        autocmd VimEnter,Colorscheme * hi IndentGuidesEven ctermbg=Gray
    augroup END
else
endif
" vim: set fdm=marker fmr={{{,}}} fdl=1 :