" main {{{1
" normal {{{2
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,sjis
set fileencoding=utf-8
set fileformats=unix,dos,mac
set ruler
set number
set cmdheight=2
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
set autoindent
set smartindent
set whichwrap=b,s,h,l
if has("unnamedplus")
    set clipboard+=unnamed,unnamedplus
else
    set clipboard+=unnamed
endif
set wrapscan
set linebreak
set backup
set writebackup
set backupdir=$VIM/backup
set wildmenu
set modeline
set showtabline=2
set fdm=marker
" set foldmarker={{{,}}}
set title
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

" backup by name
" augroup backup
"     au!
"     autocmd BufWritePre * let &bex = '.' . strftime("%Y%m%d")
" augroup END

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
