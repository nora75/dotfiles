scriptencoding utf-8

" local functions {{{1
" functions for :MySql {{{2
let s:dbruncom = 'mysql'
if has('terminal') && executable(s:dbruncom)
    let s:sql = v:true
else
    let s:sql = v:false
endif

if s:sql
    let s:lines = []
    let s:called = 0
    let s:dbname = 'mysql'
    let s:dbrunoption = '-u root -p'
    let s:dbrun = s:dbruncom.' '.s:dbrunoption
    let s:folder = 'D:\Users\NORA\Documents\学校\DB\DB応用\提出\'
    let s:filename = 'k017c1066平野'
    if s:folder !~# '\M\\$' && s:folder !=# ''
        let s:folder .= '\'
    endif
    let s:folder .= s:filename

    if has('win32') || has('win64')
        let s:sy = 'net start '.s:dbname
    elseif has('unix')
        if executable('systemctl')
            let s:sy = 'systemctl start'.s:dbname
        else
            let s:sy = 'service '.s:dbname.' start'
        endif
    endif

    " s:endsql(...) abort {{{3
    func! s:endsql(...) abort
        if s:called > 2
            if bufnr("%") == s:sqlb
                q!
            endif
            echoerr 'MySQLが起動していないのです!(>ω<)わふーっ！'
            return
        endif
        let s:called += 1
        if !exists('s:sqlb')
            return
        endif
        let msg = string(term_getline(s:sqlb,2))
        if msg =~? 'error' && msg =~? 'connect'
            call s:startsql('server')
            return
        endif
        echo 'end MySQL...'
        let date = strftime('%c')
        let date = strcharpart(date,match(date,'/')+1)
        let date = strcharpart(date,0,match(date,' '))
        let date = substitute(date,'/','','g')
        let s:folder .= date
        let s:md = s:folder.'.md'
        let s:docx = '"'.s:folder.'.docx"'
        let pos = s:searchall()
        if len(pos) > 4
            if filereadable(s:md) || filereadable(s:docx)
                let lines = pos[3].',"$"'
            else
                let lines = '1,"$"'
            endif
            exe 'call extend(s:lines,getline('.lines.'))'
        endif
        let s:called = 0
        unlet s:sqlb
        return
    endfunc

    " s:startsql(...) abort {{{3
    func! s:startsql(...) abort
        echo 'start MySQL...'
        let dict = 
        \ { "vertical" : 1 , "term_name" : "MySQL" , "norestore" : "1" ,
        \ "term_finish" : "close" ,
        \ "exit_cb" : function('s:endsql') , "stoponexit": "exit" }
        if a:0
            if a:1 == 'server'
                call system(s:sy)
                aug db
                    au!
                    exe 'au VimLeavePre * echo '.s:dbname".'を終了するのです、(>ω<)わふーっ！'|call system(s:stopcom)"
                aug END
            elseif a:1 =~? 'sp'
                call remove(dict,'vertical')
            endif
        endif
        vnoremap <silent> <Space>r :<C-u>call <SID>runcom(line("'<"),line("'>"))<CR>
        nnoremap <silent> <Space>r :<C-u>call <SID>runcom(line('.'),line('.'))<CR>
        let s:sqlb = term_start(s:dbrun, dict)
        aug mysql
            au!
            au VimLeavePre * call <SID>conv()
        aug END
        call term_sendkeys(s:sqlb,"\<CR>")
        return
    endfunc

    " s:runcom(line1,line2) abort {{{3
    func! s:runcom(line1,line2) abort
        if len(term_list()) == 0
            MySql
        else
            if term_getstatus(s:sqlb) ==# 'normal'
                call term_sendkeys(s:sqlb,'i')
            endif
        endif
        for i in getline(a:line1,a:line2)
            call term_sendkeys(s:sqlb,i."\<CR>")
        endfor
        return
    endfunc

    " s:searchall() abort {{{3
    func! s:searchall() abort
        let result = []
        try
            call setpos(".", [0, line("$"), strlen(getline("$")), 0])
            while 1
                silent! let pos = searchpos('mysql', "w")
                if pos == [0, 0] || index(result, pos) != -1 || len(result) > 4
                    break
                endif
                call add(result, pos)
            endwhile
        endtry
        return result
    endfunc

    " s:conv() abort{{{3
    if executable('pandoc')
        func! s:conv() abort
            if !len(s:lines)
                echo 'no output lines'
                return
            endif
            echo 'output to '.s:docx
            call map(s:lines,'v:val."  "')
            if filereadable(s:docx)
                call system('pandoc -f docx -t markdown -o '.s:md.' '.s:docx)
                call delete(s:docx)
                call insert(s:lines,'')
            endif
            call writefile(s:lines,s:md,'a')
            call system('pandoc -t docx -o '.s:docx.' '.s:md)
            call delete(s:md)
            let s:lines = []
            return
        endfunc
    else
        func! s:conv() abort
            echo 'クリップボードに実行した結果をコピーしたのです、(>ω<)わふーっ！'
            call setreg('*',s:lines)
            if has('win32') || has('win64')
                if confirm('Wordを開くのですか?(>ω<)わふーっ！',"&Yes\n&No") == 1
                    let word = '"C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office 2013\Word 2013.lnk"'
                    call system(word)
                endif
            endif
            call delete(s:md)
            return
        endfunc
    endif
