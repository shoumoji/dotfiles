alias vi='nvim'
set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_CACHE_HOME $HOME/.cache

# set PATH
set -U fish_user_paths $HOME/go/bin $fish_user_paths

# set GOPATH
set GOPATH $HOME/go $GOPATH
