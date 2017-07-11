# Prevent dupes in the command history
setopt HIST_IGNORE_ALL_DUPS

# source the local bins first
export PATH=./node_modules/.bin:$PATH

# luarocks import
export PATH=$PATH:/usr/local/lib/luarocks/bin/
