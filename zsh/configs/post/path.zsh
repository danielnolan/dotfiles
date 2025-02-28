# ensure dotfiles bin directory is loaded first
PATH="$HOME/.bin:/usr/local/sbin:$PATH"

if [ -d "$HOME/.rbenv" ]; then
  PATH="$HOME/.rbenv/shims:$PATH"
fi

if [ -d "$HOME/.asdf" ]; then
  # set asdf data dir
  export ASDF_DATA_DIR="$HOME/.asdf"
  # add data dir to path
  export PATH="$ASDF_DATA_DIR/shims:$PATH"
fi

# mkdir .git/safe in the root of repositories you trust
PATH=".git/safe/../../bin:$PATH"

export -U PATH
