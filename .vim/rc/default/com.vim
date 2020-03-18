scriptencoding utf-8

" commands {{{1
" :AddLastDoubleSpaces {{{2
" The funciton for markdown
" Add double spaces to line's last
command! -nargs=0 AddLastDoubleSpaces call AddLastDoubleSpaces()

" :AppendBlankLine {{{2
" append blank line at all selected lines
command! -range -nargs=? AppendBlankLine call AppendBlankLine(<line1>,<line2>,<q-args>)

" :BinaryEdit {{{2
" edit current file in binary mode
" convert current file to binary by xxd and set binary in vim
" -g 1 is xxd's option of display by 1 byte (in default 2 bytes)
command! BinaryEdit exe '%!xxd -g 1'|set binary|set ft=xxd

" :CdCurrent {{{2
"  Change current directory to current file's one
command! -nargs=0 CdCurrent cd %:p:h

" :ChangeUpper {{{2
" change all argument text in current buffer to uppercase 
" use ChangeAlp(case,text)
command! -nargs=+ -range ChangeUpper call ChangeAlp('u',<q-args>,<line1>,<line2>)

" :ChangeLower {{{2
" change all argument text in current buffer to lowercase 
" use ChangeAlp(case,text)
command! -nargs=+ -range ChangeLower call ChangeAlp('l',<q-args>,<line1>,<line2>)

" :CheckCom {{{2
" Get command content by input command name
command! -nargs=1 -complete=command CheckCom echo GetComCont(<f-args>)

" :Comcap {{{2
" get comamnd output and put it to new empty buffer
" command! -nargs=1 -complete=command Comcap call Comcap(<f-args>)

" :Docom {{{2
" open tutor.txt
" command! -nargs=0 Docom exe 'tabe C:\Users\NORA\test\noraTutor\tutor\tutor.txt|vs'
"
" :DoNormal {{{2
" do normal ncommand and restore window view and last search
command! -nargs=1 DoNormal call DoNormal(<q-args>)

" :DontFullWidth {{{2
" substitute full width(em) characters to half width characters
command! -nargs=0 DontFullWidth call DontFullWidth()

" :EFFC {{{2
" Edit File From Clipboard
command! -nargs=0 -complete=file EFFC call Effc()

" :FPTC {{{2
" File Path To Clipboard
" not implemented
" command! -nargs=0 FPTC call FPTC()

" :GetFunc {{{2
" command! -nargs=1 -complete=command GetFunc call GetFunc(<f-args>)

" :GetScNum {{{2
" echo script number by name
command! -nargs=+ -complete=file_in_path GetScNum echo GetScNum(<f-args>)

" :GoErro {{{2
" go to last error of help file
command! -nargs=0 GoError exe 'help' matchstr(v:errmsg,'\ME\d\+')

" :InternMode {{{2
" Set current buffer to Intern mode
command! -nargs=0 InternMode call InternMode()

" :Kud {{{2
" open vuffer of kud
command! -nargs=0 Kud call Kud()

" :Memo {{{2
" open new buffer for memo
command! -nargs=* Memo call NewScratch('',<line1>,<line2>,<args>)

" :Memot {{{2
" open new tab for memo
command! -nargs=* Memot call NewScratch('tab',<line1>,<line2>,<args>)

" :Memov {{{2
" open new buffer for memo
command! -nargs=* Memov call NewScratch('v',<line1>,<line2>,<args>)

" :PluginCheck {{{2
" cd to plugin's dir and view thir sources
command! -nargs=* PluginCheck exe PluginCheck(<f-args>)

" :Reformatmd not comp {{{2
" reformat current buffer of markdown file by using Reformatmd(line1,line2)
command! -nargs=0 -range Reformatmd call Reformatmd(<line1>,<line2>)

" :ReloadVimrc {{{2
" Reload .vimrc files
command! -nargs=0 ReloadVimrc exe g:ReloadVimrc.ret()

" :Renamefn {{{3
" rename current file
command! -nargs=1 Renamefn exe 'file '.expand('%:h/').<f-args>.'.'.expand('%:t:e')|call delete(expand('#'))|filetype detect|w

" :Renamefe {{{3
" change current filename entension
command! -nargs=1 Renamefe exe 'file '.expand('%:r').'.'.<f-args>|call delete(expand('#'))|filetype detect|w

" :Renamefa {{{3
" change current filename entension
command! -nargs=1 Renamefa exe 'file '.expand('%:h/').<f-args>|call delete(expand('#'))|filetype detect|w

" :SortFold cant use {{{2
" sort folded texts of selected area
" command! -nargs=0 -range -bang SortFold call SortFold(<line1>,<line2>,<q-bang>)

" :Tutor {{{2
" open tutor.txt
" command! -nargs=0 Tutor exe 'tabe C:\Users\NORA\test\noraTutor\tutor\tutor1.txt|vs tutor2.txt'

" :Windom {{{2
" don't move with do command to all windows
command! -nargs=+ -complete=command Windom call WinDo(<f-args>)

" }}}
" vim: set fdm=marker fdl=1 fmr={{{,}}} : }}}
