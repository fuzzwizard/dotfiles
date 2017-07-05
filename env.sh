source "$HOME/.dotfiles/.misc/env.constants.sh"
# @Volitile: This import provides the necessary forward declaration for some
# script dependencies.

__source_envfile "config"


# Env configuration helpers
function __zshrc_resource {
    echo 'Re-sourcing configuration files...'
    source "$HOME/.zshrc"
}; alias resrc='__zshrc_resource'

function __zsh_restart {
    echo 'Restarting zsh....'
    exec /bin/zsh -l
}; alias restr='__zsh_restart'

__source_envfile "before";
__source_envfile "local";
__source_envfile "aliases";

# import modules
__source_module "go"
__source_module "brew"
__source_module "mkto"

__source_envfile "after"
