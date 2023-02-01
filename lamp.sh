#!/bin/bash
sudo yum update -y

#install MariaDB (MySQL), Apache, PHP
sudo amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2
sudo yum install -y httpd mariadb-server unixODBC.x86_64 mysql-connector-odbc

#start apache server
sudo systemctl start httpd
sudo systemctl enable httpd

#install ODBC library for python
pip3 install pyodbc

#grant ec2-user access to add files to Apache
sudo usermod -a -G apache ec2-user
sudo chown -R ec2-user:apache /var/www
sudo chmod 2775 /var/www && find /var/www -type d -exec sudo chmod 2775 {} \;
find /var/www -type f -exec sudo chmod 0664 {} \;

#secure MariaDB server
sudo systemctl start mariadb
sudo systemctl enable mariadb

#install PHPAdmin
sudo yum install php-mbstring php-xml -y
sudo systemctl restart httpd
sudo systemctl restart php-fpm
cd /var/www/html
wget https://files.phpmyadmin.net/phpMyAdmin/5.2.0/phpMyAdmin-5.2.0-all-languages.tar.gz
mkdir phpMyAdmin && tar -xvzf phpMyAdmin-5.2.0-all-languages.tar.gz  -C phpMyAdmin --strip-components 1
rm phpMyAdmin-5.2.0-all-languages.tar.gz
sudo systemctl start mariadb

sudo mysql_secure_installation