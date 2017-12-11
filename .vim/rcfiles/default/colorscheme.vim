filetype off

call neobundle#begin(expand('~/.vim/colorscheme'))

NeoBundle 'vim-scripts/twilight'
" 大杉
NeoBundle 'flazz/vim-colorschemes'

NeoBundleCheck

call neobundle#end()

" require {{{2
filetype plugin indent on
filetype detect

" vim: set fdm=marker fmr={{{,}}} fdl=1 :
