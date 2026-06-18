#!/bin/sh

set -e

# echo "Waiting for maria to start"
# while ! mysqladmin ping -h"mariadb" --silent; do
#     sleep 1
# done

mkdir -p /var/www/html
chown -R www-data:www-data /var/www/html

if [ ! -f "wp-config.php" ]; then
    echo "installing wordpress"
    # wp core download --allow-root
    php -d memory_limit=-1 /usr/local/bin/wp core download --allow-root # should solve memory issues

    DB_PASS=$(cat /run/secrets/maria_normal)
    WP_ADMIN_PASS=$(cat /run/secrets/maria_root) 
    WP_USER_PASS=$(cat /run/secrets/wp_user_pass)

    php -d memory_limit=-1 /usr/local/bin/wp config create \
        --dbname=wordpress \
        --dbuser="$MARIA_USERNAME" \
        --dbpass="$DB_PASS" \
        --dbhost="mariadb:3306" \
        --allow-root


    php -d memory_limit=-1 /usr/local/bin/wp core install \
        --url="${DOMAIN_NAME}" \
        --title="${WP_TITLE}" \
        --admin_user="${WP_ADMIN_USER}" \
        --admin_password="$WP_ADMIN_PASS" \
        --admin_email="admin@${DOMAIN_NAME}" \
        --allow-root

    php -d memory_limit=-1 /usr/local/bin/wp user create \
        "${WP_USER}" \
        "user@${DOMAIN_NAME}" \
        --user_pass="$WP_USER_PASS" \
        --role=author \
        --allow-root

    # temporary codespace fix
    php -d memory_limit=-1 /usr/local/bin/wp config set WP_HOME "https://${DOMAIN_NAME}" --allow-root
    php -d memory_limit=-1 /usr/local/bin/wp config set WP_SITEURL "https://${DOMAIN_NAME}" --allow-root
    php -d memory_limit=-1 /usr/local/bin/wp config set --raw HTTP_X_FORWARDED_PROTO "'https'" --allow-root
        
   
    chown -R www-data:www-data /var/www/html
fi

echo "WordPress has been initialized"
exec "$@"