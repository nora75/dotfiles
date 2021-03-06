scriptencoding utf-8

" variables {{{1
" script local variables {{{2
let s:tmpn = tempname()
let s:stateFlags = reverse([ 's', 'e', 'f', 'r', 'm', 'j', 'c', 'h' ])

" s:Kud {{{2
" local variabel ascii art of kudryavka
let s:Kudo = [
\ ':::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::///+osssoooo+/::::::::::::::::-------------:/oyyyyyo/::::::::::::::::::::::::::::::',
\ ':::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::://+oossosoo/:-..--.```````.....---:::::::::--:::/osyyys+/:::::::::::::::::::::::::::::',
\ '/////::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::://++ossoooooo++-````-:.`````````````````....--:::::::/oyyyys//::::::::::::::::::::::::::::',
\ '++//++//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::////+ooso+osoo+//++//:.```-+:.````````````````````````..--::/syyyys//:::::::::::::::::::::::::::',
\ '//++//oso+//::::::::::::::::::::::::::::::::::::::::::::::::::::::::://///++ossoso++o+:-.-//////-```-//:.`````...````````.-.`````````..:+syyys//::::::::::::::::::::::::::',
\ '///++ossossoo+//::::::::::::::::::::::::::::::::::::::::::::::::::///+ossssooooso++++....///-.://.`..///-`````.-.````````.--````````..``-/oosss+/:::::::::::::::::::::::::',
\ '//::/ssooooooooo++//:::::::::::::::::::::::::::::::::::::://////+oosssyysoooo++o+////...:/:-``.:/:`..////.`````.-`````````.:-```````-.```.:+oooo+:::::::::::::::::::::::::',
\ '//:/ooooooooooooooooo++////::::::::::::::::::::::::://///++ooossssooossso+//--/+///::..-//.````.:/-../://:.`````-.`````````-:.``````.-````.-/oooo+//::::::::::::::::::::::',
\ '//:/::/+++++++++oo++ooooooo++++//////////////////+++ooossssysssooooooso+-..``-///:.--..//-``````.::..:-::/:`````.-.````````.::.`````.-``````-/+oooo+//::::::::::::::::::::',
\ '::/:.`...-:://+++++++++++ooooooooooooooooooossssyysssssoosyyoysoo+///o+:.```.///:-`--.:/-````````.:-.:..::/-````.:.`````````-:-.````.-.``````.-+ossso+//::::::::::::::::::',
\ '://-````````...--:////++++++++++++oooooooooooossosooooooossoos/--..-/+/-.``.:///-``---/-``````````-:.:.`.:::.```.::``.-`````.::-`````-.```.-/++-:shhhhs+////::::::::::::::',
\ ':/:.`.-.``````````.....--::://///+++++++++oooooo+so++++/+s+:+o-.`../++/.``..///-```--::````````````--:.``.-:-.``.:/.`.-.`````:/:.````--`.:+ssss+:oohhhyysso+///:::::::::::',
\ ':/-``.-````````````````````.......--------:::+o+++--...-/o/:++-...:++++-.`.://-.```-::.````````````.:-.```.-:..`.-/:.`-:.````-//-````---+ssssssssssyyyhhdddhyso+///:::::::',
\ '::.`.-.``   ````````````````````````````````-++/+/.``..:oo++s+:--:++++/-...//-.````-:.``````````````-:.````.--.`.-//-`.::.```.:/:.```-:/osoossssssssyyyhhdddddhysoo+////::',
\ ':-.`.-.``   ``````````````````  ```````````.:+/++/...-:oos+oo+...:+/:-:...:/:.`````-.```````````````.-.`....-/:-.-+//..:+:```.://:.``-/+/:-.-//:-+ssss+//syyyhhhysooooooo+',
\ ':.``.-```  `````````````..````  ```````````./+++o+:---:o+++++/...//:-.:..-/:.``````.`````````````````.``````.-/:::+o+/..+/-``.-///-``.:..``.`..``.:++:...-:---/+o++++oooso',
\ ':.``-.``````````````````..````````````````.:+++++/..../++++++/..:+/:`.:..::.``````````````````````````````````--..-+++/:++/.`..///:.`.:.```-.`````...``````````.:-...--:oo',
\ ':.`.-```````````````````.-````````````````./++////...-+/+++++/.-//:.``:-.:-```````````````````````````````````.-.`./://-:++/-..:/+/-..:.```-.`````````.`````` ``--`````./+',
\ '-``.-```````````````````.-``````````..````./+/////.../+/+++///.:+:-```---:`````````````````````````````````````.-..:.-//./++/--/+++:../-```-.`````````.`````` ``--`````./o',
\ '-``.-`````..```````````.-:.`````````-.````.//////+..-++//o+/::-//:.```-::.`````````````````````````````````````.-..:...:::++/-.-+oo+-./:.``-.`````````.`````````--`````.:o',
\ '-``.-`````..```````````.::.````````.-.````.//////+-.:+/::o/:-::+/-````-::```````````````````````````````````````.-.-.``.:::+//..:+oo+:+/.`.-..````````.`````````--`````.:+',
\ '.``.-`````..```````````.:/.````````.-.````.//////+:-///.:+/--://:.````.:-````````````````````````````````````````---.```.::++/:.-+++++o+-`.:--````````.`````````--``````:+',
\ '.``.-.````.-```````````-:/-`````````-.````.////////:+/:.:/-`-///-`````.:.````````````````````````````````````````-:-``````-////:-/++++++-`.:--```````..`````````--``````-+',
\ '.``.:.````.-```````````-//:.````````-.````./////:-////-`-:.`.//:.``````-.````````````````````````````````````````.:-```````.--:/:/++oo++:.-:-.```````.-`````````--``````-+',
\ '.``.:.````.-``````````.://:.````````--````./////:./+/:.`.-``.//-```````.``````````````````````````````````````````--``````````.://oooo++:.:--.```````--`````````-.``````-+',
\ '.``.:.````.-.`````````.:///.````````.-````.////:-./+/-.``.```.-```````````````````````````````````````````````````..```````````.:++ooo++:-/-:.``````.--`````````-.``````./',
\ '.``.:-````.-.`````````.:///-````````-:.```.:+//:.`://-``````````````````````````````````````````````````````````````````````````.:ooo+/+/:+/:.``````.--`````````-.``````./',
\ '-``./:.````-.`````````.:////.```````-/.```.:+//-``-::-````````````````````````````````````````````````````````````````````````````/++:/+//+/-```````.:-````````.-.``````.:',
\ '-.`.//.````-.`````````.:////-```````-:-``..://:-```.:-```````````````.````````````````````````````````````````````````````````````./:-/+/+++.```````.:-````````.-.``````.:',
\ '/.`./+-````--``````````-////:```````-:-.`..:+/:.````-.````````````.--:::-.`````````````````````````````......``````````````````````-..:+++o/.```````-:-````````.:.``````.-',
\ '+.`.:+/.```.-``````````-///+/.``````----``.-+/-````.-::::::::::--..`..-:/:-.`````````````````````````.-::::::-..```````````````````.`.:+++o:.``````.::-.```````-:.```````-',
\ 'o:`.:o+-```.-.`````````-///++-``````--.:...-+:-.-/osyyyyyyyyyyyyyso+:-...-:.`````````````````````````-::::-.....``````````````````````-++/+-.``````.:/-````````-:.```````.',
\ 's/..-o+:.```-.`````````.://++/.`````--.:-...//:+yyyyyssoooo+oooossyyys:.`````````````````````````````...`````...``````````````````````-////.```````-//-```````.::.```````.',
\ 'so-..+++-```.-.````````.://+++-````.-:.::...:/:///:--....``````...-/+o/.`````````````````````````````````-/++ooo+++//:--..````````````.://:.``````.://-```````./:.```````.',
\ 'so:..+oo/.``.-.`````````-//+/+/.````.:.-+:..-:.``````````````````````..````````````````````````````````.:osssyyyyyyyyyyyso+:-.````````.://-```````.://-```````-/:.````````',
\ 'so+-./oo+:``.--`````````./////+:````.:..+/..-:.````````````````````````````````````````````````````````......----:::/+osyyhyyo/-.`````.://.```````.///.```````-/:.````````',
\ 'soo/.:ooo/.``.-.````````.://+++/-```.:../+:..:.````````````````````````````````````````````````````````````````````````.-:+oyyyy+-````.:/:.``````.-//:.``````.://-````````',
\ 'soo+--+++:-```--`````````-//++++/.``.:..://:.--``.`..``````````````````````````````````````````````````````````````````````.-/+so:````-//-..`````.://:.````.`.///-````````',
\ 'sooo+-/o:.:.``.-.````````.://++++:.`.--.-///--:.``.`.``.```````````````````````````````````````````````````````````````````````...```.:/:..-`````-///:.```..`-+//:````````',
\ 'soo+o//+.`--.``.-.``.`````-//+++++-`.--..////-:-``.`````.```````````````````````````````````````````````````````````````````````````.://-.--````.:///:```.-.`-+//:.```````',
\ 'ooo+o+:/.``--.`.--`.-.````.:/+++++/..-:..-+/+/-:.````````````````````````````````````.``````````````````````````````````````````````-/+:..:.````.////:.``--`./++/:.```````',
\ 'oooooo+/-``.:.``./:..-.````./++++++/..:.../////::```````````````````````````````````.-.``````````````````````````````.``.``````````.///-.::.```.-/++/-``.-.`-+++//.```````',
\ 'oo+++o+/:.``.-.``:+:..-.```.-/++++++/-//..-/:////-`````````````````````````````````````````````````````````````````````````.``````.:/+:.:+:..``./+++/-`.--`./++++/-```````',
\ 'ooo+o+::/.```.-.`./+/..-.```.:++++++o//+-..:--://:````````````````````````````````````````````````````````````````````````````````:///--++/.``.:/+++/..-/.`-++++//-```````',
\ 'oo++o+-`:-.``./:.`-++/-.-.```./+++++oo++:..--`.-::-``````````````````````````````````````````````````````````````````````````````-//+-./++/.``-/++++:../+..:+++++/-```````',
\ 'oo++o:.`.--``-/+:..:+++-.--```-/++++++/+//..:.``...`````````````````````````````````````````````````````````````````````````````-+oo/.:o++:.`.:+++++-./+/..++++++/:.``````',
\ 'o++++.````-..:+++:..:+++-.:-```-/+++++:::+/--/-`````````````````````````````````...````````````````````````````````````````````-+oo+-:+o++:..:/++++/-:oo/.-o++++++:.``````',
\ 'o+++/...``.--/++++-../+++:.--.`.-/++++-..:++:/+:.````````````````````````````````...`````...`````````````````````````````````.-+ooo::ooo++:.-/+++++/:+oo/./o++++++/-``````',
\ 'o+++-.-.``..:++++++:.-++++:.--.``-/+++:.`.++o/+o+-``````````````````````````````````````````````````````````````````````````./+ooo/:oo+oo+-./++++++/+o+o::++++++++/-``````',
\ 'o++/..-.```./+++++++:.-++++/.-:.`.-/++/-`.:+oooooo/.```````````````````````````````````````````````````````````````````````-+oooo+/oooooo+-:+++o+ooooo+o-/o+++++++/:``````',
\ 'o++-..-.```-/++++++++:.:o+o+/--:-.`-:+/:.`./oooosoo+:.``````````````````````````````````````````````````````````````````.-/oooooo+ooooooo+:++ooooossooo+:+o++++++++:.`````',
\ 'oo/.`--```.:+++++++o++/-/oooo+:-//.`.://.`.-++oossooo+/-.`````````````````````````````````````````````````````````````.-/+ooooosoooo+ooooo++ooooossoooo++o+++++++++/.````.',
\ 'o+-`.:.```-/++++++++++o+:+oooos/-++-..-:-.`.-++ooosooooo+:-.```````````````````````````````````````````````````````..:+ooooooossooooo+oossoooooosssoooo+oo+++++++++/-```.-',
\ 'o/.`.-.``.:++++++++++++o+/+oosso+:++:....```./o+oooooooooooo/-.`````````````````````````````````````````````````.-:+ooooooooossoooooo+oossoooooo+:+ooosso++++++++++/:.```.',
\ '+-`.--```-/++++++++++++oooosysooo+/+o+:.`````./o+o+oooooosssooo+:-..````````````````````````````````````````..:/+sysoooooooooooooooooooosoooooo+..:ooosooo++++++++++/.```.',
\ '/.`.:.``.:+++++++++++++ooosyysooooo++oo+-.````-+o+ooooossyssss+///++/:..```````````````````````````````..-::/oosossysoooooooooo++ooooooosoooooo/.`-+ossoo+++++++++++/-```.',
\ '.``.-```-/++++++++++++++ooosssoo+o+oooooo/.```.-+oooooosysso+////++/+o+//:-..````````````````````...-://++/////+osssssoooooooooo++++ooossooosso/.`.:osooo+++++++++++/:.```',
\ '```--``.:++++++++++++++ooosoooo//+++oossoo+:..`./oooooosso+///++++/+os+/+/+///:--..`````...---://///+o+//++//:///ossyssooooooo+++/++ooossooosoo/.``.+sooo++++++++++++/.```',
\ '``.-.``./++++++++++++++ooso+++:-/+++ooossooo+/-../ooooso//////ooo///+oo++//////++++//////++++////+/+oo++/++++/////+osysooooooo++/-:++oosooosso+/.``-/oo+o++++++++++++/-```',
\ '``.:.``-+++++++++++++++ooo++/-`-/+o++oooo+ooooo/-.+ooso//////+so+/////+o++++/++/++//+/////++/////+++sso+/+oo+//:////+ossoooooo++/-./+oosoosso++/.`.--:o++o++++++++++++:.``'
\ ]


