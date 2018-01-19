cd $XDG_CONFIG_HOME/nvim
ln -fs 'dotfiles\.vimrc' '.vimrc'
ln -fs 'dotfiles\.vim' '.vim'
git clone 'https://github.com/shougo/neobundle' 'dotfiles\.vim\bundle\neobundle.vim'
