if !neobundle#is_installed('vim-indent-guides')
    finish
endif
" let g:indent_guides_enable_on_vim_startup = 1
" set highligit Normal in term because,don't exists Normal highlight in term
if !has("gui") " {{{2
    augroup indent " {{{3
        au!
        autocmd VimEnter,Colorscheme * :hi Normal  ctermbg=bg
        let g:indent_guides_auto_colors = 0
        autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=darkgray
        autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=gray
    augroup END
endif
" vim: set fdm=marker fmr={{{,}}} fdl=1 :
