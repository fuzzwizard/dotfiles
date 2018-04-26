# configuration aliases
alias dot="cd $DOTFILES_DIR"
alias envconfig="$EDITOR $DOTFILES_DIR && resrc"
alias zshconfig="$EDITOR ~/.zshrc && resrc"
alias antconfig="$EDITOR ~/.antibody-bundles && \
	antibody bundle < ~/.antibody-bundles"
alias gitconfig="$EDITOR_NOWAIT ~/.gitconfig"

# easy buttons
alias v="nvim"
alias c='clear'
alias work="cd $WORK_DIR"

alias dl="cd ~/Downloads"
alias dk="cd ~/Desktop"

alias old_cat='cat' # Ensures that we can access the color-free `cat`
alias cat='ccat' # Colorful `cat`!! installed via brew

alias rmrf='rm -rf'

alias vupdate="nvim +PluginUpdate +qall"

alias file_find="find . -name "; alias ff="file_find"

unalias l
unalias ll
alias l='ls'
alias ll='ls -Glha'
alias dir='ls -Glha'

function __zshrc_resource {
    echo 'Re-sourcing configuration files...'
    source "$HOME/.zshrc"
}; alias resrc='__zshrc_resource'

function __zsh_restart {
    echo 'Restarting zsh....'
    exec /bin/zsh -l
}; alias restr='__zsh_restart'

function __unix_timestamp { date +%s; }
