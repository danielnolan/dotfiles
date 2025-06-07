# load custom executable functions
for function in ~/.zsh/functions/*; do
  source $function
done

# extra files in ~/.zsh/configs/pre , ~/.zsh/configs , and ~/.zsh/configs/post
# these are loaded first, second, and third, respectively.
_load_settings() {
  _dir="$1"
  if [ -d "$_dir" ]; then
    if [ -d "$_dir/pre" ]; then
      for config in "$_dir"/pre/**/*~*.zwc(N-.); do
        . $config
      done
    fi

    for config in "$_dir"/**/*(N-.); do
      case "$config" in
        "$_dir"/(pre|post)/*|*.zwc)
          :
          ;;
        *)
          . $config
          ;;
      esac
    done

    if [ -d "$_dir/post" ]; then
      for config in "$_dir"/post/**/*~*.zwc(N-.); do
        . $config
      done
    fi
  fi
}
_load_settings "$HOME/.zsh/configs"

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

export VISUAL=nvim
# fix for window naming issue with tmuxinator
export DISABLE_AUTO_TITLE=true
# fix forking on Mac
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
# set cd path for easier file system navigation
setopt auto_cd
cdpath=($HOME $HOME/Projects)
# set higher ulimit to prvent too many open files error
ulimit -n 10240
# show completion menu on successive tab press
setopt auto_menu

# case insensitive tab completion
zstyle ':completion:*' completer _expand _complete _ignored
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# tab completion becomes a menu which highlights selections
# and allows you to move horizontally across menu rows
zstyle ':completion:*:*:*:*:*' menu select

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
