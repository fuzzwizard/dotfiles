#!/bin/sh

h=$HOME

ln -s "$h/.dotfiles/.zshrc" "$h/.zshrc"
ln -s "$h/.dotfiles/.profile" "$h/.profile"
ln -s "$h/.dotfiles/.ghci" "$h/.ghci"

ln -s \
    "$h/.dotfiles/vscode/settings.json" \
    "$h/Library/Application Support/Code/User/settings.json"
