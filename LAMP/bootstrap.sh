#!/usr/bin/env bash

# Updating repository
sudo add-apt-repository ppa:ondrej/php
sudo apt-get update

# Installing Apache
sudo apt-get install -y apache2

# Installing MySQL and it's dependencies, Also, setting up root password for MySQL as it will prompt to enter the password during installation
sudo debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password password root'
sudo debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password_again password root'
sudo apt-get -y install mysql-server libapache2-mod-auth-mysql php7.0-mysql

# Installing PHP and it's dependencies
sudo apt-get -y install php7.0 libapache2-mod-php7.0 php7.0-mcrypt

# Sync to host machine
if ! [ -L /var/www ]; then
  rm -rf /var/www
  ln -fs /vagrant /var/www
fi
