@ehco off
FOR /F %%i in ('hostname') do set myhost=%%i

rd /s /q "%USERPROFILE%\.vimrc"
rd /s /q "%USERPROFILE%\.vim"
rd /s /q "%USERPROFILE%\.tmux.conf"
rd /s /q "%USERPROFILE%\.bashrc"
rd /s /q "%USERPROFILE%\.bash_local"

mklink /d "%USERPROFILE%\.vim" "%USERPROFILE%\dotfiles\vim\.vim"
mklink "%USERPROFILE%\.vimrc" "%USERPROFILE%\dotfiles\vim\.vimrc"
mklink "%USERPROFILE%\.bashrc" "%USERPROFILE%\dotfiles\bash\.bashrc"
mklink "%USERPROFILE%\.tmux.conf" "%USERPROFILE%\dotfiles\misc\.tmux.conf"
mklink "%USERPROFILE%\AppData\Local\nvim\init.vim" "%USERPROFILE%\dotfiles\.vimrc"

if exist  "%USERPROFILE%\dotfiles\bash\%myhost%" mklink "%USERPROFILE%\.bash_local" "%USERPROFILE%\dotfiles\bash\%myhost%"
