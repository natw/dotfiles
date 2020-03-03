# zmodload zsh/zprof

fpath=(
    "/usr/local/share/zsh-completions"
    "/usr/local/share/zsh/site-functions"
    "$HOME/.zsh/functions"
    "$fpath[@]"
)
typeset -U fpath
export fpath

for fname in $HOME/.zsh/*.zsh; do
  source $fname
done

# machine specific settings
if [[ -a ~/.zshrc-local ]]; then
    source ~/.zshrc-local
fi

if [ -z host_nick ]; then
    host_nick = '%m'
fi

local ps1part
ps1part="$host_nick"
if [ "$SHLVL" -gt 2 ]; then
  ps1part="$FG[001]${auth_name:-$SHLVL}$FG[107]"
fi

PS1="$FG[015][$FG[107]${ps1part} $FG[173]%~$FG[015]]$FG[107]%#$FX[reset] "

# fnm
eval "$(fnm env --multi)"


# zprof
