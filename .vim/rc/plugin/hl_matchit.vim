echom 'test'
if !exists(':ReloadVimrc')
    command! -nargs=0 ReloadVimrc exe g:ReloadVimrc.ret()
else
    if exists('g:ReloadVimrc')
        let i = 0
        while i < len(g:ReloadVimrc.data)
            if g:ReloadVimrc.data[i] =~? 'MYVIMRC'
                call insert(g:ReloadVimrc.data,'exe "HiMatchOff"',i)
                call insert(g:ReloadVimrc.data,'exe "NoHiMatch"',i)
                break
            endif
            let i += 1
        endwhile
    else
        let g:ReloadVimrc = {'data':['let g:ReloadVimrc.save_cuwinid = win_getid()','exe "NoHiMatch"','exe "HiMatchOff"','source $MYVIMRC','exe "HiMatchOn"','set nohlsearch','call win_gotoid(g:ReloadVimrc.save_cuwinid)'],'save_winid':''}
        func! g:ReloadVimrc.ret() abort
            return join(self.data,'|')
        endfunc
    endif
endif
