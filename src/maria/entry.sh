#!/bin/sh

set -e

ROOT_PASS=$(cat /run/secrets/maria_root)
USER_PASS=$(cat /run/secrets/maria_normal)


if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "Database missing. Executing structural initialization..."
    

    mariadb-install-db --user=mysql --datadir=/var/lib/mysql > /dev/null

    tmpscript=$(mktemp)
    if [ ! -f "$tmpscript" ]; then
        exit 1
    fi

    cat << EOF > "$tmpscript"
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '$ROOT_PASS';
CREATE DATABASE IF NOT EXISTS wordpress;
CREATE USER '$MARIA_USERNAME'@'%' IDENTIFIED BY '$USER_PASS';
GRANT ALL PRIVILEGES ON wordpress.* TO '$MARIA_USERNAME'@'%';
FLUSH PRIVILEGES;
EOF


    mariadbd --user=mysql --bootstrap < "$tmpscript"
    rm -f "$tmpscript"
    
    echo "Database successfully bootstrapped"
fi


exec "$@"