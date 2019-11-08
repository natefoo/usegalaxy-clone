ifneq ($(strip $(TAGS)),)
TAGS_ARG="--tags=$(TAGS)"
endif


all:
	ansible-playbook playbook.yaml $(TAGS_ARG)

server:
	ansible-playbook --limit=galaxyservers playbook.yaml $(TAGS_ARG)

nodes:
	ansible-playbook --limit=galaxynodes playbook.yaml $(TAGS_ARG)

launch:
	ansible-playbook jetstream.yaml $(TAGS_ARG)

welcome:
	ansible galaxyservers -m synchronize -a "src=files/galaxy/welcome/ dest={{ galaxy_welcome_dir }}"

.PHONY: all server nodes launch welcome
