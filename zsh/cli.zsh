# vim bindings in the shell are ridiculous
bindkey -e

bindkey "^X" edit-command-line

# somehow I survived for years without this.
# They called it living, but I'm not so sure.
bindkey "^R" history-incremental-search-backward

bindkey "^L" clear-screen

# the magic history, just like tcsh has
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
# up arrow or ^o will complete the current command based
# on a history search from most recent back
# ^o because sometimes that up arrow is just so far away
bindkey '\e[A' history-beginning-search-backward-end # up
bindkey "^O" history-beginning-search-backward-end
bindkey '\e[B' history-beginning-search-forward-end # down
bindkey "^N" history-beginning-search-forward-end # ^N

bindkey "^[[H" beginning-of-line # home
bindkey "^[[F" end-of-line # end
bindkey "^[[3~" delete-char # delete

bindkey -s "^Z" "^a^kfg\n" # bind ^Z to fg to switch back and forth easily

bindkey "^f" forward-word # or char?
bindkey "^b" backward-word

pb-kill-whole-line () {
  zle kill-whole-line
  echo -n $CUTBUFFER | pbcopy
}

copy-whole-line() {
  echo -n $BUFFER | pbcopy
}
zle -N copy-whole-line
bindkey "^u" copy-whole-line