" global variables {{{2
" use this variable for DontFullWidth() {{{3
let g:DontFull = []
call add(g:DontFull,['（','('])
call add(g:DontFull,['）',')'])
call add(g:DontFull,['：',':'])
call add(g:DontFull,['　',' '])
call add(g:DontFull,['−','-'])
call add(g:DontFull,['，',','])
call add(g:DontFull,['／','/'])
" call add(g:DontFull,[÷,\/])
let g:DontFullDel = []
call add(g:DontFullDel,'「')
call add(g:DontFullDel,'」')
call add(g:DontFullDel,'＜')
call add(g:DontFullDel,'＞')

" test {{{1
" return diff list of current git wiki dir's pages on wiki home
func! Diff_list()
    v/^-/d_
    %s/^-\s\[\(.*\.md\)].*$/\1/g
    %!sort
    return
endfunc

" Use {{{1
" AddLastDoubleSpaces() {{{2
" The funciton for markdown
" Add double spaces to line's last
func! AddLastDoubleSpaces()
    if &ft != 'markdown' || &ft != 'md' || &ft != 'mdown'
        return
    endif
    let save = s:saveState()
    let line = getline(line('.'))
    if line !~ '\M^#\+\s\*' && line !~ '\M^\(\(\[+*-]\{1}\)\|\(\d\+.\)\s\)\+' && line !~ '\M^|\.\*|$' && line !~ '\M^>' && line !~ '\M^`\{3}' && line !~ '\M</\?details>'
        substitute/\M\s\*$/  /
    endif
    call s:restoreState()
    return
