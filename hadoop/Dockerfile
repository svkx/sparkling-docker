FROM centos-java:7-my
MAINTAINER Sergey Korytnikov "sergey.korytnikov@gmail.com"

COPY generic/etc/supervisord-*.conf /etc/

RUN curl -s https://archive.apache.org/dist/hadoop/common/hadoop-1.2.1/hadoop-1.2.1.tar.gz | tar -xz -C /opt/
#COPY hadoop-1.2.1.tar.gz /tmp/hadoop-1.2.1.tar.gz
#RUN tar -xzf /tmp/hadoop-1.2.1.tar.gz -C /opt/
#RUN rm -f /tmp/hadoop-1.2.1.tar.gz
RUN ln -s /opt/hadoop-1.2.1 /opt/hadoop
ENV PATH $PATH:/opt/hadoop/bin

COPY generic/opt/hadoop/conf /opt/hadoop/conf

COPY generic/etc/services.sh /etc/services.sh
RUN chmod -v +x /etc/services.sh

RUN mkdir -p /opt/hadoop/hdfs
RUN mkdir -p /opt/hadoop/logs

EXPOSE 8020 8021 50010 50020 50030


