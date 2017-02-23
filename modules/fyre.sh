# Git workflow
__enforce_branch () {
    local current_branch=$(git rev-parse --abbrev-ref HEAD)
    if [[ "$current_branch" == "dev" ]]; then
        warn "You'll need to be on a working branch to use this command.$NT Use \`git pull origin dev --rebase\` instead."
        return
    fi

    start $1 && eval $2 && finish
}

fyre_update () {
    local commands=(
        "echo Checking out dev... && git checkout dev && "
        "echo Pulling it down... && git pull && "
        "echo Checking out $current_branch... && git checkout "$current_branch" && "
        "echo Merging in dev... && git merge dev;"
    )
    __enforce_branch 'Merging `dev` into current branch' $commands
}; alias fupdate="fyre_update"

fyre_rebase () {
    local commands=(
        "echo Checking out dev... && git checkout dev && "
        "echo Pulling down dev... && git pull && "
        "echo Checking out $current_branch... && git checkout $current_branch && "
        "echo Rebasing... && git rebase -i dev && "
        "echo Pushing up... && git push -f origin $current_branch;"
    )
    __enforce_branch "Rebasing $current_branch into \`dev\`..." $commands
}; alias frebase="fyre_rebase"

