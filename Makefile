common-preconfig:
	ansible-playbook -i hosts/hosts.ini playbooks/common-preconfig.yml

common-config:
	ansible-playbook -i hosts/hosts.ini playbooks/common-config.yml

k3s-install:
	ansible-playbook -i hosts/hosts.ini playbooks/k3s-install.yml

k3s-destroy:
	ansible-playbook -i hosts/hosts.ini playbooks/k3s-destroy.yml
