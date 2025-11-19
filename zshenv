# .zshenv is executed for all shells - login,interactive, and scripts

# to profile, uncomment the `zprof` function call at the bottom of .zshrc
# zmodload zsh/zprof

# osx's /etc/zprofile tries to be helpful and sort out your path, but I can do that myself
alias /usr/libexec/path_helper=true

eval $(/opt/homebrew/bin/brew shellenv)

path=(
  "$HOME/bin"
  "$HOME/.cargo/bin"
  "$HOME/.nimble/bin"
  "/Applications/Postgres.app/Contents/Versions/18/bin"
  "/opt/homebrew/opt/openssl@3/bin"
  "/opt/homebrew/opt/curl/bin"
  "/opt/homebrew/opt/openjdk/bin"
  "/opt/homebrew/opt/llvm/bin"
  "/opt/homebrew/bin"
  "/opt/homebrew/sbin"
  "/usr/local/bin"
  "/usr/local/sbin"
  "/usr/bin"
  "/usr/sbin"
  "/sbin"
  "$HOME/go/bin"
  "$HOME/.yarn/bin"
  "$HOME/.config/yarn/global/node_modules/.bin"
  "$HOME/.npm-packages/bin"
  "$HOME/.local/bin"
  "/usr/local/texlive/2022/bin/universal-darwin"
  "$path[@]"
)

typeset -U path
export path

export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share

export AWS_DEFAULT_REGION=us-east-2
# [ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

[[ $commands[rbenv] ]] && eval "$(rbenv init - --no-rehash)"

export LANG=en_US.UTF-8
