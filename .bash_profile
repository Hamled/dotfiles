# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# run our shell-agnostic profile if it exists
if [ -f "$HOME/.profile" ]; then
	source "$HOME/.profile"
fi

# setup the PATH
PATH="/usr/local/bin:/usr/local/sbin:$PATH"
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# Now with pretty colors
force_color_prompt=yes

# include .bashrc if it exists
if [ -f "$HOME/.bashrc" ]; then
	source "$HOME/.bashrc"
fi

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac

# Undo some aliases I don't use
unalias ll 2>/dev/null
unalias la 2>/dev/null
unalias l  2>/dev/null

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
function reload() {   
  if [[ -n $TMUX ]]; then
    NEW_SSH_AUTH_SOCK=`tmux showenv|grep ^SSH_AUTH_SOCK|cut -d = -f 2`
    if [[ -n $NEW_SSH_AUTH_SOCK ]] && [[ -S $NEW_SSH_AUTH_SOCK ]]; then 
      SSH_AUTH_SOCK=$NEW_SSH_AUTH_SOCK  
    fi
  fi
}
