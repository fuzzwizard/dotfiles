#!/bin/bash

# oh-my-zsh
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | bash

# Brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Brew Cask
brew tap caskroom/cask

lists="~/.dotfiles/bootstrapper/lists"

# Get ur brews
cat $lists/brew_cask | xargs brew cask install
cat $lists/brew | xargs brew install

# NVM
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash

# Rustup
curl https://sh.rustup.rs -sSf | sh

# Just
cargo install just

# vs code config
ln settings.json ~/Library/Application\ Support/Code/User/settings.json

# build go work dir
mkdir -p ~/Go/{src/github.com/fuzzwizard,pkg,bin}

# symlink .zshrc, .vimrc, env.sh

