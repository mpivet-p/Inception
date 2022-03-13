#!/bin/bash

#Exit if one command fails
set -e

if [ ! -f "/var/www/html/wp-config.php" ]; then

    wget http://wordpress.org/latest.tar.gz
    tar xfz latest.tar.gz --strip-components=1 -C /var/www/html
    cp wp-config-sample.php wp-config.php

    cd wp-content && mkdir uploads && chgrp web uploads/ && chmod 775 uploads/
fi
chown -R www-data /var/www/html
su www-data
/usr/sbin/php-fpm7.3 --nodaemonize
