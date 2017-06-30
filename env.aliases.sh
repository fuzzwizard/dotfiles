# configuration aliases
alias envconfig="$EDITOR $DOTFILES_DIR && resrc"
alias zshconfig="$EDITOR ~/.zshrc && resrc"
alias gitconfig="$EDITOR ~/.gitconfig"
alias antconfig="$EDITOR ~/.antibody-bundles &&\
antibody bundle < ~/.antibody-bundles"

# easy buttons
alias v="$EDITOR"
alias c='clear'
alias work="cd $WORK_DIR"

alias dl="cd ~/Downloads"
alias desk="cd ~/Desktop"

alias old_cat='cat' # Ensures that we can access the color-free `cat`
alias cat='ccat' # Colorful `cat`!!
alias fuck_you_zsh="rm ~/.zcompdump*"

alias rmrf='rm -rf'
alias clean='rmrf *'
alias desc='rm -r ~/Desktop/*'
alias dowc='rm -r ~/Downloads/*'

__vundle_update () {
    "$EDITOR +PluginUpdate +qall"
}; alias vupdate="__vundle_update"
