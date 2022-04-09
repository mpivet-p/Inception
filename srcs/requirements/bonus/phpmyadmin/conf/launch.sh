sed -i "s/PMA_HOST/$DB_HOST/g" config.inc.php
sed -i "s/PMA_USER/$DB_USER/g" config.inc.php
sed -i "s/PMA_PASS/$DB_PASS/g" config.inc.php

/usr/sbin/php-fpm7.3 --nodaemonize
