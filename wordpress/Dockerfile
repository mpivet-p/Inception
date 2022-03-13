FROM debian:buster

RUN apt update && apt install wget php-cli php-mysql php-gd php-xml php-fpm -y
#dev
RUN apt update && apt install vim -y

RUN mkdir -p /var/www/html
RUN wget http://wordpress.org/latest.tar.gz
RUN tar xfz latest.tar.gz --strip-components=1 -C /var/www/html

WORKDIR /var/www/html

RUN rm -f latest.tar.gz
RUN cp wp-config-sample.php wp-config.php

RUN mkdir /run/php
#RUN sed '/^listen =/s/\/run\/php\/php7.3-fpm.sock/9000/' -i /etc/php/7.3/fpm/pool.d/www.conf
#RUN echo "chroot=/var/www/mydomain.com" >> /etc/php/7.3/fpm/php-fpm.conf
RUN echo "listen = 9000" >> /etc/php/7.3/fpm/pool.d/www.conf

EXPOSE 9000

ENTRYPOINT ["/usr/sbin/php-fpm7.3", "--nodaemonize"]
#ENTRYPOINT ["tail", "-f", "/dev/null"]
