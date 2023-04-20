FROM pensiero/apache-php-mysql:latest

RUN printf '#!/bin/sh\nexit 0' > /usr/sbin/policy-rc.d

RUN apt update -q && apt install -yqq --force-yes \
    mysql-server
RUN apt install php7.4-gd -y

# Start mysql
RUN /etc/init.d/mysql 'start'
RUN service mysql status

WORKDIR /var/www/public
COPY . ./

#RUN chmod -R a+rwx /var/www/html/testlink-code/gui/templates_c
RUN chmod -R a+rwx /var/www/public/gui/templates_c
RUN mkdir /var/testlink/
RUN mkdir /var/testlink/logs
RUN mkdir /var/testlink/upload_area/
RUN chmod -R a+rwx /var/testlink/
