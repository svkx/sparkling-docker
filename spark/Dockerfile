FROM centos-java:7-my
MAINTAINER Sergey Korytnikov "sergey.korytnikov@gmail.com"

COPY generic/etc/supervisord-*.conf /etc/

#RUN curl -s http://apache.mirrors.lucidnetworks.net/spark/spark-1.4.0/spark-1.4.0-bin-without-hadoop.tgz | tar -xz -C /opt/
RUN curl -s http://mirror.metrocast.net/apache/spark/spark-1.4.0/spark-1.4.0-bin-hadoop1.tgz | tar -xz -C /opt/

#COPY spark-1.4.0-bin-without-hadoop.tgz /tmp/spark-1.4.0-bin-without-hadoop.tgz
#RUN tar -xzf /tmp/spark-1.4.0-bin-without-hadoop.tgz -C /opt/
#RUN rm -f /tmp/spark-1.4.0-bin-without-hadoop.tgz
#RUN ln -s /opt/spark-1.4.0-bin-without-hadoop /opt/spark

#COPY spark-1.4.0-bin-hadoop1.tgz /tmp/spark-1.4.0-bin-hadoop1.tgz
#RUN tar -xzf /tmp/spark-1.4.0-bin-hadoop1.tgz -C /opt/
#RUN rm -f /tmp/spark-1.4.0-bin-hadoop1.tgz
RUN ln -s /opt/spark-1.4.0-bin-hadoop1 /opt/spark

# Don't need this with hadoop version
#COPY slf4j-api-1.7.12.jar /opt/spark/lib/
#COPY slf4j-simple-1.7.12.jar /opt/spark/lib/

ENV SPARK_HOME /opt/spark
ENV PATH $PATH:$SPARK_HOME/bin:$SPARK_HOME/sbin

COPY generic/opt/spark/conf /opt/spark/conf
COPY generic/etc/services.sh /etc/services.sh
COPY generic/opt/spark/sbin/spark-daemon.sh /opt/spark/sbin/
COPY generic/opt/spark/sbin/start-worker.sh /opt/spark/sbin/

RUN chmod -v +x /etc/services.sh
RUN chmod -v +x /opt/spark/sbin/spark-daemon.sh
RUN chmod -v +x /opt/spark/sbin/start-worker.sh

EXPOSE 7077

