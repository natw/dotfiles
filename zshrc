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

if [ -z host_nick ]; then
    host_nick = '%m'
fi

# machine specific settings
if [[ -a ~/.zshrc-local ]]; then
    source ~/.zshrc-local
fi

PS1="${shlvl_indicator}$FG[015][$FG[107]${host_nick} $FG[173]%~$FG[015]]$FG[107]%#$FX[reset] "

# fnm
eval "$(fnm env --multi)"

# export NVM_DIR="$HOME/.config/nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# zprof
# The following lines were added by compinstall
# zstyle :compinstall filename '/Users/natwilliams/.zshrc'

# autoload -Uz compinit
# compinit
# End of lines added by compinstall
