# .zshenv is executed for all shells - login,interactive, and scripts

# to profile, uncomment the `zprof` function call at the bottom of .zshrc
# zmodload zsh/zprof

# osx's /etc/zprofile tries to be helpful and sort out your path, but I can do that myself
# alias /usr/libexec/path_helper=true

path=(
  "$HOME/bin"
  "/usr/local/opt/llvm/bin"
  # "$(brew --prefix llvm)/bin"
  "$(brew --prefix)/bin"
  "$(brew --prefix)/sbin"
  "/usr/local/bin"
  "/usr/local/sbin"
  "/usr/bin"
  "/usr/sbin"
  "/sbin"
  "$HOME/go/bin"
  "$HOME/.yarn/bin"
  "$HOME/.config/yarn/global/node_modules/.bin"
  "$HOME/.npm-packages/bin"
  "/Applications/Postgres.app/Contents/Versions/latest/bin"
  "$HOME/Library/Python/3.9/bin"
  "$path[@]"
)

typeset -U path
export path

export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share

export AWS_DEFAULT_REGION=us-east-2
