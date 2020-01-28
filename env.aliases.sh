# configuration aliases
alias dot="$EDITOR_NOWAIT $DOTFILES_DIR"
alias envconfig="$EDITOR $DOTFILES_DIR && resrc"
alias zshconfig="$EDITOR ~/.zshrc && resrc"
alias antconfig="$EDITOR ~/.antibody-bundles && \
	antibody bundle < ~/.antibody-bundles"
alias gitconfig="$EDITOR_NOWAIT ~/.gitconfig"

alias code="$EDITOR_NOWAIT"

alias v="nvim"
alias c='clear'
alias work="cd $DEVDOCKER_DIR"

alias dl="cd ~/Downloads"
alias dk="cd ~/Desktop"

alias old_cat='cat' # Ensures that we can access the color-free `cat`
alias cat='ccat'

alias rmrf='rm -rf'

alias vupdate="nvim +PluginUpdate +qall"

unalias l
unalias ll
alias l='ls'
alias ll='ls -Glha'
alias dir='ls -Glha'

function __zshrc_re_source {
    echo 'Re-sourcing configuration files...'
    source "$HOME/.zshrc"
}; alias resrc='__zshrc_re_source'

function __zsh_restart {
    echo 'Restarting zsh....'
    exec /bin/zsh -l
}; alias restr='__zsh_restart'

function __unix_timestamp { date +%s; }
