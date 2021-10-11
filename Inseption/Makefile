D-COMP=srcs/docker-compose.yml
D-CMD=docker-compose -f $(D-COMP)

.PHONY:	all up stop down start re

all:	up

re:		clean up

up:
	mkdir -p /home/mdenys/data/db
	mkdir -p /home/mdenys/data/wp
	$(D-CMD) up -d --build

stop:
	$(D-CMD) stop

down:
	$(D-CMD) down --rmi all -v

clean: 	down
	sh ./srcs/requirements/tools/rm.sh

start:
	$(D-CMD) start