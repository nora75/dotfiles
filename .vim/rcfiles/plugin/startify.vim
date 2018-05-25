if !neobundle#is_installed('vim-startify')
    finish
endif

" functions {{{1
" local {{{2
if neobundle#is_installed('vim-markdown')
    " s:aumap() abort {{{2
    func! s:aumap(bid) abort
        echom 'before toc'
        Toc
        echom 'after toc'
        echom 'before mapping'
        exe 'nnoremap <buffer> <Space>mt :<C-u>call win_gotoid('.a:bid.')<CR>'
        echom 'end mapping'
        return
    endfunc!

    " s:toc(file) abort {{{3
    func! s:toc(file,...) abort
        let bid = win_getid()
        exe 'e' a:file
        return
    endfunc
    " s:SID() abort {{{3
	function s:SID() abort
	  return matchstr(expand('<sfile>'), '<SNR>\zs\d\+\ze_SID$')
	endfun
    let s:sid = function('s:SID')
endif

" settings {{{1
" custom list {{{2
let g:startify_bookmarks = [ { 'v':'~/.vim/rcfiles/' } ]
let g:startify_session_dir = '~/.vim/session'
let g:startify_session_number = 10
let g:startify_session_sort = 1
let g:startify_session_persistence = 1
let g:startify_lists = [
\ { 'type': 'sessions', 'header': ['Sessions'] },
\ { 'type': 'bookmarks', 'header': ['Bookmarks'] },
\ { 'type': 'commands', 'header': ['Commands'] }
\ ]
" \ { 'type': 'files',     'header': [   'MRU']            },
" \ { 'type': 'dir',       'header': [   'MRU '. getcwd()] },
" let g:startify_skiplist = [
" \ 'COMMIT_EDITMSG',
" \ 'bundle/.*/doc',
" \ 'plugins/vimdoc-ja/doc/',
" \ 'AppData/Local/Temp/.*\.tmp',
" \ 'vim\d+\\doc\\'
" \ ]

" custom commands {{{2
let g:startify_commands = [
\ { 'd' : [ 'open default session', 'SLoad default.vim' ] },
\ { 'o' : [ 'open default session', 'SLoad default.vim' ] },
\ { 'sd' : [ 'open db session', 'SLoad db.vim' ] },
\ { 'sm' : [ 'move note dir and open filer', 'exe "cd D:\\Users\\NORA\\Documents\\授業ノート\\"|e %:h\' ] }
\ ]
" \ { 'ss' : [ 'open sec.md', 'call <SNR>'.eval(s:sid).'_aumap(<SNR>'.eval(s:sid).'_toc("sec.md"))' ] } ,
" \ { 'se' : [ 'move note dir and open filer', 'exe "cd D:\\Users\\NORA\\Documents\\授業ノート\\"|call '.eval(s:sid).'aumap('.eval(s:sid).'toc("eigo.md"))' ] } ,

" session {{{2
let g:startify_session_before_save = [
\ 'echo "Cleaning up before saving.."',
\ 'silent! NERDTreeTabsClose'
\ ]

" custom header {{{2
let s:StartifyHeader = { 'data' : [
\ '                              ___     ',
\ '     ___        ___          /__/\    ',
\ '    /__/\      /  /\        |  |::\   ',
\ '    \  \:\    /  /:/        |  |:|:\  ',
\ '     \  \:\  /__/::\      __|__|:|\:\ ',
\ ' ___  \__\:\ \__\/\:\__  /__/::::| \:\',
\ '/__/\ |  |:|    \  \:\/\ \  \:\~~\__\/',
\ '\  \:\|  |:|     \__\::/  \  \:\      ',
\ ' \  \:\__|:|     /__/:/    \  \:\     ',
\ '  \__\::::/      \__\/      \  \:\    ',
\ '      ~~~~                   \__\/    '
\ ] }

let s:StartifyFooter = { 'data' : [
\ '                               ___     ',
\ '    ___            ___        /  /\    ',
\ '   /  /\          /__/\      /  /::|   ',
\ '  /  /:/          \__\:\    /  /:|:|   ',
\ ' /  /:/           /  /::\  /  /:/|:|__ ',
\ '/__/:/  ___    __/  /:/\/ /__/:/_|::::\',
\ '|  |:| /  /\  /__/\/:/~~  \__\/  /~~/:/',
\ '|  |:|/  /:/  \  \::/           /  /:/ ',
\ '|__|:|__/:/    \  \:\          /  /:/  ',
\ ' \__\::::/      \__\/         /__/:/   ',
\ '     ~~~~                     \__\/    '
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

let s:StartifyFooter.center = function(s:StartifyHeader.center)
let g:startify_custom_header = s:StartifyHeader.center()
let g:startify_custom_footer = s:StartifyFooter.center()
let g:startify_padding_left = 4
let g:startify_fortune_use_unicode = 1

if neobundle#is_installed('vim-indent-guides')
    aug startify
        au User Startified IndentGuidesDisable|au BufLeave <buffer> IndentGuidesEnable
    aug end
endif

" vim: set fdm=marker fmr={{{,}}} fdl=1 :