endif

" commands {{{1
" :AppendBlankLine {{{2
" append blank line at all selected lines
command! -range -nargs=? AppendBlankLine call AppendBlankLine(<line1>,<line2>,<q-args>)

" :CdCurrent {{{2
"  Change current directory to current file's one
command! -nargs=0 CdCurrent exe 'cd %:p:h'|cd

" :CheckCom {{{2
" Get command content by input command name
command! -nargs=1 -complete=command CheckCom echo GetComCont(<f-args>)

" :EFFC {{{2
" Edit File From Clipboard
command! -nargs=0 -complete=file EFFC call Effc()

" :FPTC {{{2
" File Path To Clipboard
command! -nargs=0 FPTC call FPTC()

" :ReloadVimrc {{{2
" Reload .vimrc files
command! -nargs=0 ReloadVimrc exe g:ReloadVimrc.ret()

" :Renamefn {{{3
" rename current file
command! -nargs=1 Renamefn exe 'file '.<f-args>.'.'.expand('%:t:e')|call delete(expand('#'))|filetype detect|w

" :Renamefe {{{3
" change current filename entension
command! -nargs=1 Renamefe exe 'file '.expand('%:r').'.'.<f-args>|call delete(expand('#'))|filetype detect|w

" :Renamefa {{{3
" change current filename entension
command! -nargs=1 Renamefa exe 'file '.<f-args>|call delete(expand('#'))|filetype detect|w

" :Windom {{{2
" don't move with do command to all windows
command! -nargs=+ -complete=command Windom call WinDo(<f-args>)

" :Comcap {{{2
" get comamnd output and put it to new empty buffer
command! -nargs=1 -complete=command Comcap call Comcap(<f-args>)

" :GetFunc {{{2
" command! -nargs=1 -complete=command GetFunc call GetFunc(<f-args>)

" :GoErro {{{2
" go to last error of help file
command! -nargs=0 GoError exe 'help' matchstr(v:errmsg,'\ME\d\+')

" :Memot {{{2
" open new tab for memo
command! -nargs=0 Memot call NewTabScratch()

" :Memoo {{{2
" open new buffer for memo
command! -nargs=0 Memoo call NewBufScratch()

" :ChangeUpper {{{2
" change all argument text in current buffer to uppercase 
" use ChangeAlp(case,text)
command! -nargs=+ -range ChangeUpper call ChangeAlp('u',<q-args>,<line1>,<line2>)

" :ChangeLower {{{2
" change all argument text in current buffer to lowercase 
" use ChangeAlp(case,text)
command! -nargs=+ -range ChangeLower call ChangeAlp('l',<q-args>,<line1>,<line2>)

" :SortFold {{{2
" sort folded texts of selected area
" command! -nargs=0 -range -bang SortFold call SortFold(<line1>,<line2>,<q-bang>)

" :Reformatmd {{{2
" reformat current buffer of markdown file by using Reformatmd(line1,line2)
command! -nargs=0 -range Reformatmd call Reformatmd(<line1>,<line2>)

" :DontFullWidth {{{2
" substitute full width(em) characters to half width characters
command! -nargs=0 DontFullWidth call DontFullWidth()

" :DoNormal {{{2
" do normal ncommand and restore window view and last search
command! -nargs=1 DoNormal call DoNormal(<q-args>)

" :SwColorScheme {{{2
" switch the colorschemes of twilight and iceberg
command! -nargs=0 SwColorScheme call SwitchColorScheme()

" :AddLastDoubleSpaces {{{2
" The funciton for markdown
" Add double spaces to line's last
command! -nargs=0 AddLastDoubleSpaces call AddLastDoubleSpaces()

" :BinaryEdit {{{2
" edit current file in binary mode
" convert current file to binary by xxd and set binary in vim
" -g 1 is xxd's option of display by 1 byte (in default 2 bytes)
command! BinaryEdit exe '%!xxd -g 1'|set binary|set ft=xxd

" :GetScNum {{{2
" echo script number by name
command! -nargs=+ -complete=file_in_path GetScNum echo GetScNum(<f-args>)

" :PluginCheck {{{2
" cd to plugin's dir and view thir sources
command! -nargs=* PluginCheck exe PluginCheck(<f-args>)

" :Scnote {{2
" show notes of school note dir
command! -nargs=0 Scnote exe 'e' 'D:\Users\NORA\Documents\授業ノート'

" :MySql {{{2
if s:sql
    " open mysql client in vertical window
    command! -nargs=* MySql call s:startsql(<f-args>)

    " output docx file without close vim
    command! -nargs=0 OutPutDocx call s:conv()
endif

" :Itimura {{{2
" open .itimura and .vimrc
command! -nargs=0 Itimura exe 'tabe C:\Users\NORA\Downloads\その他\ほんとにその他\itimura'|vs

" }}}
" vim: set fdm=marker fdl=1 fmr={{{,}}} : }}}
