@ehco off
cd C:\Users\%username%
del ".vimrc"
rd /s /q ".vimrc"
mklink ".vimrc" "dotfiles\.vimrc"
del ".vim"
rd /s /q ".vim"
mklink /d ".vim" "dotfiles\.vim"
