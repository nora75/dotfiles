nmap d <Plug>(operator-blank2void)
xmap d <Plug>(operator-blank2void)
nmap <silent>dd :exec "normal Vd"<cr>

call operator#user#define('blank2void', 'Operator_blank2void')
function! Operator_blank2void(motion_wise) abort
  let v = operator#user#visual_command_from_wise_name(a:motion_wise)
  if join(getline("'[", "']"), '') =~ '\%^\_s*\%$'
    execute printf('normal! `[%s`]"_d', v)
  else
    execute printf('normal! `[%s`]d', v)
  endif
endfunction
