#!/bin/bash

which -s brew
if [[ $? == 0 ]]
then
    brew bundle dump --force --file='~/.dotfiles/Brewfile'
else
    echo "Brew doesn't appear to be installed. You should do that!"
    echo ''
    echo '(In case you need help):'
    echo '/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'
fi
