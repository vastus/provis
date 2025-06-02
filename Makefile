MACOS_ANSIBLE_PLAYBOOK ?= /opt/homebrew/bin/ansible-playbook

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
ubuntu:
	pip3 --version >/dev/null || ./install-deps.sh
	~/.local/bin/ansible --version >/dev/null || pip install --user ansible
	~/.local/bin/ansible-galaxy collection install community.general
	~/.local/bin/ansible-playbook -i hosts ubuntu.yml

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
