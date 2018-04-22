if neobundle#is_installed('vim-easy-align')
    " custom list {{{2
    let g:startify_bookmarks = [ { 'v':'~/.vim/rcfiles/' } ]
    let g:startify_session_dir = '~/.vim/session'
    let g:startify_lists = [
    \ { 'type': 'sessions',  'header': [   'Sessions']       },
    \ { 'type': 'bookmarks', 'header': [   'Bookmarks']      },
    \ { 'type': 'files',     'header': [   'MRU']            },
    \ { 'type': 'dir',       'header': [   'MRU '. getcwd()] },
    \ { 'type': 'commands',  'header': [   'Commands']       },
    \ ]
    let g:startify_session_before_save = [
    \ 'echo "Cleaning up before saving.."',
    \ 'silent! NERDTreeTabsClose'
    \ ]
    if neobundle#is_installed('vim-indent-guides')
        aug startify
            au BufRead Startify if !exists('g:startifyIndent')|let g:startifyIndent = 1|IndentGuidesEnable|endif
            " au BufEnter,WinEnter,FileType * if !exists('g:startifyIndent')|let g:startifyIndent = 1|IndentGuidesEnable|endif
            au BufEnter Startify IndentGuidesDisable|let g:startifyIndent = 0
        aug end
    endif

    " custom header {{{2
    let s:StartifyHeader = { 'data' : [
    \ '                           ',
    \ '         __                ',
    \ ' __  __ /\_\    ___ ___    ',
    \ '/\ \/\ \\/\ \ /'' __` __`\ ',
    \ '\ \ \_/ |\ \ \/\ \/\ \/\ \ ',
    \ ' \ \___/  \ \_\ \_\ \_\ \_\',
    \ '  \/__/    \/_/\/_/\/_/\/_/',
    \ ] }
    func! s:StartifyHeader.center()
        let line = winwidth(0)
        if &nu
            let line -= &nuw
        endif
        let line -= strchars(self.data[0])
        if line < 0
            let self.data = ['']
        else
            if line % 2 == 1
                call map(self.data,'v:val." "')
            endif
            let line = line / 2
            call map(self.data,'repeat(" ",line).v:val.repeat(" ",line)')
        endif
        return self.data
    endfunc
    let g:startify_custom_header = s:StartifyHeader.center()
endif
