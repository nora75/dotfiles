#!/bin/bash
# local variables
NVIM=nvim
DEFXDG=~/.config
SCRIPT_DIR=$(cd $(dirname $0); pwd)
# cd to home dir
cd
# link ~/hoge to dotfiles/hoge
ln -fs $SCRIPT_DIR/.vimrc ~/.vimrc
ln -fs $SCRIPT_DIR/.vim ~/.vim
ln -fs $SCRIPT_DIR/misc/.tmux.conf ~/.tmux.conf
ln -fs $SCRIPT_DIR/misc/.gitconfig ~/.gitconfig
ln -fs $SCRIPT_DIR/bash/.bashrc ~/.bashrc
ln -fs $SCRIPT_DIR/bash/.bash_aliases ~/.bash_aliases

# link .vimrc to init.vim(neovim config) when nvim command exists
if [ ! `which nvim` ]; then
    # if $XDG_CONFIG_HOME exists link to $XDG_CONFIG_HOME
    if [ -n "${XDG_CONFIG_HOME}" ]; then
        ln -fs $SCRIPT_DIR/.vimrc $XDG_CONFIG_HOME/nvim/init.vim
    else
    # if $XDG_CONFIG_HOME doesn't exists link to Default config dir
        if [ ! -d ${DEFXDG} ]; then
            mkdir -p $DEFXDG
        fi
        ln -fs $SCRIPT_DIR/.vimrc $DEFXDG/nvim/init.vim
    fi
fi
