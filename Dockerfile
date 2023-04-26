#FROM pensiero/apache-php-mysql:latest
#FROM appsvcorg/apache-php-mysql:latest
FROM ubuntu:18.04

ENV TZ=Europe/Madrid
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update -q && apt install -yqq --force-yes \
    mariadb-server maridb-client php php7.2-gd php-mysql apache2 apache2-utils vim
#RUN apt install php7.4-gd -y

#RUN /etc/init.d/apache2 start
# Start mysql
RUN /etc/init.d/mysql start

#RUN service apache status
#ENV PROJECT_PATH=/var/www PROJECT_PUBLIC_DIR=public APACHE_RUN_USER=www-data APACHE_RUN_GROUP=www-data APACHE_LOG_DIR=/var/log/apache2 APACHE_LOCK_DIR=/var/lock/apache2
#RUN /etc/init.d/apache2 status

EXPOSE 80 3306

#RUN rm /var/www/html/index.html
WORKDIR /var/www/public
#WORKDIR /var/www/html
COPY . ./

#RUN chmod -R a+rwx /var/www/html/testlink-code/gui/templates_c
RUN chmod -R a+rwx /var/www/public/gui/templates_c
RUN mkdir /var/testlink/
RUN mkdir /var/testlink/logs
RUN mkdir /var/testlink/upload_area/
RUN chmod -R a+rwx /var/testlink/

CMD ["apache2ctl", "-D", "FOREGROUND"]
