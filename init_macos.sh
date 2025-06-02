#!/bin/bash

set -eu

BREW=/opt/homebrew/bin/brew

install_homebrew() {
  if [[ ! -f "$BREW" ]]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  else
    echo "skipping installation of homebrew: already installed"
  fi
}

brew_install() {
  local cask="$1"
  "$BREW" install "$cask"

}

#ansible-galaxy collection install community.general

main() {
  install_homebrew
  brew_install ansible
}

main
