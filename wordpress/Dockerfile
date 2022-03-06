FROM debian:buster

RUN apt update && apt install apache2 wget php libapache2-mod-php php-mysql -y

RUN mkdir -p /var/www/html
WORKDIR /var/www/html
RUN wget http://wordpress.org/latest.tar.gz
RUN tar xfz latest.tar.gz --strip-components=1 -C /var/www/html
RUN rm -f latest.tar.gz
RUN cp wp-config-sample.php wp-config.php

EXPOSE 80

ENTRYPOINT ["/usr/sbin/apachectl", "-DFOREGROUND", "-k", "start"]
