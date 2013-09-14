#!/usr/bin/env bash

# Why even bother???
alias nano='nano -w'

find_zero () { find "$1" -print0 "${@:2}"; }
alias find0='find_zero'
alias xargs0='xargs -0'

alias mainscreen='/usr/local/bin/tmux attach -d -t main'

# vim compatibility
alias :e='vim'
alias :q='exit'

# virtualenv aliases
alias mkvirtualenv='mkvirtualenv --no-site-packages'
alias workoff='deactivate && cd'

# Vagrant
alias vgup='vagrant up'
alias vgssh='vagrant ssh'
alias vgprov='vagrant provision'
alias vgreload='vagrant reload'
alias vgdown='vagrant halt'
alias vgdest='vagrant destroy'
