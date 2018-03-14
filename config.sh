#!/usr/bin/env bash

# NOTE: This Script will setup base VHost only. 
# Script needs to be updated if there is a need for more Vhost

# Ensure the Ubuntu Box is updated.
sudo apt-get update
sudo apt-get -y upgrade

# install apache 2.5 and php 5.5
sudo apt-get install -y apache2
sudo apt-get install -y php5

# Password For Mysql Server
PASSWORD='s1mPl3p@ssW0rd'
# Assign the Password to Mysql Installer
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password $PASSWORD"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $PASSWORD"
# install mysql server
sudo apt-get -y install mysql-server
sudo apt-get install php5-mysql

# Assign Password to PHPMYAdmin. To make things simple, this script would setup same password for Mysql & PHPMyadmin.
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/dbconfig-install boolean true"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/app-password-confirm password $PASSWORD"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/admin-pass password $PASSWORD"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/app-pass password $PASSWORD"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2"

# Install PHPMYAdmin
sudo apt-get -y install phpmyadmin

# Basic Virtual Host Setup
VHOST=$(cat <<EOF
<VirtualHost *:80>
    ServerAdmin webmaster@email.
    DocumentRoot /var/www/html
</VirtualHost>
EOF
)
echo "${VHOST}" > /etc/apache2/sites-available/000-default.conf

# Add Fully Config Domain to avoid Apache Error AH00558
echo "ServerName localhost" | sudo tee /etc/apache2/conf-available/fqdn.conf
sudo a2enconf fqdn

# Enable Mod Rewrite. Same approach can be used for enabled other required mod
sudo a2enmod rewrite

# Update PHP INI. (sample only)
short_open_tag=On
display_error=On

for key in short_open_tag display_error
do
 sed -i "s/^\($key\).*/\1 $(eval echo \${$key})/" /etc/php5/apache2/php.ini
done

# Restart Apache
service apache2 restart
