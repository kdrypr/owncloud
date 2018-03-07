# owncloud
owncloud installation bash script

Download installer.sh file

Set execute permission to file

#sudo chmod +x installer.sh

Start script and follow instructions

#sudo ./installer.sh


Create database and user;

CREATE USER 'owncloud'@'%' IDENTIFIED BY 'PASSWORD';

CREATE DATABASE `owncloud`;

GRANT ALL PRIVILEGES on `owncloud`.* TO 'owncloud'@'%';
