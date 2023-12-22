# General
Hashicorp Packer GUNet Templates

Include Templates for:
* VirtualBox

Hashicorp packer provides plugins for various integrations (VirtualBox, VMWare, vSphere, ProxMox) but these plugins actually **require** a relevant installation (`VBManage` for `VirtualBox`, `vmrun` or `vmware` for VMWare, a `ProxMox` endpoint) etc. It is very difficult to setup VirtualBox or VMWare in a Docker environment.

As a result we have implemented a minimal approach:
* The user must install the provider (VMWare, VirtualBox etc) in any way they see fit.
* [gunet/jeos-builder](https://github.com/gunet/JeOS/) will provide the Debian ISO file. Make sure to add an `authorized_keys` since Packer needs to ssh into the VM to finalize installation.
* The ISO file, Packer template and ssh private key should be placed in the same folder.
* This repo only provides the instructions and Packer templates

# Packer
* Install Packer from the Packer [site](https://developer.hashicorp.com/packer/install)
* Validate the template with `packer validate <template file>`
* If plugins have not been installed then run `packer init <template file>`
* Make sure that the necessary files are available such as:
  - JeOS ISO (`gunet-jeos-debian-11.8.0.iso`)
  - ssh private key file (`id_ecdsa.txt`)
* Build the VM with `packer build <template file>`

# Variables
* Templates allow input variables for settings such as # of CPUs, memory or disk space. Input variables always have a default value and can be set by the user:
  - Individually, with the `-var foo=bar` command line option.
  - In variable definitions files, either specified on the command line with the `-var-files values.pkrvars.hcl` or automatically loaded (`*.auto.pkrvars.hcl`).
  - As environment variables, for example: `PKR_VAR_foo=bar`

## VirtualBox template variables
* `cpus`: The # of CPUs. Default `1`
* `memory`: The memory size in MBs. Default `1024`
* `disk`: The disk size in MBs. Default `8192`
* `format`: The output image format. Can be one of `ova` or `ovf`. Default `ova`
* `root_password`: The root password. Default `secret`