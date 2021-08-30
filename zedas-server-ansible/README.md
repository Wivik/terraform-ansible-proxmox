# Ansible Roles

## Inventories

Expected variables are in `all/group_vars/<group_vars_file>`.

- `all.yml` : contains global variables like entries in /etc/hosts
- `db.yml` : variables for postgresql role
- `podman.yml` : variables and containers definition for podman role
- `proxy.yml` : variables and vhost definition for reverse proxy role
- `web.yml` : variables and vhost and services settings for webserver role

## Roles

Except the postgresql role, all of these are tested for Red Hat familly only (CentOS 8).

- `ansible-role-postgresql` : Comes from https://github.com/geerlingguy/ansible-role-postgresql
- `nextcloud` : setup a Nextcloud instance based on the attributes given in `webserver.yml`
- `podman` : deploy podman containers. The dockerfile and docker-compose are templates inside the `templates` folder, filled with `podman.yml` group_vars content. Example with Gitea and Jenkins in this role.
- `postinstall_postgresql` : this role add in postgresql configuration the `Listen: *` instruction.
- `reverseproxy` : This role setups the reverse proxy vhost and configurations according to `proxy.yml` group_vars file.
- `setup_postgresql` : This role install and creates PG filesystems. All PG setup is in `ansible-role-postgresql`.
- `ttrss` : this role setup TinyTiny RSS for the first time. Settings are expected in `webserver.yml`
- `webserver` : install Apache + PHP
