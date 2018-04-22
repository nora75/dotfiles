" neobundle initialize {{{2
filetype off

if has('vim_starting')
    if &runtimepath !~# '/neobundle.vim'
        set runtimepath+=~/.vim/bundle/neobundle.vim
    else
        finish
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
NeoBundle 'mhinz/vim-startify'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'junegunn/vim-easy-align'
" NeoBundle 'powerline/powerline', { 'rtp' : 'powerline/bindings/vim'}
" NeoBundle 'itchyny/lightline.vim'
NeoBundle 'simeji/winresizer'

" highlight {{{3
NeoBundle 't9md/vim-quickhl'
NeoBundle 'tmhedberg/matchit'
NeoBundle 'vimtaku/hl_matchit.vim', {
\ 'depends' : 'tmhedberg/matchit',
\ }

" operator and textobj {{{3
NeoBundle 'kana/vim-operator-user'
NeoBundle 'kana/vim-operator-replace'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'sgur/vim-textobj-parameter'
NeoBundle 'osyo-manga/vim-jplus'
NeoBundle 'osyo-manga/vim-operator-stay-cursor'
NeoBundle 'osyo-manga/vim-textobj-blockwise'
NeoBundle 'h1mesuke/textobj-wiw'

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
NeoBundle 'suan/vim-instant-markdown'
NeoBundle 'alvan/vim-closetag'
" NeoBundle 'thinca/vim-quickrun'
NeoBundle 'nora75/markdowntable'

" colorscheme {{{3
NeoBundle 'vim-scripts/twilight'
" too many colorschemes
NeoBundle 'flazz/vim-colorschemes'

" test {{{3
NeoBundle 'vim-scripts/AdvancedSorters'

NeoBundleCheck

call neobundle#end()

" end {{{2
filetype plugin indent on
filetype detect

" vim: set fdm=marker fmr={{{,}}} fdl=1 :
