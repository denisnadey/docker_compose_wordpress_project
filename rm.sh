	echo "y" | docker system prune
	docker rmi $(docker images -aq)
	docker volume rm srcs_db_vol srcs_wp_vol
	echo "mdenys" |	sudo rm -rf /home/mdenys/data/wp/*
	echo "mdenys" |	sudo rm -rf /home/mdenys/data/db/*