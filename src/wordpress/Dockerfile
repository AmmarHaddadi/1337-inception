FROM alpine:3.23.4

# based on https://github.com/MansoorMajeed/devops-from-scratch/blob/master/episodes/28-setting-up-wordpress-nginx-php-fpm.md

RUN apk update && apk upgrade && apk add --no-cache \
    php83 \
    php83-fpm \
    php83-mysqli \
    php83-xml \
    php83-curl \
    php83-gd \
    php83-mbstring \
    php83-openssl \
    php83-phar \
    php83-dom \
    php83-ctype \
    php83-session \
    mariadb-client \
    curl

RUN adduser -S -G www-data www-data

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp


COPY ./www.conf /etc/php83/php-fpm.d/www.conf
COPY ./entry.sh /usr/local/bin/entry.sh
RUN chmod +x /usr/local/bin/entry.sh

WORKDIR /var/www/html

EXPOSE 9000

ENTRYPOINT ["/usr/local/bin/entry.sh"]

# -F -> foreground
CMD ["php-fpm83", "-F"]
