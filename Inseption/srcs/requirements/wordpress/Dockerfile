FROM	alpine:3.12.3

RUN           apk update
RUN           apk add php7 php7-fpm php7-common php7-iconv php7-json \
              php7-gd php7-curl php7-xml php7-mysqli php7-imap \
              php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap \
              php7-xmlrpc php7-posix php7-mcrypt php7-gettext \
              php7-ldap php7-ctype php7-dom php7-session php7-mbstring \
              php7-phar

RUN     mkdir -p /run/php7
RUN     wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN     chmod +x wp-cli.phar
RUN     mv wp-cli.phar /usr/local/bin/wp


COPY	srcs/start_wp.sh .
RUN		chmod +x start_wp.sh

VOLUME	["/var/www"]

EXPOSE	9000

CMD		sh start_wp.sh