#!/bin/sh

source "$HOME/.dotfiles/.misc/init.sh"

__DRY_FLAG=$TRUE

__make_symlink () {
    if [[ $__DRY_FLAG = $TRUE ]]; then
        echo "$1 -> $2"
        return
    fi

    if (( $# == 2 )); then
        ln -s $1 $2
    else
        echo '__make_symlink needs exactly two (2) arguments.'
    fi
}

__make_symlink_to_home_dotfile () {
    __make_symlink "$DOTFILES_DIR/$1" "$HOME/$1"
}

__make_symlink_to_home_dotfile ".zshrc"
__make_symlink_to_home_dotfile ".profile"
__make_symlink_to_home_dotfile ".ghci"

__make_symlinks_for_spf_settings () {
    for filepath in $VIMFILE_DIR/\.*; do
        local filename="$(basename $filepath)"
        if [ $filename -ne "." ] && [ $filename -ne ".." ]; then
            echo "filename: $filename"
            __make_symlink "$filepath" "$HOME/$filename"
        fi
    done
}

__make_symlinks_for_spf_settings

__make_symlink \
    "$DOTFILES_DIR/vscode/settings.json" \
    "~/Library/Application Support/Code/User/settings.json"
