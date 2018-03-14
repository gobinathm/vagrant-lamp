# vagrant-lamp

A Simple Vagrantfile & Bash Script to setup LAMP stack (PHP 5)
### What's Included ?

config.sh shell script will do the following:

* Ensure the Ubuntu Box is updated.

* install apache 2.5 and php 5.5, MySQL & PHPMyAdmin

* Configure Mysql & PHPMyAdmin with pre-chosen password. (You can update it in config.sh variable `PASSWORD`

* Add Fully Config Domain to avoid Apache Error AH00558

* Enable Mod Rewrite

* Update PHP INI

### Usage !

Clone this repository in your desired folder and simply do a `vagrant up` on the command line from within the folder.

### Requirement

This box uses Ubuntu 14.04 LTS "Trustry Thar" 64bit. In case you don't have this basic box already in your machine then do `vagrant box add ubuntu/trusty64` before doing `vagrant up`.