endfunc

" AppendBlankLine() {{{2
" append blank line at all selected lines
func! AppendBlankLine(l1,l2,apl)
    for i in range(a:l1,a:l2)
        if a:apl ==# ''
            let apline = 1
        else
            let apline = str2nr(a:apl)
        endif
        exe 'norm' ';append'.repeat("\<CR>",apline)."\<ESC>"
        exe 'norm' apline+1.'j'
    endfor
    return
endfunc

" Apchar() {{{2
" Append Included between the specified characters end of line
function! Apchar(st,en,...) abort
    let startpoint = match(getline(line('.')),a:st)
    let length = match(getline(line('.')),a:en) - startpoint
    let line = getline(line('.'))
    let string = strcharpart(getline(line('.')),startpoint,lenght)
    if a:0
        let line .= string
    else
        let line = string . line
    endif
    call setline(line('.'),line)
endfunc
" ChangeAlp(case,text) {{{2
" function for :ChangeUpper and ChangeLower
" change all argument text in current buffer to uppercase 
func! ChangeAlp(case,text,...) abort
    let backsearch = @/
    if a:1 != a:2
        let line1 = a:1
        let line2 = a:2
    else
        let line1 = 1
        let line2 = line('$')
    endif
    let text = split(a:text,'\s')
    if len(text) > 1
        let text = map(text,'"\\(".v:val."\\)"')
        let text = join(text,'\|')
    else
        let text = join(text)
    endif
    if a:case ==# 'u'
        let to = 'upper'
    else
        let to = 'lower'
    endif
    exe line1.','.line2.'s/'.text.'/\=to'.to.'(submatch(0))/g'
    let @/ = backsearch 
    return
