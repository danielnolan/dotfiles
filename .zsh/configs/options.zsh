# awesome cd movements from zshkit
setopt autocd autopushd pushdminus pushdsilent pushdtohome cdablevars
DIRSTACKSIZE=5

# Enable extended globbing
setopt extendedglob

# Allow [ or ] whereever you want
unsetopt nomatch

# set cd path for easier file system navigation
setopt auto_cd
cdpath=($HOME $HOME/Work)

# set higher ulimit to prevent too many open files error
ulimit -n 10240

# show completion menu on successive tab press
setopt auto_menu

# case insensitive tab completion
zstyle ':completion:*' completer _expand _complete _ignored
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# tab completion becomes a menu which highlights selections
# and allows you to move horizontally across menu rows
zstyle ':completion:*:*:*:*:*' menu select
