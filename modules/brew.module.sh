alias brew_backup="brew leaves > ~/.brew-backup;\
brew cask list > ~/.brew-cask-backup"

alias __brew_clean="brew cleanup; brew cask cleanup;"
alias brew_update="brew update && brew upgrade; __brew_clean; brew doctor;"

brew_dump() {
  brew bundle dump --force --file=$1;
}