" main {{{1
" normal {{{2
set ruler
set number
set showmatch
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
set clipboard=unnamed,unnamedplus
set wrapscan
set linebreak
set nobackup
set modeline
if &lines > 2
    set showtabline=2
else
    set showtabline=0
endif
set fdm=marker
set noswf
set noshowmode
set helplang=ja
" set foldmarker={{{,}}}
" movement over line wrap in this char
set whichwrap=b,s,h,l
" show can't see charactors
" set list
" set listchars=eol:$
" when change on out of Vim auto reload
set autoread
" when split or close window, set all window size equal 'ea'
set equalalways
" save command history more (default:50)
set history=100
" don't bel
set belloff=all
" open vsplit window to right side
set splitright
" auto adjust indent before line when use \ in script
let g:vim_indent_cont=0
" don't make number when convert to html
let g:html_number_lines = 0
" convert fold and expand it
let g:html_dynamic_folds = 1
" expand fold by hover mouse using css 2.0
let g:html_hover_unfold = 1

" else {{{2

" if has('persistent_undo')
"     set undodir=~/.vim/undo
"     set undofile
" endif

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
if has('nvim') && has('win32')
    let g:python_host_prog='C:\Python27\python.exe'
    let g:python3_host_prog='C:\Python37\python.exe'
endif

" vim: set fdm=marker fdl=1 fmr={{{,}}} :
