# Setup fzf
# ---------
if [[ ! "$PATH" == */opt/homebrew/opt/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/opt/homebrew/opt/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/opt/homebrew/opt/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/opt/homebrew/opt/fzf/shell/key-bindings.zsh"

###

export FZF_DEFAULT_COMMAND='ag -g "" --ignore-dir sorbet/rbi/gems'

# I don't care for the default fzf style of completion, with a trigger sequence + <tab>
# I'd rather just use an explicit ^T
export FZF_COMPLETION_TRIGGER=''
zle -N fzf-completion
bindkey '^I' expand-or-complete
bindkey '^T' fzf-completion

# completion options for `cd` should be directories
# if we're in a git repo, list all dirs, otherwise just everything from . on down
# then make them relative to current dir, so we don't have to care where we are in the repo,
# just where we're going
# TODO: if not in a repo, just completing dirs below $PWD feels weird. luckily it rarely comes up
_fzf_complete_cd() {
  local project_root
  _fzf_complete +m -- "$@" < <(
    project_root=$(git rev-parse --show-toplevel 2> /dev/null);
    command find -L "${project_root:-.}" -mindepth 1 \
      \( -name '.*' -o -path '*/\\.*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' -o -fstype 'proc' \) \
      -prune -o -type d -print # |
      # perl -MFile::Spec -ne 'print File::Spec->abs2rel($_)'
  )
}

_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf "$@" --preview 'tree -C {} | head -200' ;;
    export|unset) fzf "$@" --preview "eval 'echo \$'{}" ;;
    ssh)          fzf "$@" --preview 'dig {}' ;;
    *)            fzf "$@" ;;
  esac
}

_fzf_complete_git() {
    ARGS="$@"
    local branches
    local tags
    if [[ $ARGS == 'git co'* ]]; then
        branches=$(git branch -vv --all)
        tags=$(git tag -l)
        _fzf_complete "--reverse --multi" "$@" < <(
            echo $branches
            echo $tags
        )
    elif [[ $ARGS == 'git stash pop'* ]]; then
        local preview_cmd='git stash show -p $(echo {} | cut -d: -f1)'
        _fzf_complete "--preview '${preview_cmd}'" "$@" < <(
          git stash list
        )
    elif [[ $ARGS == 'git add '* ]]; then
      _fzf_complete "--reverse" "$@" < <(
        project_root=$(git rev-parse --show-toplevel 2> /dev/null);
        git status --porcelain=1 |
          grep -v "^A  " |
          grep -v "^R  " |
          awk -v root="$project_root" '{print root"/"$NF}' |
          perl -MFile::Spec -ne 'print File::Spec->abs2rel($_)'
      )
    else
        eval "zle ${fzf_default_completion:-expand-or-complete}"
    fi
}

_fzf_complete_git_post() {
    awk '{print $1}'
}


# leaving old fzf implementation here for a bit, for reference

# __fzfcmd_complete() {
#  [ -n "$TMUX_PANE" ] && [ "${FZF_TMUX:-0}" != 0 ] && [ ${LINES:-40} -gt 15 ] &&
#    echo "fzf-tmux -d${FZF_TMUX_HEIGHT:-40%}" || echo "fzf"
# }


# cmd-aware-fzf-file-widget() {
#   local cmd
#   local root
#   case "$LBUFFER" in
#     "cd ")
#       project_root=$(git rev-parse --show-toplevel 2> /dev/null)
#       cmd="${FZF_ALT_C_COMMAND:-"command find -L '${project_root:-.}' -mindepth 1 \
#         \\( -path '*/\\.*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' -o -fstype 'proc' \\) \
#         -prune -o -type d -print \
#         2> /dev/null |
#         cut -b1- |
#         perl -MFile::Spec -ne 'print File::Spec->abs2rel(\$_)'"}"
#       ;;
#     "git add ")
#       project_root=$(git rev-parse --show-toplevel 2> /dev/null)
#       cmd="${FZF_ALT_C_COMMAND:-"command find -L '${project_root:-.}' -mindepth 1 \
#         \\( -path '*/\\.*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' -o -fstype 'proc' \\) \
#         -prune -o -print \
#         2> /dev/null |
#         cut -b1- |
#         perl -MFile::Spec -ne 'print File::Spec->abs2rel(\$_)'"}"
#       ;;
#     *)
#       cmd="${FZF_DEFAULT_COMMAND}"
#       ;;
#   esac

#   local dir="$(eval "$cmd" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse $FZF_DEFAULT_OPTS" $(__fzfcmd_complete) +m)"

#   if [[ -z "$dir" ]]; then
#     zle redisplay
#     return 0
#   fi

#   LBUFFER="${LBUFFER}${dir}"
#   local ret=$?
#   zle redisplay
#   typeset -f zle-line-init >/dev/null && zle zle-line-init
#   return $ret
# }
# zle -N cmd-aware-fzf-file-widget
# bindkey '^T' cmd-aware-fzf-file-widget
