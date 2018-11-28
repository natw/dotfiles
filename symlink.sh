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
  ln -s $(pwd)/$fname $HOME/.$fname || true
done

ln -s $(pwd)/alacritty $HOME/.config/alactritty
