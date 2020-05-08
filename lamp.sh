#!/bin/bash

# Update Package Index
sudo apt update

# Installer Apache2, MySQL, PHP
sudo apt install apache2 mysql-server php php-mysql libapache2-mod-php php-cli

# Allow to run Apache on boot up
sudo systemctl enable apache2

# Restart Apache Web Server
sudo systemctl start apache2

echo "Creation des utilisareurs et de la base de données"
sudo mysql <<EOF
create user ImenDataBase identified by '123';
grant all privileges on *.* To JustImen;
grant create on *.* To JustImen;

create database ImenDataBase;
use ImenDataBase;

CREATE TABLE users (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
EOF

#sudo echo "<?php phpinfo(); ?>" >> /var/www/html/info.php
#sudo nano /var/www/html/info.php
#sudo cp -r ProjetPart1LAMP/ /var/www/html/
#scp -r ProjetPart1LAMP/ useradm@192.168.56.20:/home/useradm

# Open login page
xdg-open "http://localhost/ProjetImen/ProjetLogin/login.php"

