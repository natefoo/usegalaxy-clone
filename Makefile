playbook:
	ansible-playbook playbook.yaml

server:
	ansible-playbook --limit=galaxyservers playbook.yaml

nodes:
	ansible-playbook --limit=galaxynodes playbook.yaml

launch:
	ansible-playbook jetstream.yaml

welcome:
	ansible galaxyservers -m synchronize -a "src=files/galaxy/welcome/ dest={{ galaxy_welcome_dir }}"

.PHONY: playbook server nodes launch welcome
