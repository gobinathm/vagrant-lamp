# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version.
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "ubuntu/trusty64"

  # Define the Virtual box name (Change it to whatever you like)
  config.vm.provider "virtualbox" do |v|
  	v.name = "Box Name"
  end

  # Access to the machine using a specific IP.
  config.vm.network "private_network", ip: "192.168.0.2"

  # Sharing folders with Guest OS. 
  # First argument is the path on the host to the actual folder.
  # Second argument is the path on the guest to mount the folder.
  # Example below. (mount any desired path).
  # config.vm.synced_folder "~/sites/application", "/var/www/html"
  config.vm.synced_folder "./", "/var/www/html"

  # Define the bootstrap file: A (shell) script that runs after first setup of your box (= provisioning)
  config.vm.provision :shell, path: "config.sh"

end


