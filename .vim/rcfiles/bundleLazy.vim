" " makeできていないかもしれない手動はめんdから何とかしたいところ
" NeoBundle 'Shougo/vimproc', {
"   \ 'build' : {
"     \ 'windows' : 'make -f make_mingw32.mak',
"     \ 'unix' : 'make -f make_unix.mak',
"   \ },
" \ }
" NeoBundle 'Shougo/unite.vim',
" \ { 'depends': 'Shougo/vimproc' }
" NeoBundle 'Shougo/neomru.vim'

" md or html
NeoBundleLazy 'plasticboy/vim-markdown'
NeoBundleLazy 'dhruvasagar/vim-table-mode'
NeoBundleLazy 'tyru/open-browser.vim'
NeoBundleLazy 'kannokanno/previm', {
            \ 'depends' :  'tyru/open-browser.vim',
            \ }
NeoBundleLazy 'alvan/vim-closetag'
" NeoBundleLazy 'thinca/vim-quickrun'
