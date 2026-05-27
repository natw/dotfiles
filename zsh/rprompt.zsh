# source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
# then add $(kube_ps1)

autoload -Uz vcs_info # for pulling info from version control systems

# precmd is a builtin function that is called before every rendering of the command prompt
precmd() {
  # this should update the terminal window title
  echo -ne "\033]0;${host_nick}: ${PWD/#$HOME/~}\007"
  vcs_info
}

### Version Control Info (rprompt)

zstyle ':vcs_info:*'    enable            git
zstyle ':vcs_info:*'    get-revision      true
zstyle ':vcs_info:*'    get-unapplied     true

zstyle ':vcs_info:*'    formats           "$FG[015]($FG[107]%s$FG[015])-[$FG[221]%b %i%m$FG[015]]$FG[167]%u%c$FX[reset]"
zstyle ':vcs_info:*'    actionformats     "$FG[015]($FG[107]%s$FG[015])-[$FG[221]%b %i%m $FG[167]$FX[bold]%a$FX[reset]$FG[015]]$FG[167]%u$FX[reset]"
zstyle ':vcs_info:*'    branchformat      "%b" # don't show rev in branchformat, use %i for that to pick up head marker

zstyle ':vcs_info:git*' check-for-changes true
zstyle ':vcs_info:git*' unstagedstr       "+"
zstyle ':vcs_info:git*' stagedstr         "S"
zstyle ':vcs_info:git*' formats           "$FG[015]($FG[107]%s$FG[015])-[$FG[221]%b %8.8i%m$FG[015]]$FG[167]%u%c$FX[reset]"
zstyle ':vcs_info:git*' actionformats     "$FG[015]($FG[107]%s$FG[015])-[$FG[221]%b %8.8i%m $FG[167]$FX[bold]%a$FX[reset]$FG[015]]$FG[167]%u$FX[reset]"

export RPROMPT='${vcs_info_msg_0_}'
