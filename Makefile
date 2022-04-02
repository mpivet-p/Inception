all:
	docker-compose up --build -d

clean:
	docker stop `docker ps -a -q`
	docker rm `docker ps -a -q`
	docker volume rm `docker volume ls -q`
