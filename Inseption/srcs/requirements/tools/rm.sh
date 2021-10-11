	docker stop $(docker ps -qa) 2>/dev/null 
	docker rm $(docker ps -qa) 2>/dev/null 
	echo "y" | docker system prune 2>/dev/null 
	docker rmi $(docker images -qa) 2>/dev/null 
	docker volume rm $(docker volume ls -q) 2>/dev/null 
	docker nerwork rm $(docker network ls -q) 2>/dev/null 
	echo "mdenys" |sudo rm -rf /home/mdenys/data/wp/* 2>/dev/null 
	echo "mdenys" |sudo rm -rf /home/mdenys/data/db/* 2>/dev/null