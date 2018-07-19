scriptencoding utf-8

" neobundle initialize {{{1
syntax off
if &compatible
    set nocompatible
endif

if has('vim_starting')
    if &runtimepath !~# '/dein.vim'
        let &runtimepath = &rtp.',~/.vim/dein/dein.vim'
    endif
else
    finish
endif

" add plugin {{{1
if dein#load_state('~/.vim/dein')
    call dein#begin('~/.vim/dein')

    call dein#add('~/.vim/dein/dein.vim')

    " must {{{3
    call dein#add('tpope/vim-surround')
    call dein#add('tpope/vim-commentary')
    call dein#add('tpope/vim-repeat')
    call dein#add('nathanaelkane/vim-indent-guides', {
    \ 'on_i' : 1
    \ } )
    call dein#add('osyo-manga/vim-anzu')
    call dein#add('kana/vim-submode')
    call dein#add('mhinz/vim-startify')
    call dein#add('scrooloose/nerdtree')
    call dein#add('junegunn/vim-easy-align')

    " powerline's classification(分類) {{{4
    " call dein#add('powerline/powerline', { 'rtp' :
    " 'powerline/bindings/vim'})
    call dein#add('itchyny/lightline.vim')
    call dein#add('simeji/winresizer')
    " fonts for powerline {{{5
    " call dein#add('ryanoasis/vim-devicons')
    " call dein#add('powerline/fonts')

    " highlight {{{3
    " call dein#add('t9md/vim-quickhl')
    call dein#add('tmhedberg/matchit')
    call dein#add('vimtaku/hl_matchit.vim', {
    \ 'depends' : 'tmhedberg/matchit',
    \ } )

    " operator and textobj {{{3
    call dein#add('kana/vim-operator-user')
    call dein#add('kana/vim-operator-replace')
    call dein#add('kana/vim-textobj-user')
    call dein#add('sgur/vim-textobj-parameter')
    call dein#add('osyo-manga/vim-jplus')
    call dein#add('osyo-manga/vim-operator-stay-cursor')
    call dein#add('osyo-manga/vim-textobj-blockwise')
    call dein#add('kana/vim-textobj-function')
    " call dein#add('h1mesuke/textobj-wiw')

    " unite {{{3
    call dein#add('Shougo/vimproc')
    call dein#add('Shougo/unite.vim',
    \ { 'depends': ['Shougo/vimproc',
    \ 'Shougo/neomru.vim' ],
    \ } )
    call dein#add('Shougo/neomru.vim')
    call dein#add('ujihisa/unite-colorscheme',
    \ { 'depends' : 'Shougo/unite.vim',
    \ } )

    " md or html {{{3
    call dein#add('plasticboy/vim-markdown',{'on_ft':'markdown'})
    call dein#add('dhruvasagar/vim-table-mode',{'on_ft':'markdown'})
    call dein#add('tyru/open-browser.vim',{'on_ft':['html','markdown']})
    call dein#add('kannokanno/previm', {
    \ 'on_ft':['html','markdown']
    \ } )
    call dein#add('alvan/vim-closetag',{'on_ft':['html','markdown']})
    " call dein#add('thinca/vim-quickrun')
    call dein#add('nora75/markdowntable',{'on_ft':'markdown'})

    call dein#add('nora75/DatabaseTerminal')

    " writing {{{3
    " call dein#add('junegunn/goyo.vim')
    " call dein#add('junegunn/limelight.vim')

    " colorscheme {{{3
    call dein#add('vim-scripts/twilight')
    " call dein#add('cocopon/iceberg.vim')
    " too many colorschemes
    call dein#add('flazz/vim-colorschemes')
    " たのしー!すっごーい!
    " call dein#add('machakann/vim-colorscheme-kemonofriends')

    " game {{{3
    call dein#add('rbtnn/game_engine.vim')
    call dein#add('rbtnn/mario.vim')
    call dein#add('rbtnn/rabbit-ui.vim')
    call dein#add('rbtnn/rabbit-ui-collection.vim')
    call dein#add('rbtnn/puyo.vim')

    " test {{{3
    " call dein#add('vim-scripts/AdvancedSorters')
    " call dein#add('gyim/vim-boxdraw')
    call dein#add('osyo-manga/vim-over')
    call dein#add('LeafCage/yankround.vim')

    call dein#end()
    call dein#save_state()
endif

" if dein#check_install()
"     echom 'Recommend to update plugins'
" endif

if has('win32') || has('win64')
    let g:vimproc#download_windows_dll = 1
endif

filetype plugin indent on
syntax enable

" " vim: set fdm=marker fmr={{{,}}} fdl=1 :
