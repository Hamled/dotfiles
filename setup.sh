#!/bin/bash

# TODO: Setup dotfiles automatically

# Setup dotvim
git remote add -f Hamled-dotvim git@github.com:Hamled/dotvim.git
git subtree add --squash --prefix dotvim Hamled-dotvim master
git submodule init && git submodule update # .gitmodules should be kept current
