" denite general settings {{{2
" start with insert mode
let g:denite_enable_start_insert = 1
" mru limit to 20
let g:denite_source_file_mru_limit = 20

" mru format set none it improves pafformance
let g:denite_source_file_mru_filename_format = ''

" bookmark save direvtory
let g:denite_source_bookmark_directory = $HOME . '/.vim/ubookmark'

" denite prefix key. {{{2
nnoremap [denite] <Nop>
nmap <Space>u [denite]
nnoremap [denite] :<C-u>Denite<Space>

" open current files directory on denite filer 
" when no file opened open current directory
nnoremap <silent> [denite]f :<C-u>DeniteWithBufferDir -buffer-name=files file<CR>
" buffers
nnoremap <silent> [denite]b :<C-u>Denite buffer<CR>
" registers
nnoremap <silent> [denite]r :<C-u>Denite -buffer-name=register register<CR>
" mru
nnoremap <silent> [denite]u :<C-u>Denite file_mru<CR>
" bookmarks
nnoremap <silent> [denite]c :<C-u>Denite bookmark<CR>
" jumplist
nnoremap <silent> [denite]j :<C-u>Denite jump<CR>
" denite output
" output au on denite output
nnoremap <silent> [denite]a :<C-u>Denite output:au<CR>
" it provide command output with denite interface
nnoremap [denite]o :<C-u>Denite output:
" output variables(:let) on denite output
nnoremap <silent> [denite]l :<C-u>Denite output:let<CR>
" output mapping(:map) on denite output
nnoremap <silent> [denite]m :<C-u>Denite output:map<CR>
" output vim setting(:set) on denite output
nnoremap <silent> [denite]s :<C-u>Denite output:set<CR>
augroup denite
    au!
    " map only on denite
    autocmd FileType denite call s:denite_my_settings()
augroup END

" {{{2 keymaps on denite
function! s:denite_my_settings()
    " exit denite with <ESC>
    nmap <buffer> <ESC> <Plug>(denite_exit)
    " exit denite with qq in insert mode
    imap <buffer> qq <Plug>(denite_exit)
    " type jj to exit insert mode
    imap <buffer> jj <Plug>(denite_insert_leave)
    " extend <C-w> command to delete /
    imap <buffer> <C-w> <Plug>(denite_delete_backward_path)
    " map on insert and normal {{{3
    " <C-o> open file on split
    nnoremap <silent> <buffer> <expr> <C-o> denite#do_action('split')
    inoremap <silent> <buffer> <expr> <C-o> denite#do_action('split')
    " <C-j> open file on split
    nnoremap <silent> <buffer> <expr> <C-l> denite#do_action('vsplit')
    inoremap <silent> <buffer> <expr> <C-l> denite#do_action('vsplit')
    " t tabopen
    nnoremap <silent> <buffer> <expr> t denite#do_action('tabopen')
    " o open
    nnoremap <silent> <buffer> <expr> o denite#do_action('open')
    " inoremap <silent> <buffer> <expr> o denite#do_action('open')
endfunction
" }}}

" settings for yankround.vim {{{2
if !dein#is_sourced('yankround.vim')
    finish
endif

nnoremap <silent> [denite]y :<C-u>Denite<Space>yankround<CR>

" vim: set fdm=marker fdl=1 fmr={{{,}}} :
