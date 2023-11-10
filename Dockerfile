FROM php:7.4-apache
MAINTAINER Paco "asirfmr@gmail.com"
RUN apt-get update && apt-get install -y mariadb-client
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli
ADD bookmedik /var/www/html/
EXPOSE 80
ENV DB_USER user
ENV DB_PASS pass
ENV DB_NAME pass
ENV DB_HOST mariadb
ADD script.sh /usr/local/bin/script.sh
ADD schema.sql /opt
RUN chmod +x /usr/local/bin/script.sh
CMD ["/usr/local/bin/script.sh"]
