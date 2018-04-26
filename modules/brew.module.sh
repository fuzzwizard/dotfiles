alias brew_backup="brew leaves > ~/.brew-backup;\
brew cask list > ~/.brew-cask-backup"

alias brew_update="brew update; brew upgrade; brew doctor;"

alias brew_clean="brew cleanup; brew cask cleanup;"

brew_dump() {
  brew bundle dump --force --file=$1;
}