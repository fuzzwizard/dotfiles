if test -e env.local.sh; then
    source "$HOME/.dotfiles/env.local.sh"
fi

export EDITOR='nvim'
DOTFILES_DIR="$HOME/.dotfiles"
MODULE_DIR="$DOTFILES_DIR/modules"

# Prevent dupes in the command history
setopt HIST_IGNORE_ALL_DUPS

# Newline
N=$'\n'
NT=$'\n  '

# source the local bins first
export PATH=./node_modules/.bin:$PATH

# luarocks import
export PATH=$PATH:/usr/local/lib/luarocks/bin/

# Cargo binaries
source $HOME/.cargo/env

# Include the vscode binary because it keeps trying to dump the binary in a temp directory
export PATH=/Users/mitch/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin:$PATH

# Message shortcuts
make_message () {
    echo "$1 $2 $1"
}

finish () {
    local bottle='🍾 '
    local default='All done!'
    local message=${1-$default}
    local emoji=${2-$bottle}
    make_message $emoji $message
}

start () {
    local robot='🤖 '
    local default='Starting job...'
    local message=${1-$default}
    local emoji=${2-$robot}
    make_message $emoji $message
}

warn () {
    local fire='🔥 '
    local default='Something broke!'
    local message=${1-$default}
    local emoji=${2-$fire}
    make_message $emoji $message
}

# Env configuration helpers
zshrc_resource () {
    echo 'Re-sourcing configuration files...'
    source "$HOME/.zshrc"
}; alias resrc='zshrc_resource'

zsh_restart () {
    echo 'Restarting zsh....'
    exec /bin/zsh -l
}; alias restr='zsh_restart'

# import modules
# TODO: better way to do this?
# source "$MODULE_DIR/fyre.sh"
source "$MODULE_DIR/go.sh"
source "$MODULE_DIR/brew.sh"

# configuration aliases
alias envconfig="$EDITOR $DOTFILES_DIR/env.sh && resrc"
alias zshconfig="$EDITOR ~/.zshrc && resrc"
alias gitconfig="$EDITOR ~/.gitconfig"
alias antconfig="$EDITOR ~/.antibody-bundles && antibody bundle < ~/.antibody-bundles"

# easy buttons
alias v="$EDITOR"
alias c='clear'
alias work="cd $WORK_DIR"
alias old_cat='cat' # Ensures that we can access the color-free `cat`
alias cat='ccat' # Colorful `cat`!!
alias clean='rm -rf *'
alias fuck_you_zsh="rm ~/.zcompdump*"

vundle_update () {
    "$EDITOR +PluginUpdate +qall"
}; alias vupdate="vundle_update"

repremand () {
    warn "Too bad, pal! Use \`v\` or \`nvim\` instead!"
};

alias vim="repremand"
