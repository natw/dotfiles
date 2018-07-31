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

if [ -z host_nick ]; then
    host_nick = '%m'
fi

# machine specific settings
if [[ -a ~/.zshrc-local ]]; then
    source ~/.zshrc-local
fi

PS1="${shlvl_indicator}$FG[015][$FG[107]${host_nick} $FG[173]%~$FG[015]]$FG[107]%#$FX[reset] "
