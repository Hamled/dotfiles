# shell-agnostic profile
if [ -f "$HOME/.profile" ]; then
    source "$HOME/.profile"
fi

# local shell-agnostic profile
if [ -f "$HOME/.profile_local" ]; then
    source "$HOME/.profile_local"
fi

# .bashrc
if [ -f "$HOME/.bashrc" ]; then
    source "$HOME/.bashrc"
fi

# .bash local configuration
if [ -f "$HOME/.bash_local" ]; then
    source "$HOME/.bash_local"
fi
