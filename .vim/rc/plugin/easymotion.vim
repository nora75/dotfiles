if !dein#is_sourced('vim-easymotion')
    finish
endif
" dont use now
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1

" map {{{2
nnoremap [easy] <Nop>
nmap  <Space>j [easy]

nmap [easy]j <Plug>(easymotion-s2)
nmap [easy]w <Plug>(easymotion-overwin-f2)

" syntax {{{2
hi link EasyMotionTarget Search
hi link EasyMotionShade  Comment

hi link EasyMotionTarget2First MatchParen
hi link EasyMotionTarget2Second MatchParen

hi link EasyMotionMoveHL Search
hi link EasyMotionIncSearch Search

" vim: set fdm=marker fmr={{{,}}} fdl=1 :