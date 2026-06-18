FROM alpine:3.23.4

RUN apk update && apk upgrade && apk add --no-cache nginx openssl

RUN mkdir -p /etc/nginx/ssl

# trick to route Nginx logs to Docker's stdout and stderr
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

# generate new self signed cert
# https://stackoverflow.com/questions/10175812/how-can-i-generate-a-self-signed-ssl-certificate-using-openssl
# change domain
RUN openssl req -x509 -newkey rsa:4096 -keyout /etc/nginx/ssl/key.pem -out /etc/nginx/ssl/cert.pem -sha256 -days 3650 -nodes -subj "/C=MA/ST=Tetouan/L=CaboNegro/O=1337/OU=Inception/CN=ahaddadi.1337.ma"
# RUN openssl req -x509 -newkey rsa:4096 -keyout /etc/nginx/ssl/key.pem -out /etc/nginx/ssl/cert.pem -sha256 -days 3650 -nodes -subj "/C=MA/ST=Tetouan/L=CaboNegro/O=1337/OU=Inception/CN=glorious-space-waddle-qx7v5j4j5xp269pp-443.app.github.dev"

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
