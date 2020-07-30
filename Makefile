.PHONY: macos
macos:
	ansible-playbook -i hosts macos.yml

.PHONY: ubuntu
ubuntu:
	ansible-playbook -i hosts ubuntu.yml
