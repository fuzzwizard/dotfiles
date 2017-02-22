export DEFAULT_USER='mitch'
export EDITOR='vim'

# Newline
N=$'\n'

source $HOME/.cargo/env

# NOTE: Array (foo) length
# $foo[(I)$foo[-1]]

# Message shortcuts
make_message () {
    echo "$1  $2"
}

finish () {
    local bottle='🍾'
    local default='All done!'
    local message=${1-$default}
    local emoji=${2-$bottle}
    make_message $emoji $message
}

start () {
    local robot='🤖'
    local default='Starting job...'
    local message=${1-$default}
    local emoji=${2-$robot}
    make_message $emoji $message
}

loop_print_eval () {
    local commands=${(@s/:/)1}
    
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

# easy buttons
alias c='clear'
alias work='cd ~/Fyre'
alias s='cd ~/Stuff'
alias old_cat='cat' # Ensures that we can access the color-free `cat`
alias cat='ccat' # Colorful `cat`!!
alias clean='rm -rf *'

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

# Include the vscode binary because it keeps trying to dump the binary in a temp directory
export PATH=/Users/mitch/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin:$PATH

# Git workflow
fyre_update () {
    CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
    if [[ "$CURRENT_BRANCH" == "dev" ]]; then
        echo "You'll need to be on a working branch to use this command.";
        return;
    fi

    local commands=(
        "Checking out dev... && git checkout dev;"
        "Pulling it down... && git pull;"
        "Checking out $CURRENT_BRANCH... && git checkout "$CURRENT_BRANCH";"
        "Merging in dev... && git merge dev;"
    )

    start 'Merging `dev` into current branch'
    loop_print_eval "$commands"
    finish
}; alias fupdate="fyre_update"

fyre_rebase () {
    CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
    if [[ "$CURRENT_BRANCH" == "dev" ]]; then
        echo "You'll need to be on a working branch to use this command.";
        return;
    fi
    start "Rebasing $CURRENT_BRANCH into \`dev\`..."
    echo ": Checking out dev..." && git checkout dev && \
    echo ": Pulling down dev..." && git pull && \
    echo ": Checking out $CURRENT_BRANCH..." && git checkout "$CURRENT_BRANCH" && \
    echo ": Rebasing..." && git rebase -i dev && \
    echo ": Pushing up..." && git push -f origin "$CURRENT_BRANCH" && \
    finish
}; alias frebase="fyre_rebase"

