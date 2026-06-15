#!/bin/sh

echo "Waiting for maria to start"
while ! mysqladmin ping -h"mariadb" --silent; do
    sleep 1
done

if [ ! -f "wp-config.php" ]; then
    echo "installing wordpress"
    wp core download --allow-root

    DB_PASS=$(cat /run/secrets/maria_normal)
    WP_ADMIN_PASS=$(cat /run/secrets/maria_root) 
    WP_USER_PASS=$(cat /run/secrets/wp_credentials)

    wp config create \
        --dbname=wordpress \
        --dbuser="$MARIA_USERNAME" \
        --dbpass="$DB_PASS" \
        --dbhost="mariadb:3306" \
        --allow-root

    wp core install \
        --url="${DOMAIN_NAME}" \
        --title="${WP_TITLE}" \
        --admin_user="${WP_ADMIN_USER}" \
        --admin_password="$WP_ADMIN_PASS" \
        --admin_email="admin@${DOMAIN_NAME}" \
        --allow-root

    wp user create \
        "${WP_USER}" \
        "user@${DOMAIN_NAME}" \
        --user_pass="$WP_USER_PASS" \
        --role=author \
        --allow-root
        
   
    chown -R www-data:www-data /var/www/html
fi

echo "WordPress has been initialized"
exec "$@"