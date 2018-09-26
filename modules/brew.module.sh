alias brew_backup="brew leaves > ~/.brew-backup;\
brew cask list > ~/.brew-cask-backup"

alias brew_update="brew update && brew upgrade && brew cask upgrade; brew cleanup; brew doctor;"

brew_dump() {
  brew bundle dump --force --file=$1;
}