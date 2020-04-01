#!/bin/bash
# local variables
NVIM=nvim
MYHOST=$(hostname)
## Config and this script dir and some neccesarry directories
DEFXDG=~/.config
SCRIPT_DIR=$(cd $(dirname $0); pwd)
S_BASH_DIR=$SCRIPT_DIR/bash
S_VIM_DIR=$SCRIPT_DIR/vim
S_MISC_DIR=$SCRIPT_DIR/misc
DIR_NAMES=(BASH VIM MISC)
BACK_DIR="$SCRIPT_DIR"/Backup/`date +%Y-%m-%d_%H-%M-%S`
BASH_LOCAL_FILE=${S_BASH_DIR}/local/$MYHOST

# Make link of all contein dotfiles and Backup old files
# 1. Make all dotfiles contain vim bash misc directories
# 2. Make neovim conifg
# 3. Make .bach_local
MakeLink () {
    # For Debug and done message
    echo "Start link dotfiles to home dir"
    echo "Update all dotfiles that make link by this script"
    echo "Backup all dotfiles. If old one exists"
    PrintBar
    if [ -e $BACK_DIR ]; then
        rm -rf $BACK_DIR
    fi
    mkdir -p $BACK_DIR
    
    # link ~/.hoge to dotfiles/somedir/.hoge
    for d in ${DIR_NAMES[@]}; do
        eval p=\$S_${d}_DIR
        cd $p
        for f in .??*; do
            [ "$f" = ".git" ] && continue
            RenewLink "$p"/"$f" "$HOME"/"$f"
        done
    done
    
    # link .vimrc to init.vim(neovim config) when nvim command exists
    if [ `which nvim` ]; then
        # if $XDG_CONFIG_HOME exists link to $XDG_CONFIG_HOME
        if [ -e "${XDG_CONFIG_HOME}" ]; then
	    linkpath=$XDG_CONFIG_HOME/nvim/init.vim
        else
        # if $XDG_CONFIG_HOME doesn't exists link to Default config dir
            if [ ! -d ${DEFXDG}/nvim ]; then
                mkdir -p $DEFXDG/nvim
            fi
	    linkpath=$DEFXDG/nvim/init.vim
        fi
	# unlink and link neovim config
	RenewLink $S_VIM_DIR/.vimrc $linkpath
    fi
    
    # link hostname's bash file to .bash_local
    if [ -f "$BASH_LOCAL_FILE" ]; then
        RenewLink $BASH_LOCAL_FILE "$HOME"/.bash_local
    fi
    
    PrintBar
    echo "End link All Files"
    if [ -s $BACK_DIR ]; then
        rmdir $BACK_DIR
	exit 0
    fi
    echo "Old dotfiles move to $BACK_DIR"
}

# Renew link
# 1. Readlink from old link or file
# 2. Backup old file
# 3. Unlink old link if neccesarry
# 4. Link to new file
RenewLink () {
    echo "Backup old file and Renew $2"
    oldfile=`readlink -f $2`
    if ["$1" -ne "$oldfile" ]; then
        mv $oldfile $BACK_DIR
    fi
    if [ -L $2 ]; then
        unlink $2
    fi
    ln -snf $1 $2
}

PrintBar () {
    printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
}

# Move to homedir
cd
# Call function makelink
# Make link of all contein dotfiles
MakeLink