endfunc

"  ComcapOut(com) {{{2
" function for debugging
" do command and catch output in commandline
func! ComcapOut(com) abort
    let result = GetComOut(a:com)
    if result == -1
        echo 'No such a command'
        return
    endif
    new
    let fname = 'output:'.a:com
    silent file`=fname`
    silent put =result
    silent 1d_
    setl nonu bt=nofile noswf nobl bh=wipe ft=vim
    return
endfunc

" DoBuffer(ncom) {{{2
" do normal comamnd and restore window view and last search if buffer isn't
" null
func! DoBuffer(ncom)
    let save = s:saveState()
    let lines = getline(0,line('$'))
    if lines != ['']
        call DoNormal(a:ncom)
    endif
    call s:restoreState(save,'se')
    return
endfunc

" DoNormal(ncom) {{{2
" do normal command and restore window view and last search
func! DoNormal(ncom)
    let save = s:saveState()
    try
        exe 'norm '.a:ncom
    catch
        echoe v:errmsg
        return 1
    endtry
    call s:restoreState(save,'se')
    return
endfunction

" DontFullWidth() {{{2
" function for :DontFullWidth
" substitute full width(em) characters to half width characters
fun! DontFullWidth()
    let change = []
    let del = []
    let save = s:saveState()
    for c in g:DontFull
        call add(change,c[0])
        exe 'silent! %substitute/'.c[0].'/'.c[1].'/g'
    endfor
    for c in g:DontFullDel
        call add(del,c)
        exe 'silent! %substitute/'.c.'//g'
    endfor
    silent! w
    call s:restoreState(save,'se')
    echo 'change' join(map(change,'"''".v:val."''"'),',') 'to half width'
    echo 'delete' join(map(del,'"''".v:val."''"'),',')
    return
endfunc

" Effc() {{{2
" Function for :EFFC
" If clipboard is file name return it. not file name return empty
func! Effc()
    let fi = getreg('*')
    if type(fi) != 1 || getftype(fi) !=# 'file'
        echohl WarningMsg
        echo 'Clipboard is not file'
        echohl NONE
        return
    endif
    echo 'Enter or Space to edit file of clipboard'
    try
        let c = getchar()
        if c =~ '^\d\+$'
            let c = nr2char(c)
        elseif c =~ "\<Enter>"
            throw 'Interrupt'
        elseif c =~ "\<Space>"
            throw 'Interrupt'
        endif
    catch
        exe 'e '.fi
    endtry
    return
endfunc

