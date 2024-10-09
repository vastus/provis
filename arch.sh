#!/usr/bin/bash


main() {
	ansible --version 2>&1 >/dev/null || sudo pacman --noconfirm -S ansible
	ansible-playbook --ask-become-pass --inventory hosts arch.yaml
}

main
