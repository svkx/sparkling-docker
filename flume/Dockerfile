FROM centos-java:7-my
MAINTAINER Sergey Korytnikov "sergey.korytnikov@gmail.com"

COPY generic/etc/supervisord-*.conf /etc/

RUN curl -s http://archive.apache.org/dist/flume/1.6.0/apache-flume-1.6.0-bin.tar.gz | tar -xz -C /opt/
RUN ln -s /opt/apache-flume-1.6.0-bin /opt/flume
ENV PATH $PATH:/opt/flume/bin

RUN curl -o /tmp/commons-configuration-1.10-bin.tar.gz http://mirrors.sonic.net/apache//commons/configuration/binaries/commons-configuration-1.10-bin.tar.gz
RUN tar -xvzf /tmp/commons-configuration-1.10-bin.tar.gz -C /opt/flume/lib/ commons-configuration-1.10/commons-configuration-1.10.jar --strip-components 1
RUN rm -f /tmp/commons-configuration-1.10-bin.tar.gz

RUN curl -o /tmp/hadoop-1.2.1.tar.gz https://archive.apache.org/dist/hadoop/common/hadoop-1.2.1/hadoop-1.2.1.tar.gz
RUN tar -xvzf /tmp/hadoop-1.2.1.tar.gz -C /opt/flume/lib/ hadoop-1.2.1/hadoop-core-1.2.1.jar --strip-components 1
RUN rm -f /tmp/hadoop-1.2.1.tar.gz

#COPY apache-flume-1.6.0-bin.tar.gz /tmp/apache-flume-1.6.0-bin.tar.gz
#RUN tar -xzf /tmp/apache-flume-1.6.0-bin.tar.gz -C /opt/
#RUN rm -f /tmp/apache-flume-1.6.0-bin.tar.gz

#COPY generic/opt/flume/lib/*.jar /opt/flume/lib/
COPY generic/opt/flume/conf/flume.conf /opt/flume/conf/flume.conf
COPY generic/opt/flume/conf/log4j.properties /opt/flume/conf/log4j.properties

COPY generic/etc/services.sh /etc/services.sh
RUN chmod -v +x /etc/services.sh

RUN mkdir -p /var/log/flume
RUN mkdir -p /var/log/httpd
RUN mkdir -p /var/run/httpd

EXPOSE 4545
