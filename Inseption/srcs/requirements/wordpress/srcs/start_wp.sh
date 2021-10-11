#!/bin/sh

sed -i 's/;daemonize = yes/daemonize = no/g' /etc/php7/php-fpm.conf
echo "listen = 9000" >> /etc/php7/php-fpm.d/www.conf


### Check if a directory does not exist ###
if [ ! -d "/var/www/localhost/wordpress" ] 
then
	mkdir -p /var/www/localhost/wordpress
	chmod 777 /var/www/localhost/wordpress
	cd /var/www/localhost/wordpress

	wp core download    --allow-root \
						--quiet
	wp core config      --allow-root \
						--skip-check \
						--dbname=$DB_NAME \
						--dbuser=$DB_USER \
						--dbpass=$DB_PASSWORD \
						--dbhost=$DB_HOST \
						--dbprefix=$DB_PREFIX \
						--quiet
	wp core install     --allow-root \
						--url=$DOMAIN_NAME \
						--title="ecole 42" \
						--admin_user="mdenys" \
						--admin_password="mdenys" \
						--admin_email="mdenys@student.21-school.ru" \
						--quiet
	wp user create      eke eke@example.com \
						--role=author \
						--user_pass="eke" \
						--allow-root \
						--quiet
	wp user create      biba biba@example.com \
						--role=author \
						--user_pass="biba" \
						--allow-root \
						--quiet
	wp user create      boba boba@example.com \
						--role=author \
						--user_pass="boba" \
						--allow-root \
						--quiet
fi





exec php-fpm7 -R -F

sh