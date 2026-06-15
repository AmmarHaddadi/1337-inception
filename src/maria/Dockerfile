FROM alpine:3.23.4

RUN apk update && apk upgrade && apk add --no-cache mariadb mariadb-client

RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld \
    && mkdir -p /var/lib/mysql && chown -R mysql:mysql /var/lib/mysql

COPY 50-server.cnf /etc/my.cnf.d/50-server.cnf

COPY ./entry.sh /usr/local/bin/entry.sh
RUN chmod +x /usr/local/bin/entry.sh

EXPOSE 3306

ENTRYPOINT ["/usr/local/bin/entry.sh"]
CMD ["mariadbd", "--user=mysql", "--skip-log-error"]