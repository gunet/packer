source "virtualbox-iso" "jeos-vm" {
  # The JeOS ISO file should reside in the same folder as the template file
  iso_url = "gunet-jeos-debian-11.8.0.iso"
  iso_checksum = "none"
  # # of CPUs
  cpus = 1
  # Memory in MBs
  memory = 1024
  # Disk size in MBs
  # JeOS requires at least 4GB (4096MB) for automatic setup
  disk_size = 8192
  # vm_name = "packer-BUILDNAME"
  # format can be ova or ovf
  # We choose ova to output just one file
  format = "ova"
  # output_directory = "output-BUILDNAME"
  # output_filename = "${vm_name}"
  guest_os_type = "Debian11_64"
  headless = false
  communicator = "ssh"
  ssh_username = "root"
  ssh_password = "secret"
  ssh_port = 65432
  # This should be the private key that corresponds to the
  # authorized_keys public keys inserted in the ISO by jeos-builder
  ssh_private_key_file = "id_ecdsa.txt"
  ssh_timeout = "20m"
  shutdown_command = "echo 'packer' | shutdown -P now"
}

build {
  name = "packer-virtualbox-vm"
  sources = ["sources.virtualbox-iso.jeos-vm"]
}

packer {
    required_plugins {
        virtualbox = {
          version = "~> 1"
          source  = "github.com/hashicorp/virtualbox"
        }
    }
}