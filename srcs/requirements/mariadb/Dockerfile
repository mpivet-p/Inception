FROM alpine:3.14

RUN apk -U upgrade\
    && apk --update add mariadb mariadb-client

COPY ./conf/mariadb-server.cnf /etc/mysql/my.cnf
COPY ./conf/launch.sh /launch.sh

CMD ["/bin/sh", "launch.sh"]
