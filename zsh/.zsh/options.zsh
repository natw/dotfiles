setopt extendedglob
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt HIST_FIND_NO_DUPS
setopt extended_history # append history entries w/ timestamp
setopt inc_append_history
setopt hist_fcntl_lock # better locking for history file.  maybe doesn't work everywhere
setopt HIST_IGNORE_SPACE # don't write commands starting with space to history

setopt multibyte # maybe enabled by default
setopt no_beep # HATE. BEEPS.
setopt short_loops # they see me loopin', they hatin'

setopt autocd # evaluating a dir name cds to that dir
setopt auto_pushd # push dirs to the stack
setopt pushd_ignore_dups
setopt pushd_silent

ulimit -c 0 # no process limit?
setopt prompt_subst # allow variable substitution in the prompt
setopt c_bases # output hex and octal in better format.  what the hell?

autoload edit-command-line
zle -N edit-command-line
