if has('kaoriya')
    " add all folder under the $vim/plugins to rtp
    for s:path in split(glob($VIM.'/plugins/*'), '\n')
        if s:path !~# '\~$' && isdirectory(s:path)
            let &runtimepath = &runtimepath.','.s:path
        end
    endfor
    unlet s:path

    "---------------------------------------------------------------------------
    " Setting for read file in Japanese

    " fix for windows
    " don't add $vim not yet can't read exe files on windows
    if has('win32') && $PATH !~? '\(^\|;\)' . escape($VIM, '\\') . '\(;\|$\)'
        let $PATH = $VIM . ';' . $PATH
    endif

    " vimproc: disable vimproc included with KaoriYa
    let &rtp = join(filter(split(&rtp, ','), 'v:val !~ "[/\\\\]plugins[/\\\\]vimproc$"'), ',')

    " go-extra: disable go-extra included with KaoriYa
    let &rtp = join(filter(split(&rtp, ','), 'v:val !~ "[/\\\\]plugins[/\\\\]golang$"'), ',')


    " Disable Screen Mode (kaoriya)
    let g:plugin_scrnmode_disable = 'yes'

    " kaoriya command disable
    let g:plugin_cmdex_disable = 1

    " for KaoriYa's plugins

    " correspond auto wrap word in Japanese
    set formatoptions+=mM
    " Setting for Os which recognize upper/lower file name same
    "
    if filereadable($VIM . '/vimrc') && filereadable($VIM . '/ViMRC')
        " prevent tag file dupricate
        set tags=./tags,tags
    endif

    " autofmt: format function that support Japanese
    set formatexpr=autofmt#japanese#formatexpr()

endif

" correspond move slow when $display is set
if !has('gui_running') && has('xterm_clipboard')
    set clipboard=exclude:cons\\\|linux\\\|cygwin\\\|rxvt\\\|screen
endif

command! -nargs=* -range Transform <line1>,<line2>call Transform(<f-args>)
function! Transform(from_str, to_str, ...)
    if a:0 | let string = a:1 | else | let string = getline(".") | endif
    let from_ptr = 0 | let to_ptr = 0
    while 1
        let from_char = matchstr(a:from_str, '^.', from_ptr)
        if from_char == ''
            break
        endif
        let to_char = matchstr(a:to_str, '^.', to_ptr)
        let from_ptr = from_ptr + strlen(from_char)
        let to_ptr = to_ptr + strlen(to_char)
        let string = substitute(string, from_char, to_char, 'g')
    endwhile
    if a:0 | return string | else | call setline(".", string) | endif
endfunction
