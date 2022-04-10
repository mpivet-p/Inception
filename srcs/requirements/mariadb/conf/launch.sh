#!/bin/bash

if [ ! -f /var/lib/mysql/ibdata1 ]; then
    mkdir -p /var/lib/mysql/
    chown -R mysql: /var/lib/mysql
    
    mysql_install_db --user=mysql --datadir="/var/lib/mysql"

    /usr/bin/mysqld_safe --defaults-file=/etc/mysql/my.cnf &
    sleep 2

    mysql -u root --password="" -e "CREATE DATABASE ${DB_NAME}"
    echo "USE ${DB_NAME};
            GRANT ALL ON *.* TO '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASS}';
            GRANT ALL ON *.* TO '${DB_USER}'@'localhost' IDENTIFIED BY '${DB_PASS}';
            FLUSH PRIVILEGES;" | mysql -u root --password=""

fi

sleep 10
pkill mariadbd
echo $?
pkill mysqld
echo $?
sleep 1
#mysqld --user=mysql --datadir=/var/lib/mysql
tail -f /dev/null