"  GetFunc(com) {{{2
" function for debugging
" do command and catch output in commandline
func! GetFunc(com) abort
    let result = GetComFunc(a:com)
    new
    let fname = 'output:'.a:com
    silent file `=fname`
    silent put =result
    silent 1d_
    setl nonu bt=nofile noswf nobl bh=wipe ft=vim
    return
endfunc

" GetScNum({scriptname}) {{{2
" return script number by name
func! GetScNum(scname) abort
    let result = execute('script','silent!')
    let result = split(result,"\n")
    let result = map(result,function('s:mapfunc'))
    call filter(result,'v:val[v:key] =~? ''\M'.a:scname.'''')
    if len(result) < 1
        let result = 'No such script'
    elseif len(result) == 1
        let result = 
    elseif len(result) > 1
        let ech = []
        for i in result
            call extend(ech,values(i),len(ech))
        endfor
        let ech = map(ech,'v:key.''.''.v:val')
        let ech = inputlist(ech)
        let result = keys(result[ech])
    endif
    redraw
    return result[0]
endfunc

" GetComCont(com) {{{2
" function for :GetCom
" get command content and return
" need perfect matching command name input
" if setted command is not declared, return error message
" it is fast but not correct
func! GetComCont(com) abort
    if exists(':'.a:com)
        return 'No such a command'
    endif
    if a:com =~ '^\u'
        let result = execute('com '.a:com,'silent!')
    else
        let result = execute(a:com,'silent!')
    endif
    return result
    " let result = matchstr(split(result,"\n")[-1],'\M\S\.\*\s\*')
    " let i = stridx(result,'\M\(\S\+\\\@<!|\.\*\)\|\(\S\+(\.\*)\)')
    " while true
    "     " stridx(result,'\M0\|1\|?\|+\|*',stridx(result,a:com)+len(a:com)-1)+1
    "     stridx(result,a:com)+len(a:com)-1)+1
    "     let i = stridx(result,a:com,stridx(result,'\s',i))
    "     if exists(':'.matchstr(result,,i))>0
    "     endif
    " endwhile
    let i = stridx(result,a:com)
    let i = stridx(result,'  ',i)
    let result = strcharpart(result,i,len(result)-i+1)
    " let result = matchstr(result,'\M\S\.\+$')
endfunc

" GetComOut(com) {{{2
" function for matchit
" get vimscript command output and return
" need perfect matching command name input
func! GetComOut(com) abort
    if exists(':'.a:com)
        return -1
    endif
    let result = execute(a:com,'silent!')
    return result
endfunc

" InternMode() {{{2
" funtion for set intern mode to current buffer
func! InternMode() abort
    aug Intern
        au!
        au CursorHold <buffer> if &modified | w | endif
    aug END
    if exists('$WSLENV') || exists('$WSL_DISTRO_NAME')
        let g:openbrowser_open_commands = '/mnt/c/Program\ Files\ \(x86\)/BraveSoftware/Brave-Browser/Application/brave.exe'
        let g:openbrowser_wsl_mode = 1
        " let g:openbrowser_fix_schemes = {'file:///':'file:///wsl$'}
        " let g:openbrowser_browser_commands = [
        " \ {'name':'/mnt/c/Program\ Files\(x86\)/BraveSoftware/Brave-Browser/Application/brave.exe',
        " \ 'cmd':'/mnt/c/Program\ Files\(x86\)/BraveSoftware/Brave-Browser/Application/brave.exe',
        " \ 'args': ['start','{browser}','{uri}']}
        " \ ]
    endif
    "  'name': 'wsl',
    return
endfunc

" Kud() {{{2
" function of make new tabbuffer of kudryavka
function! Kud() abort
    if &ft != 'kud'
        tabe
        silent file \#Kudryavka
        setl nonu bt=nofile noswf nobl bh=wipe ft=vim nobackup noundofile
        set ft=kud
        call append(0,s:Kudo)
        d_
    endif
    13
    norm zt
    return
endfunc

" NewScratch() {{{2
" function for memo
" make new buffer for memo
" you can select open buffer command
func! NewScratch(type,line1,line2,...) abort
    let lines = getline(line1,line2)
    exe a:type.'new'
    silent file \#MEMO
    setl nonu bt=nofile noswf nobl bh=wipe ft=vim
endfunc

" Rel() {{{2
" Reload current file and restore window view
function! Rel() abort
    let view = winsaveview()
    silent! e!
    call winrestview(view)
    return
endfunc

" Reformatmd(line1,line2) {{{2
" reformat current buffer of markdown file
func! Reformatmd(line1,line2) abort
    " if &ft !=# 'markdown'
    "     echohl WarningMsg
    "     echo 'Please use this function/command in markdown file'
    "     echohl None
    "     return
    " endif
    if !exists('b:refomd_lineend')
        let b:refomd_lineend = 0
    endif
    if a:line1 != a:line2
        let line1 = a:line1
        let line2 = a:line2
        let b = v:false
    else
        let line1 = b:refomd_lineend + 1
        let line2 = line('$')
        let b = v:true
    endif
    let rw = '  '
    let code = v:false
    let head = v:false
    let list = v:false
    let table = v:false
    let bflag = v:false
    let aflag = v:false
    let lines = getline(line1,line2)
    call filter(lines,'v:val !~ ''\M^\s\*$''')
    let i = 0
    while i < len(lines)
        echomsg i
        let line = lines[i]
        let leftwhite = matchstr(line,'\M^\s\*')
        let line = matchstr(line,'\M^\S\.\*\s\*$')
        let line = substitute(line,'\M\s\+$','','')
        if line =~ '\M^#\+\s\*'
            echomsg '\M^#\+\s\*'
            let line = substitute(line,'\M^#\+\zs\s\*',' ','')
            let head = v:true
            let bflag = v:true
            let aflag = v:true
        elseif line =~ '\M^\(\(\[+*-]\{1}\)\|\(\d\+.\)\s\)\+'
            echomsg '\M^\(\[+*-]\)\|\(\d\+.\)\s\*'
            let line = substitute(line,'\M\s\+',' ','')
            if list
                echomsg 'list'
                if leftwhite == matchstr(lines[i-1],'\M^\s\+') && lines[i-1] == ''
                    echomsg '\M^\s\+ && lines[i-1] == '
                    call remove(lines,i-1)
                endif
            endif
            let list = v:true
            let bflag = v:true
            let aflag = v:true
        elseif line =~ '\M^|\.\*|$'
            echomsg '\M^|\.\*|$'
            if !table
                echomsg '!table'
                let bflag = v:true
            endif
            let table = v:true
            let line = line
        elseif line =~ '\M^>'
            echomsg '\M^>'
            let line = line.rw
        elseif line =~ '\M^`\{3}'
            echomsg '\M^`{3}'
            if code
                echomsg 'code'
                let code = v:false
                let aflag = v:true
                let bflag = v:false
            else
                echomsg 'code else'
                let code = v:true
                let aflag = v:false
                let bflag = v:true
            endif
            let line = line
        elseif line =~ '\M</\?details>'
            echomsg '\M</\?details>'
            let bflag = v:true
            let aflag = v:true
        else
            if !code && line != ''
                echomsg '!code && line != '
                let line .= rw
            endif
            if table
                echomsg 'table'
                let bflag = v:true
                let table = v:false
            endif
            if line !~ '\M\s{2}$'
                let line .= '  '
            endif
        endif
        if head
            echomsg 'head'
            let head = v:false
        else
            echomsg 'else'
            let line = leftwhite.line
        endif
        let lines[i] = line
        echomsg 'bflag'.bflag
        echomsg 'aflag'.aflag
        if bflag
            echomsg 'bflag'
            echomsg 'bflag'.bflag
            if i != 0 && lines[i-1] != ''
                echomsg 'i!=0&&lines[i-1]!='
                echomsg 'bflag'.bflag
                echomsg 'i'.i
                call insert(lines,'',i)
                let i += 1
            endif
            let bflag = v:false
        endif
        if aflag
            echomsg 'aflag'.aflag
            call insert(lines,'',i+1)
            let i += 1
            let aflag = v:false
        endif
        let i += 1
    endwhile
    call append(line2,lines)
    exe 'silent' line1.','.line2.'delete _'
    if b
        echomsg 'b'
        let b:refomd_lineend = line('$')
    endif
    return
    " call append(line('$'),
