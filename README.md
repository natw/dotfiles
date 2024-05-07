# Dotfiles

These are my dotfiles, the files with the dots.

## Install

There is nominally an [install file](symlink.sh),
but I really can't imagine it being useful to anyone.
I don't get a new computer often enough to make it worth optimizing.

## Bits

These are some things I use, config for which is contained herein

- [**neovim**](config/nvim/) - I care about my vim config more than I probably should. I use lazy.nvim for package management, but no frameworks or distribution or whatever. I'm trying to move everything over to Lua eventually, but really just because it's fun.
- [**zsh**](zshrc) - This one is scattered about the repo a bit more than the others just because of where zsh expects things. Again, no frameworks here, just years of amalgamated config slowly iterated on.
- [**git**](config/git/) - duh
- [**tmux**](config/tmux) - it's good. Not too much to speak to here, it is what it is.
- [**alacritty**](config/alacritty) - it's a good terminal

Some notable weird bits:

- [**DefaultKeyBinding.dict**](DefaultKeyBinding.dict) - This goes in `~/Library/KeyBindings` so that I can hit `ctrl-w` to delete-word-back in most MacOS text boxes. Huge QoL improvement.
- [**newsyslog**](newsyslog) - symlink this from `/etc/newsyslog.d/nvim.conf` to have macos rotate nvim log files that can get large if ignored
- [**editrc**](editrc) and [**inputrc**](inputrc) - uh, I kind of forget. I think one is for readline. Haven't thought about these in a while
