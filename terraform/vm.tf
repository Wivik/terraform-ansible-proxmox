resource "proxmox_vm_qemu" "podman" {
    count             = 1
    desc              = "Podman host"
    name              = "podman${count.index}"
    target_node       = "<proxmoxnodename>" ## changeme
    clone             = "centos-8-stream-template"
    os_type           = "cloud-init"
    cores             = 4
    sockets           = "1"
    cpu               = "host"
    memory            = 8192
    scsihw            = "virtio-scsi-pci"
    bootdisk          = "scsi0"
    disk {
        # id              = 0
        size            = "10G"
        type            = "scsi"
        storage         = "local"
        iothread        = 1
    }
    disk {
        # id              = 1
        size            = "100G"
        type            = "scsi"
        storage         = "local"
        iothread        = 1
    }
    network {
        # id              = 0
        model           = "virtio"
        bridge          = "vmbr1"
    }
# Cloud Init Settings
    ipconfig0 = "ip=192.168.1.2${count.index}/24,gw=192.168.1.1"
    sshkeys = <<EOF
    ${var.ssh_key}
    EOF
}
