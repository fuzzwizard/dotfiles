export GOPATH=/Users/$(whoami)/Go
export PATH=$PATH:$GOPATH/bin
alias gwd="cd $GOPATH"

GREEN="\e[32;m"
N="\e[0;m"
GIT_UN="fuzzwizard"

go_make_workspace_directories () {
    mkdir -p $GOPATH/{src,pkg,bin} > /dev/null
}

gogo () {
    go_make_workspace_directories;
    local working_dir="$GOPATH/src/github.com/$GIT_UN/"
    mkdir -p $working_dir
    pushd $working_dir > /dev/null;
}

mkgo () {
    go_make_workspace_directories;
    local boilerplate=$HOME/.dotfiles/.misc/go-boilerplate.go
    local working_dir="$GOPATH/src/github.com/$GIT_UN/$1/"
    local gitdir="$working_dir/.git"

    echo "$GREEN### 🐿  Creating new folder: $working_dir $N"
    mkdir -p "$gitdir"

    pushd $working_dir > /dev/null
    git --git-dir="$gitdir" init .
    cp $boilerplate "$working_dir/$1.go"
}

