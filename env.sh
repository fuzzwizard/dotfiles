export EDITOR='nvim'
DOTFILES_DIR="$HOME/.dotfiles"
MODULE_DIR="$DOTFILES_DIR/modules"

__ENV_DEBUG_FLAG="1"

__debug_message () {
    if [ -n "$__ENV_DEBUG_FLAG" ]; then
        echo "$1"
    fi
}

# Message shortcuts
__message () {
    echo "$1 $2 $1"
}

__finish () {
    local bottle='🍾 '
    local default='All done!'
    local message=${1-$default}
    local emoji=${2-$bottle}
    __message $emoji $message
}

__start () {
    local robot='🤖 '
    local default='Starting job...'
    local message=${1-$default}
    local emoji=${2-$robot}
    __message $emoji $message
}

__warn () {
    local fire='🔥 '
    local default='Something broke!'
    local message=${1-$default}
    local emoji=${2-$fire}
    __message $emoji $message
}

# Env configuration helpers
__zshrc_resource () {
    echo 'Re-sourcing configuration files...'
    source "$HOME/.zshrc"
}; alias resrc='__zshrc_resource'

__zsh_restart () {
    echo 'Restarting zsh....'
    exec /bin/zsh -l
}; alias restr='__zsh_restart'


EMOJI_SPACER="  "
ALERT_EMOJI="⚠️$EMOJI_SPACER"
ENV_EMOJI="🌳$EMOJI_SPACER"
MODULE_EMOJI="🍇$EMOJI_SPACER"

__source_envfile () {
    local envfile_path="$DOTFILES_DIR/env.$1.sh"
    if test -e $envfile_path; then
        __debug_message "$ENV_EMOJI Sourcing envfile: $envfile_path";
        source $envfile_path;
    else
        __debug_message "$ALERT_EMOJI Not sourced, not found: $envfile_path"
    fi
}

__source_envfile "before"
__source_envfile "before.local"

__source_envfile "local"

__source_envfile "config"
__source_envfile "aliases"

__source_module () {
    local module_path="$MODULE_DIR/$1.sh"
    if test -e $module_path; then
        __debug_message "$MODULE_EMOJI Sourcing module: $module_path"
        source $module_path;
    else
        __debug_message "$ALERT_EMOJI Module not found: $module_path"
    fi
}

# import modules
__source_module "go"
__source_module "brew"
__source_module "mkto"

__repremand () {
    __warn "Too bad, pal! Use \`v\` or \`nvim\` instead!"
}; alias vim="__repremand"

__source_envfile "after"
__source_envfile "after.local"
