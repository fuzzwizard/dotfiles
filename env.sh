source "$HOME/.dotfiles/.misc/init.sh"

# @Volitile: This import provides the necessary forward declaration for some
# script dependencies.
__source_envfile "config"
__source_envfile "before";
__source_envfile "local";
__source_envfile "aliases";

# import modules
__source_module "go"
__source_module "brew"
__source_module "mkto"
__source_module "zig"

__source_envfile "after"
