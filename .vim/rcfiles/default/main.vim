" main {{{1
" normal {{{2
set ruler
set number
set cmdheight=2
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,sjis
set fileencoding=utf-8
set hlsearch
set incsearch
set ignorecase
set smartcase
set autoindent
set smartindent
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

" \を前の行と同じインデントにする
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

" 日本語入力に関する設定:
"
if has('multi_byte_ime') || has('xim')
  " IME ON時のカーソルの色を設定(設定例:紫)
  highlight CursorIM guibg=Purple guifg=NONE
  " 挿入モード・検索モードでのデフォルトのIME状態設定
  set iminsert=0 imsearch=0
  " if has('xim') && has('GUI_GTK')
    " XIMの入力開始キーを設定:
    " 下記の s-space はShift+Spaceの意味でkinput2+canna用設定
    "set imactivatekey=s-space
  " endif
  " 挿入モードでのIME状態を記憶させない場合、次行のコメントを解除
endif

" vim: set fdm=marker fdl=1 fmr={{{,}}} :
