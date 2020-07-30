.PHONY: macos
macos:
	ansible-playbook -i hosts macos.yml

.PHONY: ubuntu
ubuntu:
	ansible-playbook -i hosts ubuntu.yml

.PHONY: amazon
amazon:
	pip install ansible
	ansible-playbook -i hosts amazon.yml
