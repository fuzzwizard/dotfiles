#!/bin/bash

source ./_script_utils.sh

DRY_FLAG=$TRUE

__merge_brewfiles_keeping_old () {
    # nothing :D
}

__main_procedure () {
    local dotfiles_dir="~/.dotfiles"
    local brewfile_path="$dotfiles_dir/Brewfile"
    local ts=$(unix_timestamp)
    local brewfile_path_temp="$brewfile_path.$ts"

    brew bundle dump --force --file="$brewfile_path_temp"

    if [ -e "$brewfile_path" ]; then
        __merge_brewfiles_keeping_old "$brewfile_path" "$brewfile_path_temp"
    else
        mv "$brewfile_path_temp" "$brewfile_path"
    fi

    echo "Shouldn't print"
}

which -s brew
if [[ $? == 0 ]]; then
    __main_procedure
else
    echo "Brew doesn't appear to be installed. You should do that!"
    echo ''
    echo '(In case you need help):'
    echo '/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'
fi
