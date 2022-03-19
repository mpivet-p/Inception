FROM alpine:3.14

RUN apk -U upgrade && apk --update add mariadb mariadb-client
COPY ./mariadb-server.cnf /etc/mysql/my.cnf
COPY ./prepare_db.sh /prepare.sh
ARG DB
ARG DB_PASS
ARG DB_USER

EXPOSE 3306

RUN /bin/sh /prepare.sh
CMD ["mysqld", "--user=mysql", "--datadir=/var/lib/mysql"]
