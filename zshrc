fpath=(
    "$HOME/.zsh/functions"
    "/opt/homebrew/share/zsh/site-functions"
    "/opt/homebrew/share/zsh/functions"
    "/opt/homebrew/share/zsh-completions"
    "$fpath[@]"
)
typeset -U fpath
export fpath

for fname in $HOME/.zsh/*.zsh; do
  zcompile -R -- "$fname".zwc "$fname"
  source $fname
done

# machine specific settings
[[ -a ~/.zshrc.local ]] && source ~/.zshrc.local

if [ -z host_nick ]; then
    host_nick = '%m'
fi

local ps1part
ps1part="$host_nick"
if [ "$SHLVL" -gt 2 ]; then
  ps1part="$FG[001]${auth_name:-$SHLVL}$FG[107]"
fi

PS1="$FG[015][$FG[107]${ps1part} $FG[173]%~$FG[015]]$FG[107]%#$FX[reset] "

[[ $commands[fnm] ]] && eval "$(fnm env --use-on-cd --shell zsh)"

# this is super slow.
# reconsider once https://github.com/kubernetes/kubernetes/pull/96087 is merged
# [[ $commands[kubectl] ]] && source <(kubectl completion zsh)

# if command -v pyenv 1>/dev/null 2>&1; then
#   export PYENV_ROOT="$HOME/.pyenv"
#   export PATH="$PYENV_ROOT/bin:$PATH"
#   eval "$(pyenv init --path)"
# fi

# to profile, uncomment `zmodload zsh/prof` at the top of .zshenv
# zprof
