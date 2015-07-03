FROM centos:6-my
MAINTAINER Sergey Korytnikov "sergey.korytnikov@gmail.com"

RUN yum -y install tar java-1.7.0-openjdk tar
ENV JAVA_HOME /etc/alternatives/jre
ENV PATH $PATH:$JAVA_HOME/bin
