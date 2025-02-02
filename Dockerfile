FROM pensiero/apache-php-mysql:latest

RUN apt update -q && apt install -yqq --force-yes \
    mariadb-server mariadb-client php7.4-gd php-mysql vim

#RUN /etc/init.d/apache2 start
# Start mysql
RUN /etc/init.d/mysql start

WORKDIR /var/www/public

COPY . ./

#RUN chmod -R a+rwx /var/www/html/testlink-code/gui/templates_c
RUN chmod -R a+rwx /var/www/public/gui/templates_c
RUN mkdir /var/testlink/
RUN mkdir /var/testlink/logs
RUN mkdir /var/testlink/upload_area/
RUN chmod -R a+rwx /var/testlink/