endfunc

" PluginCheck({type}) {{{2
" Using in :PluginCheck
" return executable command of view plugins directory by case
func! PluginCheck(...) abort
    let ret = 'e ~\.vim\dein\repos\github.com\'
    if a:0 == 0
        return ret
    endif
    let type = a:1
    if type =~? 't'
        return 'tab'.ret
    elseif type =~? 'n'
        return 'new|'.ret
    elseif type =~? 's'
        return 'sp|'.ret
    elseif type =~? 'v'
        return 'vs|'.ret
    endif
    return
endfunc

" s:lastWindow()
" save last window when close buffer and restore it when call function
augroup bufclosetrack
    au!
    autocmd WinLeave * let s:lastWinName = @%
augroup END

function! s:lastWindow()
    exe "vsplit " . s:lastWinName
endfunction
command! -nargs=0 LastWindow call s:lastWindow()

" SortFold(line1,line2) {{{2
" get lines of selected area and sort by fold header
" only support marker
" func! SortFold(line1,line2,bang) abort
"     if a:line1 ==# a:line2 || &fdm !=# 'marker'
"         return
"     endif
"     let marks = matchstr(&fmr,'\M\.\+\ze,')
"     let marke = matchstr(&fmr,'\M,\zs\.\+')
"     let lines = getline(a:line1,a:line2)
"     let back_lines = deepcopy(lines)
"     call append(line('$'),marks.marke)
"     call append(line('$'),lines)
"     call append(line('$'),back_lines)
"     call filter(lines,'v:val =~# "\\M'.marks.'\\d\\*"')
"     " call filter(lines,'v:val =~# "\\M'.marks.'\\d\\*" || v:val =~# "\\M'.marke.'"')
"     let back_sortlines = deepcopy(lines)
"     let sortlist = {}
"     let i = 0
"     let k = 0
"     let foldcount = { 1 : 0 , 2 : 0 , 3 : 0 , 4 : 0 , 5 : 0 , 6 : 0 , 7 : 0 , 8 : 0 , 9 : 0 , 10 : 0 , 11 : 0 , 12 : 0 , 13 : 0 , 14 : 0 , 15 : 0 , 16 : 0 , 17 : 0 , 18 : 0 , 19 : 0 , 20 : 0 }
"     let t = ''
"     while i < len(lines)
"         let n = matchstr(lines[i],'M'.marks.'\(\d\*\)')
"         while v:true
"             if lines[i] =~# '\M'.marks.'\d\*'
"                 if n >= matchstr(lines[i],'M'.marks.'\(\d\*\)')
"                     let k += 1
"                     if k > 0
"                         continue
"                     else
"                         break
"                     endif
"                 endif
"             elseif lines[i] =~# '\M'.marks
"             endif
"             let i += 1
"         endwhile
"     endwhile
"     for d in lines
"         try
"             exe 'call extend(sortlist.'.matchstr(d,'\d').',[d])'
"         catch
"             exe 'call extend(sortlist,{'.matchstr(d,'\d').':[d]})'
"         endtry
"     endfor
" let i = 0
" let list = []
" let innerlist = []
" while i < len(back_lines)
"     if lines[i] !~ '{{{\d'
"         let i += 1
"         continue
"     else
"         let n = matchstr(lines[i],mark.'\(\d\)')
"         while true
"             if lines[i] =~# mark.'\d' || lines[i] =~# mark
"                 if n >= matchstr(lines[i],mark.'\(\d\)')
"                     let k -= 1
"                     if k > 0
"                         continue
"                     else
"                         break
"                     endif
"                 endif
"             endif
"             let i += 1
"         endwhile
"     endif
" endwhile
" if len()
"     return
" endif
" return
" endfunc

