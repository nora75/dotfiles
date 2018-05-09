if !neobundle#is_installed('vim-startify')
    finish
endif
" custom list {{{2
let g:startify_bookmarks = [ { 'v':'~/.vim/rcfiles/' } ]
let g:startify_session_dir = '~/.vim/session'
let g:startify_session_number = 10
let g:startify_session_sort = 1
let g:startify_session_persistence = 1
let g:startify_lists = [
\ { 'type': 'sessions',  'header': [   'Sessions']       },
\ { 'type': 'bookmarks', 'header': [   'Bookmarks']      },
\ { 'type': 'files',     'header': [   'MRU']            },
\ { 'type': 'commands',  'header': [   'Commands']       },
\ ]
" \ { 'type': 'dir',       'header': [   'MRU '. getcwd()] },
let g:startify_session_before_save = [
\ 'echo "Cleaning up before saving.."',
\ 'silent! NERDTreeTabsClose'
\ ]
let g:startify_commands = [
\ { 'd' : [ 'open default session', 'SLoad default.vim' ] },
\ { 'o' : [ 'open default session', 'SLoad default.vim' ] },
\ { 'sd' : [ 'open db session', 'SLoad db.vim' ] },
\ { 'ss' : [ 'open sec.md', 'exe "cd D:\\Users\\NORA\\Documents\\授業ノート\\"|e sec.md|norm zR' ] },
\ { 'sm' : [ 'move note dir', 'PluginCheck' ] },
\ { 'h' : ':help' },
\ ]

" custom header {{{2
let s:StartifyHeader = { 'data' : [
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
let g:startify_skiplist = [
\ 'COMMIT_EDITMSG',
\ 'bundle/.*/doc',
\ 'bundle/.*/doc',
\ '/plugins/vimdoc-ja/doc/',
\ ]
let g:startify_padding_left = 4
let g:startify_fortune_use_unicode = 1
if neobundle#is_installed('vim-indent-guides')
    aug startify
        au User Startified IndentGuidesDisable|au BufLeave <buffer> IndentGuidesEnable
    aug end
endif

" vim: set fdm=marker fmr={{{,}}} fdl=1 :
