FROM debian:buster

RUN apt update && apt install wget php-cli php-mysql php-gd php-xml php-fpm -y

RUN mkdir -p /var/www/html
RUN wget http://wordpress.org/latest.tar.gz
RUN tar xfz latest.tar.gz --strip-components=1 -C /var/www/html

WORKDIR /var/www/html

RUN rm -f latest.tar.gz
RUN cp wp-config-sample.php wp-config.php

RUN mkdir /run/php

ENTRYPOINT ["/usr/sbin/php-fpm7.3", "--nodaemonize"]
#ENTRYPOINT ["tail", "-f", "/dev/null"]
