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