" " GetCurrentFoldPath() abort
" " get current fold line by directory style
" func! GetCurrentFoldPath() abort
"     if &fdm !=# 'marker'
"         return
"     endif
"     let gcfp = ''
"     let marks = matchstr(&fmr,'\M\.\+\ze,')
"     let marke = matchstr(&fmr,'\M,\zs\.\+')
"     let lines = getline(a:line1,a:line2)
"     let back_lines = deepcopy(lines)
"     call filter(lines,'v:val =~# "\\M'.marks.'\\d\\*" || v:val =~# "\\M'.marke.'"')
"     let back_sortlines = deepcopy(lines)
"     let sortlist = {}
"     let i = 0
"     let k = 0
"     let count = { 1 : 0 , 2 : 0 , 3 : 0 , 4 : 0 , 5 : 0 , 6 : 0 , 7 : 0 , 8 : 0 , 9 : 0 , 10 : 0 , 11 : 0 , 12 : 0 , 13 : 0 , 14 : 0 , 15 : 0 , 16 : 0 , 17 : 0 , 18 : 0 , 19 : 0 , 20 : 0 }
"     let t = ''
"     while i < len(lines)
"         let n = matchstr(lines[i],'M'.marks.'\(\d\*\)')
"         while true
"             if lines[i] =~# '\M'.marks.'\d\*'
"                 if n >= matchstr(lines[i],'M'.marks.'\(\d\*\)')
"                     let k += 1
"                     if k > 0
"                         continue
"                     else
"                         break
"                     endif
"                 endif
"             elseif lines[i] =~# '\M'.marks
"             endif
"             let i += 1
"         endwhile
"     endwhile
"     for d in lines
"         try
"             exe 'call extend(sortlist.'.matchstr(d,'\d').',[d])'
"         catch
"             exe 'call extend(sortlist,{'.matchstr(d,'\d').':[d]})'
"         endtry
"     endfor
"     echo gcfp
"     return
" endfunc

" SwitchMoves() {{{2
" move mode switch over buffer
" use error occuer when don't map yet
func! SwitchMoves()
    try
        nunmap j
        nunmap k
        nunmap gj
        nunmap gk
        vunmap j
        vunmap k
        vunmap gj
        vunmap gk
    catch
        nnoremap j gj
        nnoremap k gk
        nnoremap gj j
        nnoremap gk k
        vnoremap j gj
        vnoremap k gk
        vnoremap gj j
        vnoremap gk k
    endtry
    return
endfunc

" SwitchASave {{{2
" switch auto save
func! SwitchASave() abort
    if !exists('#Myau#ASave')
        au! Myau CursorHold
    else
        au Myau CursorHold <buffer> if !&ro|silent! w|endif
    endif
    return
endfunc

