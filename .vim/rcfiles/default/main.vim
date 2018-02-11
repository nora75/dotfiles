" main {{{1
" normal {{{2
set ruler
set number
set showmatch
if &enc !=# 'utf-8'
    set enc=utf-8
endif
set fileencodings=ucs-bom,utf-8,sjis
set fileencoding=utf-8
set fileformats=unix,dos,mac
set cmdheight=2
set more
set wildmenu
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set hlsearch
set incsearch
set backspace=2
set ignorecase
set smartcase
set whichwrap=b,s,h,l
if has('unnamedplus')
    set clipboard+=unnamed,unnamedplus
else
    set clipboard+=unnamed
endif
set wrapscan
set linebreak
set backup
set writebackup
set backupdir=$VIM/backup
set modeline
set showtabline=2
set fdm=marker
" set foldmarker={{{,}}}
" movement over line wrap in this char
set whichwrap=b,s,h,l
" when change on out of Vim auto reload
set autoread
" when split or close window, set all window size equal 'ea'
set equalalways
" save command history more (default:50)
set history=100
" auto adjust indent before line when use \ in script
let g:vim_indent_cont=0

" else {{{2

if has('persistent_undo')
    set undodir=$VIM/undo
    set undofile
endif

" Setting for using Japanese
"
if has('multi_byte_ime') || has('xim')
    " change cursor color when IME is enabled
    highlight CursorIM guibg=Purple guifg=NONE
    " set default IME status in insert/serch mode
    set iminsert=0 imsearch=0
    " if has('xim') && has('GUI_GTK')
    " set key to start input in XIM
    " setting for kinput2+canna
    "set imactivatekey=s-space
    " endif
endif

" vim: set fdm=marker fdl=1 fmr={{{,}}} :
