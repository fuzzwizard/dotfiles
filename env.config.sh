# Prevent dupes in the command history
setopt HIST_IGNORE_ALL_DUPS

# source the local bins first
export PATH=./node_modules/.bin:$PATH

# luarocks import
export PATH=$PATH:/usr/local/lib/luarocks/bin/

# Cargo binaries
source $HOME/.cargo/env

# Include the vscode binary because it keeps trying to dump the binary in a temp directory
export PATH=/Users/mitch/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin:$PATH