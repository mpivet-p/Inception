FROM debian:buster

RUN apt update\
    && apt install apache2 wget php libapache2-mod-php php-gd php-mysql -y

RUN wget -P /tmp https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz
RUN mkdir -p /var/www/html/phpmyadmin

WORKDIR /tmp
RUN tar xvf phpMyAdmin-latest-all-languages.tar.gz --strip-components=1 -C /var/www/html/phpmyadmin
RUN cp /var/www/html/phpmyadmin/config.sample.inc.php /var/www/html/phpmyadmin/config.inc.php
RUN chmod 660 /var/www/html/phpmyadmin/config.inc.php
RUN chown -R www-data:www-data /var/www/html/phpmyadmin

EXPOSE 80

ENTRYPOINT ["/usr/sbin/apachectl", "-DFOREGROUND", "-k", "start"]
