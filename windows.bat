@ehco off
rd /s /q "%USERPROFILE%\.vimrc"
rd /s /q "%USERPROFILE%\.vim"
rd /s /q "%USERPROFILE%\.tmux.conf"
rd /s /q "%USERPROFILE%\.bashrc"
rd /s /q "%USERPROFILE%\.bash_local"
mklink /d "%USERPROFILE%\.vim" "%USERPROFILE%\dotfiles\.vim"
mklink "%USERPROFILE%\.vimrc" "%USERPROFILE%\dotfiles\.vimrc"
mklink "%USERPROFILE%\.bashrc" "%USERPROFILE%\dotfiles\.bashrc"
mklink "%USERPROFILE%\.tmux.conf" "%USERPROFILE%\dotfiles\.tmux.conf"
mklink "%USERPROFILE%\AppData\Local\nvim\init.vim" "%USERPROFILE%\dotfiles\.vimrc"