" Windo({command}...) {{{2
" function to :Windom
" separate all args with bar
func! WinDo(...) abort
    let cuwinid = win_getid()
    windo let b:saved_state = s:saveState()
    let do = ''
    for cm in a:000
        let do .= ' '.cm
    endfor
    exe 'silent! windo '.do
    redraw!
    windo exe 'if do!~#''\Mnorm\[^z]\*z\[^hjkl]''|call s:restoreState(b:saved_state,''sf'')|endif'
    try
        echom b:saved_state
        windo unlet b:saved_state
    catch
    endtry
    call win_gotoid(cuwinid)
endfunc

" g:ReloadVimrc.ret() {{{2
" save current window and restore current winodow after reloading .vimrc
let g:ReloadVimrc = {'data':['let g:ReloadVimrc.save_winid = win_getid()','source $MYVIMRC','set nohlsearch','call win_gotoid(g:ReloadVimrc.save_winid)'],'save_winid':''}
func! g:ReloadVimrc.ret() abort
    return join(self.data,'|')
endfunc

" base functions{{{1
" s:saveState() {{{2
" save current buffer's state and return it
func! s:saveState()
    exe 'let ret = ['."''".repeat(",''",9).']'
    let ret[0] = 'call winrestview('.string(winsaveview()).')'
    let ret[1] = 'let @/ = '.string(@/)
    let ret[2] = 'let v:errmsg = '.string(v:errmsg)
    let ret[3] = 'let &fdl = '.&fdl
    call delete(s:tmpn)
    exe 'wv!' s:tmpn
    let tmp = []
    let infolines = readfile(s:tmpn)
    let i = 0
    try
        while i < len(infolines)
            if infolines[i] =~? 'レジスタ'
                let i += 1
                while infolines[i] !~ '\M^#\s\{1}' && i < len(infolines)
                    call add(tmp,infolines[i])
                    let i += 1
                endwhile
                let ret[4] = 'call writefile('.string(tmp).',s:tmpn)|rv! '.s:tmpn.'|call delete(s:tmpn)'
                let tmp = []
            elseif infolines[i] =~? 'ファイルマーク'
                let i += 1
                while infolines[i] !~ '\M^#\s\{1}' && i < len(infolines)
                    call add(tmp,infolines[i])
                    let i += 1
                endwhile
                let ret[5] = 'call writefile('.string(tmp).',s:tmpn)|rv! '.s:tmpn.'|call delete(s:tmpn)'
                let tmp = []
            elseif infolines[i] =~? 'ジャンプ'
                let i += 1
                while infolines[i] !~ '\M^#\s\{1}' && i < len(infolines)
                    call add(tmp,infolines[i])
                    let i += 1
                endwhile
                let ret[6] = 'call writefile('.string(tmp).',s:tmpn)|rv! '.s:tmpn.'|call delete(s:tmpn)'
                let tmp = []
            elseif infolines[i] =~? 'コマンドライン'
                let i += 1
                while infolines[i] !~ '\M^#\s\{1}' && i < len(infolines)
                    call add(tmp,infolines[i])
                    let i += 1
                endwhile
                let ret[7] = 'call writefile('.string(tmp).',s:tmpn)|rv! '.s:tmpn.'|call delete(s:tmpn)'
                let tmp = []
            elseif infolines[i] =~? '検索'
                let i += 1
                while infolines[i] !~ '\M^#\s\{1}' && i < len(infolines)
                    call add(tmp,infolines[i])
                    let i += 1
                endwhile
                let ret[8] = 'call writefile('.string(tmp).',s:tmpn)|rv! '.s:tmpn.'|call delete(s:tmpn)'
                let tmp = []
            endif
            let i += 1
        endwhile
    catch
    endtry
    return ret
endfunction

" s:restoreState(view,[{flag}]) {{{2
" restore state from args
" must restore view
" {flag}: s:search e:erromsg f:fdl r:registers m:marks j:jumps c:commandline
" h:search history
" all and -(minus) are support specially
func! s:restoreState(rest,...)
    let flags = join(a:000)
    let do = []
    if len(flags)
        for i in a:rest
            call add(do,i)
        endfor
        let i = 0
        if flags !=# 'all'
            if flags =~ '^-'
                while i < len(s:stateFlags)
                    if flags =~ s:stateFlags[i]
                        call remove(do,len(do)-i-1)
                    endif
                    let i+= 1
                endwhile
            else
                while i < len(s:stateFlags)
                    if flags !~ s:stateFlags[i]
                        call remove(do,len(do)-i-1)
                    endif
                    let i+= 1
                endwhile
            endif
        endif
    else
        call add(do,a:rest[0])
    endif
    for c in do
        exe c
    endfor
    return
endfunc

" s:mapfunc(in,val) {{{2
" used by GetScNum()
function! s:mapfunc(key,val)
    return { a:key : matchstr(a:val,'\M^\s\*\d\+:\s\(\.\+\\\)\+\zs\.\+$') }
endfunc

" }}}

" vim: set fdm=marker fdl=1 fmr={{{,}}} : }}}
