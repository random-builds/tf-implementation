include "backend" {
  path = find_in_parent_folders("aws-backend.hcl")
}

terraform {
  source = "github.com/random-builds/tf-module-proxmox.git//vm?ref=8c3f5c96a34e2a15ea2d10d837d1c19e7ed63866"
}

inputs = {
  name = "controller"
  node_name = "px"
  cpu = 2
  memory = 8096
  iso = "metal-amd64.iso"
  volume_size = 50
  ip = {
    address = "dhcp"
    # address = "10.0.1.10/24"
    # gateway = "10.0.1.1"
  }
  mac_address = "AA:AA:AA:AA:AA:AA"
}
