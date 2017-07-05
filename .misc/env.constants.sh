export EDITOR='nvim'
export DOTFILES_DIR="$HOME/.dotfiles"
export ENVFILES_DIR=$DOTFILES_DIR
export MODULES_DIR="$DOTFILES_DIR/modules"

export Color_red=

#local constants
SPACER="  "
ALERT_EMOJI="⚠️$SPACER"
ENV_EMOJI="🌳$SPACER"
LOCAL_ENV_EMOJI="🌲$SPACER"
NO_LOCAL_EMOJI="📭$SPACER"
MODULE_EMOJI="🍇$SPACER"
t="\t"

export TRUE='1'
export FALSE='0'

export __ENV_DEBUG_FLAG=$TRUE

__source_envfile () {
    local envfile_path="$ENVFILES_DIR/env.$1.sh"
    local envfile_local_path="$ENVFILES_DIR/env.$1.local.sh"
    local file_has_been_sourced=$FALSE

    if [[ -e $envfile_path ]]; then
        if [[ "$1" = "local" ]]; then
            __debug_message "$LOCAL_ENV_EMOJI Sourcing local envfile:$t$t $envfile_path"
        else
            __debug_message "$ENV_EMOJI Sourcing envfile:$t$t $envfile_path"
        fi

        source $envfile_path;
        file_has_been_sourced=$TRUE
    fi

    if [ -e $envfile_local_path ]; then
        __debug_message "$LOCAL_ENV_EMOJI Sourcing envfile:$t$t $envfile_local_path";
        source $envfile_local_path
        file_has_been_sourced=$TRUE
    else
        __quiet_debug_message "$NO_LOCAL_EMOJI No local file found at:$t $envfile_local_path"
    fi

    if [[ file_has_been_sourced -eq $FALSE ]]; then
        __loud_debug_message "$ALERT_EMOJI Not found:$t$t$t $envfile_path"
    fi
};

__source_module () {
    local module_path="$MODULES_DIR/$1.module.sh"
    if test -e $module_path; then
        __debug_message "$MODULE_EMOJI Sourcing module:$t$t $module_path"
        source $module_path;
    else
        __loud_debug_message "$ALERT_EMOJI Module not found:$t$t $module_path"
    fi
};

__debug_message () {
    if [ $__ENV_DEBUG_FLAG -eq $TRUE ]; then
        echo "$1"
    fi
};

__quiet_debug_message () {
    __debug_message "\e[2m$1\e[0m"
}

__loud_debug_message () {
    __debug_message "\e[33m$1\e[0m"
}

# Message shortcuts
__emoji_flanked_message () {
    echo "$1 $2 $1"
};

__finish () {
    local bottle='🍾 '
    local default='All done!'
    local message=${1-$default}
    local emoji=${2-$bottle}
    __emoji_flanked_message $emoji $message
};

__start () {
    local robot='🤖 '
    local default='Starting job...'
    local message=${1-$default}
    local emoji=${2-$robot}
    __emoji_flanked_message $emoji $message
};

__warn () {
    local fire=' '
    local default='Something broke!'
    local message=${1-$default}
    local emoji=${2-$fire}
    __emoji_flanked_message $emoji $message
};

