#!/bin/bash

export WP_CLI_CACHE_DIR=/var/www/html/.wp-cli/cache

if [ ! -f "/var/www/html/wp-config.php" ]; then
    # If wp-config is missing we remove all files before reinstalling
    shopt -s extglob && rm -rfv !("install.sh") && shopt -u extglob
    wp core download --path="/var/www/html"
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

fi

/usr/sbin/php-fpm7.3 --nodaemonize
