**For a new clone:**

You probably should change the Galaxy UID and GID - I discovered when trying to launch more nodes that (due to having
developed the playbook orginically for the first node) the Galaxy GID was already taken by Docker.

**Manual steps for each new instance:**

1. Set instance IP in inventory after spawn. Could use openstack inventory plugin but need to filter out other hosts.
2. Add nodes to slurm_nodes and partition in group_vars/all.yaml

**Manual steps for Galaxy server only:**

1. Set server private IP in galaxy_data_addr. Again, could use openstack inventory for this.
2. Copy munge key to files/slurm/munge.key and vault once created on controller, set slurm_munge_key. Could precreate this.
3. Set slurm_create_user and slurm_user once created on controller. Could also precreate.
4. Set galaxy_group and galaxy_user once created on Galaxy server. Could also precreate.

**TODO**

- Pull sanitize_whitelist.txt and integrated_tool_panel.xml from Github so they don't get out of date.
