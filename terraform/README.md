# Terraform scripts

I've made a `tf` file for each kind of VM. This repository is just an example.

- `variables.tf` : Put here the proxmox host URL, username and password. Also a ssh pubkey for deployment on VMs.
- `provider.tf` : Provider definition for proxmox, using a community one.
- `vm.tf` : The definition a multiplate VMs created in one shot.
