# ~/.profile: executed by the command interpreter for login shells.

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin"

# set the default editor
export EDITOR=vim
export VISUAL=vim

# Perforce stuff
export P4PORT=1666

# SSH Agent
# Turned off for now, agent forwarding is used
#source $HOME/.ssh_profile

# Lua interpreter initalization
export LUA_INIT=@$HOME/.lua_profile
