" neobundle initialize {{{2
if exists("g:NeobundleInstalled")
    finish
endif

let g:NeobundleInstalled = 1

filetype off

if has('vim_starting')
    if &runtimepath !~# '\neobundle.vim'
        set runtimepath+=~\.vim\bundle\neobundle.vim
    endif
endif
" add plugin {{{2
call neobundle#begin(expand('~/.vim/bundle'))

NeoBundleFetch 'Shougo/neobundle.vim'

" must {{{3
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'osyo-manga/vim-anzu'
NeoBundle 'kana/vim-submode'
NeoBundle 'xolox/vim-misc'
NeoBundle 'xolox/vim-session', {
            \ 'depends' : 'xolox/vim-misc',
          \ }
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'itchyny/lightline.vim'
" NeoBundle 'tyru/eskk.vim'

" unite {{{3
NeoBundle 'Shougo/vimproc', {
\ 'build' : {
\ 'windows' : 'make -f make_mingw32.mak',
\ 'unix' : 'make -f make_unix.mak',
\ },
\ }
NeoBundle 'Shougo/unite.vim',
\ { 'depends': ['Shougo/vimproc',
\ 'Shougo/neomru.vim' ],
\ }
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'ujihisa/unite-colorscheme',
\ { 'depends' : 'Shougo/unite.vim',
\ }

" Lazy
" source rcfiles/bundleLazy.vim

" md or html {{{3
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'dhruvasagar/vim-table-mode'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'kannokanno/previm', {
            \ 'depends' :  'tyru/open-browser.vim',
            \ }
NeoBundle 'alvan/vim-closetag'
" NeoBundle 'thinca/vim-quickrun'

NeoBundleCheck

call neobundle#end()

" 必須 {{{2
filetype plugin indent on
filetype detect

" vim: set fdm=marker fmr={{{,}}} fdl=1 :
