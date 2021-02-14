.PHONY: install_ansible
install_ansible:
	pip install ansible

.PHONY: common
common: install_ansible
	ansible-playbook -i hosts common.yml

.PHONY: macos
macos:
	ansible-galaxy collection install community.general
	ansible-playbook -i hosts macos.yml

.PHONY: ubuntu
ubuntu:
	sudo apt-get install -y python-pip
	pip install --user ansible
	ansible-playbook -i hosts ubuntu.yml

.PHONY: amazon
amazon: install_ansible
	ansible-playbook -i hosts amazon.yml

.PHONY: phantom
phantom:
	pip3 install --user ansible
	ansible-playbook -i hosts phantom.yml
