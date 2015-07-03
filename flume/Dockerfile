FROM centos-java:7-my
MAINTAINER Sergey Korytnikov "sergey.korytnikov@gmail.com"

COPY generic/etc/supervisord-*.conf /etc/

#RUN curl -s http://archive.apache.org/dist/flume/1.6.0/apache-flume-1.6.0-bin.tar.gz | tar -xz -C /opt/
COPY apache-flume-1.6.0-bin.tar.gz /tmp/apache-flume-1.6.0-bin.tar.gz
RUN tar -xzf /tmp/apache-flume-1.6.0-bin.tar.gz -C /opt/
RUN rm -f /tmp/apache-flume-1.6.0-bin.tar.gz
RUN ln -s /opt/apache-flume-1.6.0-bin /opt/flume
ENV PATH $PATH:/opt/flume/bin

COPY generic/opt/flume/lib/*.jar /opt/flume/lib/
COPY generic/opt/flume/conf/flume.conf /opt/flume/conf/flume.conf
COPY generic/opt/flume/conf/log4j.properties /opt/flume/conf/log4j.properties

COPY generic/etc/services.sh /etc/services.sh
RUN chmod -v +x /etc/services.sh

EXPOSE 4545
