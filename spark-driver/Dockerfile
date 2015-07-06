FROM centos-spark:1.4.0-my
MAINTAINER Sergey Korytnikov "sergey.korytnikov@gmail.com"

# Remove services.sh from parent spark image
RUN rm -f /etc/services.sh

COPY generic/etc/supervisord.conf /etc/
COPY generic/opt/spark-driver/* /opt/spark-driver/

RUN chmod -v +x /opt/spark-driver/start-driver.sh

