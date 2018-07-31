autoload -Uz vcs_info # for pulling info from version control systems
# precmd is a builtin function that is called before every rendering of the command prompt
precmd() {
    echo -ne "\033]0;${host_nick}: ${PWD/#$HOME/~}\007"
    vcs_info
}

### Version Control Info (rprompt)


zstyle ':vcs_info:*' enable svn hg git bzr cvs darcs
zstyle ':vcs_info:*' get-revision true
zstyle ':vcs_info:*' get-unapplied true
zstyle ':vcs_info:(hg*|git*):*' check-for-changes true
# zstyle ':vcs_info:hg*:*' use-simple true # a little faster, but I like seeing if there are outstanding changes.
                                           # maybe only for bzr?
                                           #
zstyle ':vcs_info:*' formats "$FG[015]($FG[107]%s$FG[015])-[$FG[221]%b %i%m$FG[015]]$FG[167]%u%c$FX[reset]"
zstyle ':vcs_info:*' actionformats "$FG[015]($FG[107]%s$FG[015])-[$FG[221]%b %i%m $FG[167]$FX[bold]%a$FX[reset]$FG[015]]$FG[167]%u$FX[reset]"
zstyle ':vcs_info:*' branchformat "%b" # don't show rev in branchformat, use %i for that to pick up head marker

# mercurial-specific stuff
zstyle ':vcs_info:hg*:*' get-mq true
zstyle ':vcs_info:hg*:*' get-unapplied true
zstyle ':vcs_info:hg*:*' get-bookmarks true
zstyle ':vcs_info:hg*:*' unstagedstr "+" # uncommitted changes
zstyle ':vcs_info:hg*:*' hgrevformat "%r" # only show local revision
zstyle ':vcs_info:hg*:*' patch-format " $FG[103]%n$FX[reset]/$FG[103]%c %p$FX[reset]" # this should show when patches are applied, but it doesn't
zstyle ':vcs_info:hg*:*' nopatch-format " $FG[103]Q$FX[reset]" # mq present, but no applied patches
zstyle ':vcs_info:hg*+set-hgrev-format:*' hooks hg-storerev hg-hashfallback
zstyle ':vcs_info:hg*+set-message:*' hooks mq-vcs hg-branchhead

# git stuff
zstyle ':vcs_info:git*' unstagedstr "+"
zstyle ':vcs_info:git*' stagedstr "S"
zstyle ':vcs_info:git*' formats "$FG[015]($FG[107]%s$FG[015])-[$FG[221]%b %8>>%i%<<%m$FG[015]]$FG[167]%u%c$FX[reset]"
zstyle ':vcs_info:git*' actionformats "$FG[015]($FG[107]%s$FG[015])-[$FG[221]%b %8.8i%m $FG[167]$FX[bold]%a$FX[reset]$FG[015]]$FG[167]%u$FX[reset]"


export RPROMPT='${vcs_info_msg_0_}'

