#!/bin/bash
#Author: kolten
#Script Name: Owncloud Installer

echo "
 | |/ /    | | |            
 | ' / ___ | | |_ ___ _ __  
 |  < / _ \| | __/ _ \ '_ \ 
 | . \ (_) | | ||  __/ | | |
 |_|\_\___/|_|\__\___|_| |_|
"
sleep 2

echo "Owncloud Installation Script"

sleep 2

#Install dependencies
apt install -y apache2 mariadb-server libapache2-mod-php7.0 \
    php7.0-gd php7.0-json php7.0-mysql php7.0-curl \
    php7.0-intl php7.0-mcrypt php-imagick \
    php7.0-zip php7.0-xml php7.0-mbstring

#Install wget tool
apt-get install wget

#Start mysql service
service mysql start

#Complete mysql installation
mysql_secure_installation 

#Create owncloud directory
mkdir /var/www/html/owncloud

#Go created owncloud directory
cd /var/www/html/owncloud

#Pull web installer PHP file
wget https://download.owncloud.com/download/community/setup-owncloud.php

echo "Installation complete. Please read the instructions..."

#Set owncloud folder permission to 755
chmod -R 755 /var/www/html/owncloud

echo "Owncloud folder permission is setted."

sleep 2

#Change Owncloud folder user and group owner
chown -R www-data:www-data /var/www/html/owncloud

echo "Owncloud folder owner changed."

sleep 2

#Start apache2 service
service apache2 start

echo "If you get any error, Please change network interface name"

#Find host ip automatically. If your interface address is different, please change ens33 interface name.
ip addr show ens33 | awk '$1 == "inet" {gsub(/\/.*$/, "", $2); print $2}' > /home/host

#Set host ip to variable
hostson=`cat /home/host`

#Delete previous file
rm /home/host

sleep 2

echo "Please go to http://$hostson/owncloud/setup-owncloud.php page and run web installer..." 
