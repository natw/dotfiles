cmd-aware-fzf-file-widget() {
  local cmd
  case "$LBUFFER" in
    "cd ")
      cmd="${FZF_ALT_C_COMMAND:-"command find -L . -mindepth 1 \\( -path '*/\\.*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' -o -fstype 'proc' \\) -prune -o -type d -print 2> /dev/null | cut -b3-"}"
      ;;
    *)
      cmd="${FZF_DEFAULT_COMMAND}"
      ;;
  esac

  local dir="$(eval "$cmd" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse $FZF_DEFAULT_OPTS" $(__fzfcmd) +m)"

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
