FROM alpine:latest

RUN apk add --upgrade mysql mysql-client && rm -f /var/cache/apk/*

ENV MYSQL_ROOT_PASSWORD db_pass
ENV MYSQL_USER wordpress


EXPOSE 3306
CMD ["mysqld", "--user=root"]
