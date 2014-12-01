#!/usr/bin/env bash

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# setup the PATH
PATH="/usr/local/bin:/usr/local/sbin:$PATH"
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# Alias definitions
if [ -r "$HOME/.bash_aliases" ]; then
    source "$HOME/.bash_aliases"
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -r /etc/bash_completion ]; then
    source /etc/bash_completion
fi

# I hate accidentally hanging my ssh session
stty start undef
stty stop undef

# setup unicode support
export LANG='en_US.UTF-8'
export LC_TIME='en_US.UTF-8'

if test -t 1 -a -t 2; then
    echo -n -e '\033%G'
fi

# Use vim mode
set -o vi

# Python virtualenv and virtualenvwrapper config
if [ -x /usr/local/bin/virtualenvwrapper.sh ] ; then
    export WORKON_HOME=$HOME/.virtualenvs
    export PROJECT_HOME=$HOME/projects/python
    source /usr/local/bin/virtualenvwrapper.sh
fi

# used to refresh ssh connection for tmux
# http://justinchouinard.com/blog/2010/04/10/fix-stale-ssh-environment-variables-in-gnu-screen-and-tmux/
function reload()
{
    if [[ -n $TMUX ]]; then
        NEW_SSH_AUTH_SOCK=`tmux showenv|grep ^SSH_AUTH_SOCK|cut -d = -f 2`
        if [[ -n $NEW_SSH_AUTH_SOCK ]] && [[ -S $NEW_SSH_AUTH_SOCK ]]; then
            SSH_AUTH_SOCK=$NEW_SSH_AUTH_SOCK
        fi
    fi
}

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Use shortened dir name
PROMPT_COMMAND='CurDir=`pwd|sed -e "s!$HOME!~!"|sed -Ee "s!([^/])[^/]+/!\1/!g"`'

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND="$PROMPT_COMMAND"';echo -ne "\033]0;${USER}:$CurDir\007"'
    ;;
esac

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ] && [ -x /usr/bin/dircolors ]; then
	if [ -r "$HOME/.dircolors" ]; then
	    eval "`dircolors $HOME/.dircolors`"
	else
        eval "`dircolors -b`"
	fi

    alias ls='ls --color=auto'
    alias dir='ls --color=auto --format=vertical'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Now with pretty colors
force_color_prompt=yes
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
    else
    color_prompt=
    fi
fi

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]$CurDir\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u:$CurDir\$ '
fi
unset color_prompt force_color_prompt
