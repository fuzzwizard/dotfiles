# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/mitch/.oh-my-zsh

ZSH_THEME="agnoster"

# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git npm node vim go)

source $ZSH/oh-my-zsh.sh

# SSH config
SSH_KEY_PATH="~/.ssh/rsa_id"

if test -e "$HOME/.dotfiles/env.before.sh"; then
    source "$HOME/.dotfiles/env.before.sh"
fi

source ~/.dotfiles/env.sh

if test -e "$HOME/.dotfiles/env.after.sh"; then
    source "$HOME/.dotfiles/env.after.sh"
fi

export NVM_DIR="/Users/mitch/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
source <(antibody init)

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

