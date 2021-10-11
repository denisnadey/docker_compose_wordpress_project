#!/bin/sh

openrc default
/etc/init.d/mariadb setup
rc-service mariadb start
db_exist=$(echo "SHOW DATABASES" | mysql | grep ${DB_NAME} | wc -l)
if [ $db_exist = "0" ]
then
echo "CREATE DATABASE IF NOT EXISTS ${DB_NAME};" | mysql
echo "CREATE USER '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';" | mysql
echo "GRANT ALL ON *.* TO '${DB_USER}'@'%';" 
echo "update mysql.user set plugin='mysql_native_password' where user='${DB_USER}';" | mysql;
echo "FLUSH PRIVILEGES;" | mysql
fi
rc-service mariadb stop
/usr/bin/mysqld_safe  --datadir="/var/lib/mysql"

sh