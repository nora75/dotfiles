scriptencoding utf-8
if !has('terminal')
    finish
endif

" vital-palette-keymapping
" <A-w> みたいなのを \<A-w> にして feedkeys() で呼び出せるようにするためのエスケープ関数
function! s:escape_special_key(key)
    " Workaround : <C-?> https://github.com/osyo-manga/vital-palette/issues/5
    if a:key ==# "<^?>"
        return "\<C-?>"
    endif
    execute 'let result = "' . substitute(escape(a:key, '\"'), '\(<.\{-}>\)', '\\\1', 'g') . '"'
    return result
endfunction

" キーマッピングの設定
" set termwinkey=<A-w>
if exists(":tmap")
    tnoremap <Esc> <C-w><S-n>
    " tnoremap p i<C-w>""
endif

function! s:bufnew()
    if &buftype == "terminal" && &filetype == ""
        set filetype=terminal
    endif
endfunction


function! s:filetype()
    " set filetype=terminal のタイミングでは動作しなかったので
    " timer_start() で遅延して設定する
    call timer_start(0, { -> feedkeys(s:escape_special_key(&termwinkey) . "\<S-n>") })
endfunction


augroup my-terminal
    autocmd!
    autocmd BufNew * call timer_start(0, { -> s:bufnew() })
    " autocmd FileType terminal call s:filetype()
augroup END


function! s:open(args) abort
    if empty(term_list())
        execute "terminal" a:args
        let s:bufwin = bufwinid(bufnr(''))
    else
        exe 'tabn '.win_id2tabwin(s:bufwin)[0]
        call win_gotoid(s:bufwin)
    endif
endfunction


" すでに :terminal が存在していればその :terminal を使用する
command! -nargs=*
\   Terminal call s:open(<q-args>)
