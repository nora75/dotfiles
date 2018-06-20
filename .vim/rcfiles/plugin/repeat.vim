if !dein#is_sourced('vim-repeat')
    finish
endif
nnoremap <silent> [AppendLine]j     :<C-u>for  i in range(1, v:count1) \| call append(line('.'), '') \| endfor \| silent! call repeat#set('<Space>o', v:count1)<CR>
nnoremap <silent> [AppendLine]k     :<C-u>for  i in range(1, v:count1) \| call append(line('.')-1, '') \| endfor \| silent! call repeat#set('<Space>o', v:count1)<CR>
