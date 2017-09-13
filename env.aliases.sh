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
alias delete_desktop='rm -r ~/Desktop/*'
alias delete_downloads='rm -r ~/Downloads/*'
alias dot="cd $DOTFILES_DIR"

alias vupdate="$EDITOR +PluginUpdate +qall"

function __zshrc_resource {
    echo 'Re-sourcing configuration files...'
    source "$HOME/.zshrc"
}; alias resrc='__zshrc_resource'

function __zsh_restart {
    echo 'Restarting zsh....'
    exec /bin/zsh -l
}; alias restr='__zsh_restart'

function __unix_timestamp { date +%s; }
