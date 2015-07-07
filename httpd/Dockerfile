FROM centos:6-my
MAINTAINER Sergey Korytnikov "sergey.korytnikov@gmail.com"

EXPOSE 80

RUN yum -y update && yum clean all
RUN yum -y install httpd && yum clean all

COPY generic/etc/supervisord.conf /etc/supervisord.conf
COPY generic/etc/httpd/conf/httpd.conf /etc/httpd/conf/httpd.conf

RUN mkdir -p /var/run/httpd

RUN echo "This is root" > /var/www/html/index.html && \
    mkdir /var/www/html/one && echo "This is context number One" > /var/www/html/one/index.html && \
    mkdir /var/www/html/two && echo "This is context number Two" > /var/www/html/two/index.html && \
    mkdir /var/www/html/three && echo "This is context number Three" > /var/www/html/three/index.html
