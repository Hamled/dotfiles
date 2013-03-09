# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set the default editor
export EDITOR=vim
export VISUAL=vim

# Even more vim
set -o vi

# Python virtualenv and virtualenvwrapper config
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/projects/python
source /usr/local/bin/virtualenvwrapper.sh

# Perforce stuff
export P4PORT=1666

# SSH Agent
# Turned off for now, agent forwarding is used
#source $HOME/.ssh_profile

# Lua interpreter initalization
export LUA_INIT=@$HOME/.lua_profile

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
