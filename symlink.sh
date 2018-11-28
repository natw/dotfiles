#!/usr/bin/env zsh

set -euo pipefail

files=(
    ackrc
    inputrc
    tmux.conf
    vim
    zsh
    zshrc
    irbrc
)
for fname in $files; do
  ln -sh $(pwd)/$fname $HOME/.$fname || true
done

ln -sh $(pwd)/alacritty $HOME/.config/alactritty
