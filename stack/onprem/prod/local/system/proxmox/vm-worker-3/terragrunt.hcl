include "backend" {
  path = find_in_parent_folders("aws-backend.hcl")
}

terraform {
  source = "github.com/random-builds/tf-module-proxmox.git//vm?ref=8c3f5c96a34e2a15ea2d10d837d1c19e7ed63866"
}

inputs = {
  name = "worker-3"
  node_name = "px"
  cpu = 8
  memory = 32768
  iso = "metal-amd64.iso"
  volume_size = 150
  ip = {
    address = "dhcp"
    # address = "10.0.1.10/24"
    # gateway = "10.0.1.1"
  }
  mac_address = "AA:AA:AA:AA:AA:DD"
}
