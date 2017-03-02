brew_backup () {
    brew leaves > ~/.brew-backup
    brew cask list > ~/.brew-cask-backup
}; alias brewb="brew_backup"
