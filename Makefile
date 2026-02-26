MACOS_ANSIBLE_PLAYBOOK ?= /opt/homebrew/bin/ansible-playbook

UV ?= $(HOME)/.local/bin/uv
UVX ?= $(HOME)/.local/bin/uvx

.PHONY: install_uv
install_uv:
	curl -fLsS https://astral.sh/uv/install.sh | sh

.PHONY: init
init: install_uv
	$(UV) tool install ansible

.PHONY: init_macos
init_macos:
	sh init_macos.sh

.PHONY: install_ansible
install_ansible:
	pip install ansible

.PHONY: common
common: install_ansible
	ansible-playbook -i hosts common.yml

.PHONY: macos
macos: init_macos
	$(MACOS_ANSIBLE_PLAYBOOK) -i hosts macos.yml

.PHONY: ubuntu
ubuntu: init
	#~/.local/bin/ansible-galaxy collection install community.general
	$(UV) run ansible-playbook -i hosts ubuntu.yml

.PHONY: amazon
amazon: install_ansible
	ansible-playbook -i hosts amazon.yml

.PHONY: phantom
phantom:
	pip3 install --user ansible
	ansible-playbook -i hosts phantom.yml

.PHONY: arch
arch:
	sh arch.sh
