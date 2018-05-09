if !neobundle#is_installed('quick-run')
    finish
endif
"" dont use now
"" quickrun
"" disable default map
"let g:quickrun_no_default_key_mappings = 1
"" convert markdown to html with pandoc and open it
"let g:quickrun_config = {}
"let g:quickrun_config.markdown = {
"            \ 'type': 'markdown/pandoc',
"            \ 'cmdopt': '-s --toc -f markdown_github -w html5 -c ..\.vim\css\origin.css -c ..\vim\css\github.css -T Preview',
"            \ 'outputter': 'browser'
"            \ }
"let g:quickrun_config.java = {
"            \ 'exec' : 'javarun -encoding=UTF8 %s',
"            \ }
"nnoremap <Space>r :<C-u>QuickRun<CR>
