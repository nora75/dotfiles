if neobundle#is_installed("vim-indent-guides")
    let g:indent_guides_enable_on_vim_startup = 1
    " term では何故かnormal highlight がないらしい
    if !has("gui") " {{{2
        augroup indent " {{{3
            au!
            autocmd VimEnter,Colorscheme * :hi Normal  ctermbg=bg
            let g:indent_guides_auto_colors = 0
            autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=darkgray
            autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=gray
        augroup END
    endif
endif
" vim: set fdm=marker fmr={{{,}}} fdl=1 :
