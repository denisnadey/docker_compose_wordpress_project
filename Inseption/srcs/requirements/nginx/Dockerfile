FROM alpine:3.12

RUN apk update && apk upgrade

RUN apk add openrc --no-cache
RUN mkdir /run/openrc 
RUN touch /run/openrc/softlevel

RUN apk add nginx
RUN apk add openssl

RUN adduser -D -g 'www' www

RUN mkdir -p /var/run/nginx
RUN mkdir /www

RUN chown -R www:www /etc/nginx
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /var/run/nginx
RUN chown -R www:www /www

COPY srcs/nginx.conf /etc/nginx/nginx.conf

RUN mkdir /etc/nginx/ssl
RUN chown -R www:www /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 \
                -x509 \
                -sha256 \
                -days 3650 \
                -nodes \
                -out /etc/nginx/ssl/nginx-key.crt \
                -keyout /etc/nginx/ssl/nginx.key \
                -subj "/C=RU/ST=Tatarstan/L=Kazan/O=21School/OU=IT Departament/CN=localhost"

COPY srcs/start_nginx.sh /

CMD sh start_nginx.sh

VOLUME	["/var/www"]

EXPOSE  443