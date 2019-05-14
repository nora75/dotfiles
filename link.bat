@ehco off
rd /s /q "C:\Users\%username%\.vimrc"
rd /s /q "C:\Users\%username%\.vim"
mklink /d "C:\Users\%username%\.vim" "C:\Users\%username%\dotfiles\.vim"
mklink /d "C:\Users\%username%\.vim" "C:\Users\%username%\dotfiles\.vimrc"
mklink "C:\Users\%username%\AppData\Local\nvim\init.vim" "C:\Users\%username%\dotfiles\.vimrc"
