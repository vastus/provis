.PHONY: install_ansible
install_ansible:
	pip install ansible

.PHONY: common
common: install_ansible
	ansible-playbook -i hosts common.yml

.PHONY: macos
macos:
	ansible-playbook -i hosts macos.yml

.PHONY: ubuntu
ubuntu:
	ansible-playbook -i hosts ubuntu.yml

.PHONY: amazon
amazon: install_ansible
	ansible-playbook -i hosts amazon.yml
