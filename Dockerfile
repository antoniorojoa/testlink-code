#FROM pensiero/apache-php-mysql:latest
#FROM appsvcorg/apache-php-mysql:latest
FROM ubuntu:18.04

ENV TZ=Europe/Madrid
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update -q && apt install -yqq --force-yes \
    mariadb-server mariadb-client php apache2
#RUN apt install php7.4-gd -y

# Start mysql
#RUN /etc/init.d/mysql 'start'
#RUN service mysql status
#RUN service apache status

RUN /etc/init.d/apache2 start
RUN /etc/init.d/apache2 status

WORKDIR /var/www/public
COPY . ./

#RUN chmod -R a+rwx /var/www/html/testlink-code/gui/templates_c
RUN chmod -R a+rwx /var/www/public/gui/templates_c
RUN mkdir /var/testlink/
RUN mkdir /var/testlink/logs
RUN mkdir /var/testlink/upload_area/
RUN chmod -R a+rwx /var/testlink/
