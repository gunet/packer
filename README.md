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
* Build the VM with `packer build <template file>`