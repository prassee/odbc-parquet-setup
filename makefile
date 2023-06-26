build:
	# podman build -t odbcparquet:latest .
	podman pull mysql/mysql-server:latest
run:
	# podman container rm odbcparquet 
	podman run --name local-mysql -e MYSQL_ROOT_PASSWORD=pras29gb -p 13306:3306 -d mysql:5.7
	# podman run -p 13306:3306 --name local-mysql -eMYSQL_ROOT_PASSWORD=pras29gb -d mysql-server:latest
	# podman run -it  --name odbcparquet odbcparquet:latest

sshInto:
	podman exec -it local-mysql bash