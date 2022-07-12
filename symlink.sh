#!/usr/bin/env zsh

set -euo pipefail

SCRIPT_DIR=${0:a:h}

homeFiles=(
  editrc
  inputrc
  irbrc
  psqlrc
  screenrc
  terraformrc
  tmux.conf
  zsh
  zshenv
  zshrc
)
for fname in $homeFiles; do
  symlinkName="${HOME}/.${fname}"
  target="${SCRIPT_DIR}/${fname}"
  if [ -f "${symlinkName}" ] && ! [ -h "${symlinkName}" ]; then
    echo "${symlinkName} is a real file and already exists, skipping"
  elif [ -L "${symlinkName}" ]; then
    echo "'${symlinkName}' is an existing symlink. removing"
    rm ${symlinkName}
    ln -sh "${target}" "${symlinkName}"
  else
    ln -sh "${target}" "${symlinkName}"
  fi
done

configDirs=($(find config -type d -d 1))
for config in $configDirs; do
  local tail=${config:t}
  local target=${config:a}
  local symlinkName="${HOME}/.config/${tail}"
  if [ -L ${symlinkName} ]; then
    rm "${symlinkName}"
  fi
  ln -sh "${target}" "${symlinkName}"
done
