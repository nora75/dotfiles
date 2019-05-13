" neobundle initialize {{{1
syntax off
if &compatible
    set nocompatible
endif

if has('vim_starting')
    if &runtimepath !~# '/dein.vim'
        let &runtimepath = &rtp.',~/.vim/dein/dein.vim'
    endif
    let g:dein#types#git#default_protocol = 'ssh'
else
    filetype plugin indent on
    syntax on
    finish
endif

" add plugin {{{1
if dein#load_state('~/.vim/dein')
    call dein#begin('~/.vim/dein')
    call dein#load_toml('~/.vim/toml/dein.toml', {'lazy': 0})
    call dein#load_toml('~/.vim/toml/dein_lazy.toml', {'lazy': 1})
    call dein#load_toml('~/.vim/toml/dein_lazy2.toml', {'lazy': 1})
    call dein#end()
    call dein#save_state()
endif

if has('win32') || has('win64')
    let g:vimproc#download_windows_dll = 1
endif

filetype plugin indent on
syntax enable

if dein#check_install()
    call dein#install()
endif

" vim: set fdm=marker fmr={{{,}}} fdl=1 :
