FROM alpine:3.12

RUN     apk update && apk upgrade
RUN     apk add mariadb mariadb-client openrc

COPY	./srcs/my.cnf /etc/
RUN     chown mysql:mysql /etc/my.cnf
RUN     chmod 600 /etc/my.cnf

COPY    ./srcs/start_mysql_db.sh /
RUN     chmod +x start_mysql_db.sh

VOLUME ["/var/lib/mysql"]

CMD sh start_mysql_db.sh

EXPOSE 3306