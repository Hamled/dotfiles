#!/bin/bash

# TODO: Setup dotfiles automatically

# Add vim plugin subtrees
git subtree add --squash --prefix vim/bundle/ack https://github.com/mileszs/ack.vim.git master
git subtree add --squash --prefix vim/bundle/colour-bandit https://github.com/vim-scripts/bandit.vim.git master
git subtree add --squash --prefix vim/bundle/command-t https://github.com/wincent/Command-T.git master
git subtree add --squash --prefix vim/bundle/fugitive https://github.com/tpope/vim-fugitive.git master
git subtree add --squash --prefix vim/bundle/flake8 https://github.com/nvie/vim-flake8 master
git subtree add --squash --prefix vim/bundle/git https://github.com/tpope/vim-git.git master
git subtree add --squash --prefix vim/bundle/gundo https://github.com/sjl/gundo.vim.git master
git subtree add --squash --prefix vim/bundle/makegreen https://github.com/reinh/vim-makegreen master
git subtree add --squash --prefix vim/bundle/nerdtree https://github.com/vim-scripts/The-NERD-tree.git master
git subtree add --squash --prefix vim/bundle/py.test https://github.com/alfredodeza/pytest.vim.git master
git subtree add --squash --prefix vim/bundle/pydoc https://github.com/fs111/pydoc.vim.git master
git subtree add --squash --prefix vim/bundle/ropevim https://github.com/sontek/rope-vim.git master
git subtree add --squash --prefix vim/bundle/snipmate https://github.com/msanders/snipmate.vim.git master
git subtree add --squash --prefix vim/bundle/supertab https://github.com/ervandew/supertab.git master
git subtree add --squash --prefix vim/bundle/surround https://github.com/tpope/vim-surround.git master
git subtree add --squash --prefix vim/bundle/taghighlight https://github.com/vim-scripts/TagHighlight.git master
git subtree add --squash --prefix vim/bundle/tasklist https://github.com/vim-scripts/TaskList.vim.git master
git subtree add --squash --prefix vim/bundle/vim-virtualenv https://github.com/jmcantrell/vim-virtualenv.git master
