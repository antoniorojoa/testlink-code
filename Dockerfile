#FROM pensiero/apache-php-mysql:latest
#FROM appsvcorg/apache-php-mysql:latest
FROM ubuntu:18.04


RUN apt update -q && apt install -yqq --force-yes \
    mysql-server-5.7 php7.4 apache2
#RUN apt install php7.4-gd -y

# Start mysql
RUN /etc/init.d/mysqld 'start'
RUN service mysqld status

WORKDIR /var/www/public
COPY . ./

#RUN chmod -R a+rwx /var/www/html/testlink-code/gui/templates_c
RUN chmod -R a+rwx /var/www/public/gui/templates_c
RUN mkdir /var/testlink/
RUN mkdir /var/testlink/logs
RUN mkdir /var/testlink/upload_area/
RUN chmod -R a+rwx /var/testlink/
