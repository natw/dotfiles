[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND='ag -g ""'

cmd-aware-fzf-file-widget() {
  local cmd
  local root
  case "$LBUFFER" in
    "cd ")
      project_root=$(git rev-parse --show-toplevel 2> /dev/null)
      cmd="${FZF_ALT_C_COMMAND:-"command find -L '${project_root:-.}' -mindepth 1 \
        \\( -path '*/\\.*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' -o -fstype 'proc' \\) \
        -prune -o -type d -print \
        2> /dev/null |
        cut -b1- |
        perl -MFile::Spec -ne 'print File::Spec->abs2rel(\$_)'"}"
      ;;
    *)
      cmd="${FZF_DEFAULT_COMMAND}"
      ;;
  esac

  local dir="$(eval "$cmd" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse $FZF_DEFAULT_OPTS" $(__fzfcmd_complete) +m)"

  if [[ -z "$dir" ]]; then
    zle redisplay
    return 0
  fi

  LBUFFER="${LBUFFER}${dir}"
  local ret=$?
  zle redisplay
  typeset -f zle-line-init >/dev/null && zle zle-line-init
  return $ret
}
zle -N cmd-aware-fzf-file-widget
bindkey '^T' cmd-aware-fzf-file-widget
