export DEFAULT_USER='mitch'
export EDITOR='vim'

MODULE_DIR='/Users/mitch/.dotfiles/modules'

source "$MODULE_DIR/fyre.sh"
source "$MODULE_DIR/go.sh"

# Prevent dupes in the command history
setopt HIST_IGNORE_ALL_DUPS

# Newline
N=$'\n'
NT=$'\n  '

# Cargo binaries
source $HOME/.cargo/env

# Include the vscode binary because it keeps trying to dump the binary in a temp directory
export PATH=/Users/mitch/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin:$PATH

# NOTE: Array (foo) length
# $foo[(I)$foo[-1]]

# Message shortcuts
make_message () {
    echo "$1  $2"
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
    local fire='🔥'
    local default='Something broke!'
    local message=${1-$default}
    local emoji=${2-$fire}
    make_message $emoji $message
}

loop_print_eval () {
    eval $1 # :( improve this implementation
}

# Env configuration helpers
zshrc_resource () {
    echo 'Re-sourcing configuration files...'
    source '/Users/mitch/.zshrc'
}; alias resrc='zshrc_resource'

zsh_restart () {
    echo 'Restarting zsh....'
    exec /bin/zsh -l
}; alias restr='zsh_restart'

# configuration aliases
alias envconfig="$EDITOR ~/.misc/env.sh && source ~/.misc/env.sh"
alias zshconfig="$EDITOR ~/.zshrc && source ~/.zshrc"
alias gitconfig="$EDITOR ~/.gitconfig"
alias antconfig="$EDITOR ~/.antibody-bundles && antibody bundle < ~/.antibody-bundles"

# easy buttons
alias c='clear'
alias work='cd ~/Fyre'
alias s='cd ~/Stuff'
alias old_cat='cat' # Ensures that we can access the color-free `cat`
alias cat='ccat' # Colorful `cat`!!
alias clean='rm -rf *'
alias fuck_you_zsh="rm ~/.zcompdump*"

vundle_update () {
    vim +PluginUpdate +qall
}; alias vupdate="vundle_update"

# Go stuff
export GOPATH=/Users/mitch/Go
export PATH=$PATH:$GOPATH/bin
alias gwd="cd $GOPATH"

gogo () {
    local git_username="$(git config --get user.name)"
    local working_dir="$GOPATH/src/github.com/${git_username}/"
    cd $working_dir
}

mkgo () {
    local boilerplate="$(old_cat /$HOME/.misc/go_bp)"
    local git_username="$(git config --get user.name)"
    local working_dir="$GOPATH/src/github.com/${git_username}/$1/"
    local gitdir="$working_dir/.git"

    start "Creating new folder: $working_dir" '🐿' &&\
    mkdir -p "$gitdir" && git --git-dir="$gitdir" init &&\
    echo "$boilerplate" > "$working_dir/$1.go" &&\
    finish
}

