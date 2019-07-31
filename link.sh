#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd
ln -fs $SCRIPT_DIR/.vimrc ~/.vimrc
ln -fs $SCRIPT_DIR/.vim ~/.vIm
ln -fs $SCRIPT_DIR/misc/.tmux.conf ~/.tmux.conf
ln -fs $SCRIPT_DIR/misc/.gitconfig ~/.gitconfig
ln -fs $SCRIPT_DIR/bash/.bashrc ~/.bashrc
if [ -n "$XDG_CONFIG_HOME" ]; then
    ln -fs $SCRIPT_DIR/.vimrc $XDG_CONFIG_HOME/nvim/init.vim
else
    ln -fs $SCRIPT_DIR/.vimrc ~/.config/nvim/init.vim
fi
