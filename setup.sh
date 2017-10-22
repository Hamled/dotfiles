#!/bin/bash

# Setup dotvim
git remote add -f Hamled-dotvim git@github.com:Hamled/dotvim.git
git subtree add --squash --prefix dotvim Hamled-dotvim master
git submodule init && git submodule update # .gitmodules should be kept current

# Setup terminfo
tic terminfo/screen-256color.ti

if [ -x "$(command -v realpath)" ]; then
  DOTFILES="$(realpath --relative-to=$HOME $(pwd))"
else
  DOTFILES="$(pwd)"
fi

# Setup Tmux Plugin Manager
pushd ~
ln -s "$DOTFILES/.tmux"
popd

# TODO: Setup other dotfiles automatically
