#!/bin/bash

# oh-my-zsh
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | bash

# Brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# NVM
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash

# Rustup
curl https://sh.rustup.rs -sSf | sh

# Just
cargo install just

# vs code config

# build go work dir
mkdir -p ~/Go/{src/github.com/fuzzwizard,pkg,bin}

# symlink .zshrc, .vimrc, env.sh

# install saved brews from BREWS file

# install saved brew casks from CASKS file
ln settings.json ~/Library/Application\ Support/Code/User/settings.json
