#!/bin/sh
openrc default
/etc/init.d/mariadb setup
rc-service mariadb start
db_exist=$(echo "SHOW DATABASES" | mysql | grep $DB_NAME | wc -l)
if [ $db_exist = "0" ]
then
    echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;" | mysql
    echo "GRANT ALL ON $DB_NAME.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD' WITH GRANT OPTION;" | mysql
    echo "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password;" | mysql
    echo "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('12345678');" | mysql
    echo "FLUSH PRIVILEGES;" | mysql
fi
rc-service mariadb stop
/usr/bin/mysqld_safe  --datadir="/var/lib/mysql"
sh