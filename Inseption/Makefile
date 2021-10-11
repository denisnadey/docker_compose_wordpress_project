D-COMP=srcs/docker-compose.yml
D-CMD=docker-compose -f $(D-COMP)
.PHONY:	all up stop down start re

all:	up

re:		clean up

up:
	mkdir -p /home/mdenys/data/db
	mkdir -p /home/mdenys/data/wp
	chmod 777 /home/mdenys/data/db
	chmod 777 /home/mdenys/data/wp
	$(D-CMD) up -d --build

stop:
	$(D-CMD) stop

down:
	$(D-CMD) down --rmi all -v

clean: 	down
	rm -rf /home/mdenys/data/db
	rm -rf /home/mdenys/data/wp

start:
	$(D-CMD) start