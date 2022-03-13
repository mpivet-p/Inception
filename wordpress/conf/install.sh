#!/bin/bash

#Exit if one command fails
set -e

if [ ! -f "/var/www/wordpress/wp-config.php" ]; then
    wp core download
    wp config create\
        --dbhost=${DB_HOST}\
        --dbname=${DB_NAME}\
        --dbuser=${DB_USER}\
        --dbpass=${DB_PASS}

    wp core install\
        --url=${WP_URL}\
        --title=${WP_TITLE}\
        --admin_name=${WP_ADMIN}\
        --admin_password=${WP_PASS}\
        --admin_email=${WP_MAIL}

    cd wp-content && mkdir uploads && chgrp web uploads/ && chmod 775 uploads/
fi

/usr/sbin/php-fpm7.3 --nodaemonize
