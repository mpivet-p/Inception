#!/bin/bash

#Exit if one command fails
set -e
echo $DB_HOST $DB_NAME $DB_USER $DB_PASS $WP_URL $WP_TITLE $WP_ADMIN $WP_PASS $WP_MAIL

export WP_CLI_CACHE_DIR=/var/www/html/.wp-cli/cache
if [ ! -f "/var/www/html/wordpress/wp-config.php" ]; then
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
