alias brew_backup="brew leaves > ~/.brew-backup;\
brew cask list > ~/.brew-cask-backup"

alias brew_update="brew update; brew upgrade; brew doctor;"

alias brew_clean="brew cleanup; brew cask cleanup;"

alias brew_dump="cat $DOTFILE_DIR/.scripts/brew_dump.sh | zsh"
