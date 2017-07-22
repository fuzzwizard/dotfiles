# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/mitchsmall/.oh-my-zsh

ZSH_THEME="agnoster"

# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git npm node vim go)

# Load ZSH stuff firstmost
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source $ZSH/oh-my-zsh.sh

# SSH config
SSH_KEY_PATH="~/.ssh/rsa_id"

# TODO: Can these be moved to
export NVM_DIR="/Users/mitchsmall/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# Load our enviroment proper
source $HOME/.dotfiles/env.sh

# initialize antibody
source <(antibody init)

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# Cargo binaries
export PATH="$PATH:/Users/mitchsmall/.cargo/bin"

# Include the vscode binary because it keeps trying to dump the binary in a temp directory
export PATH="/Users/mitchsmall/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin:$PATH"

