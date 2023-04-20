FROM pensiero/apache-php-mysql:latest

RUN apt update -q && apt install -yqq --force-yes \
    mysql-server

# Start mysql
RUN /etc/init.d/mysql 'start'

WORKDIR /var/www/public
COPY . ./

USER 1000
#RUN chmod -R a+rwx /var/www/html/testlink-code/gui/templates_c
RUN mkdir /var/testlink/ && mkdir /var/testlink/logs
RUN chmod -R a+rwx /var/testlink/

RUN mkdir /var/testlink/ && /var/testlink/upload_area/
RUN chmod -R a+rwx /var/testlink/
