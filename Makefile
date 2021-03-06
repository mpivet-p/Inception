all:
	mkdir -p $(HOME)/data/wordpress $(HOME)/data/database $(HOME)/data/phpmyadmin
	docker-compose -f srcs/docker-compose.yml up --build -d

gencert:
	openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 -subj "/C=ES/ST=Madrid/L=Madrid/O=42/CN=mpivet-p.42.fr,phpmyadmin.mpivet-p.42.fr" -keyout mpivet-p.42.fr.key  -out mpivet-p.42.fr.cert

clean:
	docker stop `docker ps -a -q`
	docker rm `docker ps -a -q`
	docker volume rm `docker volume ls -q`

fclean:
	sudo rm -rf $HOME/data

bonus-on:
	patch srcs/docker-compose.yml http.patch
bonus-off:
	patch -R srcs/docker-compose.yml http.patch

.PHONY: all gencert clean fclean bonus-on bonus-off
