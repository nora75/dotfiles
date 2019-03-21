#!/bin/bash
cd
ln -fs dotfiles/.vimrc .vimrc
ln -fs dotfiles/.vim .vim
if [ -n $XDG_CONFIG_HOME ]; then
    ln -fs dotfiles/.vimrc $XDG_CONFIG_HOME/nvim/init.vim
else
    ln -fs dotfiles/.vimrc ~/.config/nvim/init.vim
fi
