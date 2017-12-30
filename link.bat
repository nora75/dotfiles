@ehco off
cd C:\Users\%username%\
if not exist ".vimrc" mklink ".vimrc" "dotfiles\.vimrc"
if exist ".vim" del ".vim"
rd /s /q ".vim"
mklink /d ".vim" "dotfiles\.vim"
