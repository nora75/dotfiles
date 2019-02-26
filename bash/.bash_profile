# my config

set -o vi
export GOPATH=$HOME/go
export PATH=$GOPATH:$PATH
export EDITOR=nvim
alias sl='ls'
alias vim='nvim'
export PS1="\[\033[1;36m\]\D{%m/%d %H:%m} (*'-') \[\033[0m\]\[\033[37m\]\w\[\033[0m\] $ "
