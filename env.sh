#!/bin/bash

HOST_IP=`ifconfig docker0 | awk '/inet addr/{print substr($2,6)}'`

IMG_DNS=tonistiigi/dnsdock
IMG_HTTPD=centos-httpd:my
IMG_JAVA=centos-java:7-my
IMG_HADOOP=centos-hadoop:1.2.1-my
IMG_FLUME=centos-flume:1.6.0-my
IMG_SPARK=centos-spark:1.4.0-my

CON_DNS_NAME=dnsdock
CON_DNS_DNS_NAME=dnsdock
CON_DNS_SOCK=/var/run/docker.sock:/run/docker.sock
CON_DNS_PORT=$HOST_IP:53:53/udp

CON_HTTPD_NAME=httpd
CON_HTTPD_DNS_NAME=httpd
CON_HTTPD_VOL_LOGS=/home/nibbler/docker/httpd/logs:/var/log/httpd
CON_HTTPD_VOL_SV_LOGS=/home/nibbler/docker/httpd/supervisord/logs:/var/log/supervisord
CON_HTTPD_PORT=80:80
CON_HTTPD_PORT_SV_WEB=9001:9001

CON_HADOOP_NAMENODE1_NAME=namenode.hadoop
CON_HADOOP_NAMENODE1_DNS_NAME=namenode.hadoop
CON_HADOOP_NAMENODE1_VOL_HD_TEMP=/home/nibbler/docker/hadoop/namenode/hdfs:/opt/hadoop/hdfs
CON_HADOOP_NAMENODE1_VOL_SV_LOGS=/home/nibbler/docker/hadoop/supervisord/logs:/var/log/supervisord
CON_HADOOP_NAMENODE1_PORT_SV_WEB=9002:9001
CON_HADOOP_NAMENODE1_PORT_HD_WEB=50070:50070

CON_HADOOP_NAMENODE2_NAME=secondarynamenode.hadoop
CON_HADOOP_NAMENODE2_DNS_NAME=secondarynamenode.hadoop
CON_HADOOP_NAMENODE2_VOL_HD_TEMP=/home/nibbler/docker/hadoop/namenode/hdfs:/opt/hadoop/hdfs
CON_HADOOP_NAMENODE2_VOL_SV_LOGS=/home/nibbler/docker/hadoop/supervisord/logs:/var/log/supervisord
CON_HADOOP_NAMENODE2_PORT_SV_WEB=9003:9001
CON_HADOOP_NAMENODE2_PORT_HD_WEB=50071:50070

CON_HADOOP_DATANODE1_NAME=datanode1.hadoop
CON_HADOOP_DATANODE1_DNS_NAME=datanode1.hadoop
CON_HADOOP_DATANODE1_VOL_HD_TEMP=/home/nibbler/docker/hadoop/datanode1/hdfs:/opt/hadoop/hdfs
CON_HADOOP_DATANODE1_VOL_SV_LOGS=/home/nibbler/docker/hadoop/supervisord/logs:/var/log/supervisord
CON_HADOOP_DATANODE1_PORT_SV_WEB=9004:9001
CON_HADOOP_DATANODE1_PORT_HD_WEB=50072:50070

CON_HADOOP_DATANODE2_NAME=datanode2.hadoop
CON_HADOOP_DATANODE2_DNS_NAME=datanode2.hadoop
CON_HADOOP_DATANODE2_VOL_HD_TEMP=/home/nibbler/docker/hadoop/datanode2/hdfs:/opt/hadoop/hdfs
CON_HADOOP_DATANODE2_VOL_SV_LOGS=/home/nibbler/docker/hadoop/supervisord/logs:/var/log/supervisord
CON_HADOOP_DATANODE2_PORT_SV_WEB=9005:9001
CON_HADOOP_DATANODE2_PORT_HD_WEB=50073:50070

CON_FLUME_AGENT_NAME=agent.flume
CON_FLUME_AGENT_DNS_NAME=agent.flume
CON_FLUME_AGENT_VOL_FL_LOGS=/home/nibbler/docker/flume/agent/logs:/var/log/flume
CON_FLUME_AGENT_VOL_SV_LOGS=/home/nibbler/docker/flume/supervisord/logs:/var/log/supervisord
CON_FLUME_AGENT_PORT_SV_WEB=9006:9001

CON_FLUME_COLLECTOR_NAME=collector.flume
CON_FLUME_COLLECTOR_DNS_NAME=collector.flume
CON_FLUME_COLLECTOR_VOL_FL_LOGS=/home/nibbler/docker/flume/collector/logs:/var/log/flume
CON_FLUME_COLLECTOR_VOL_SV_LOGS=/home/nibbler/docker/flume/supervisord/logs:/var/log/supervisord
CON_FLUME_COLLECTOR_PORT_SV_WEB=9007:9001

CON_SPARK_MASTER_NAME=master.spark
CON_SPARK_MASTER_DNS_NAME=master.spark
CON_SPARK_MASTER_VOL_SP_LOGS=/home/nibbler/docker/spark/master/logs:/opt/spark/logs
CON_SPARK_MASTER_VOL_SV_LOGS=/home/nibbler/docker/spark/supervisord/logs:/var/log/supervisord
CON_SPARK_MASTER_PORT_SP_WEB=9080:8080
CON_SPARK_MASTER_PORT_SV_WEB=9008:9001

CON_SPARK_SLAVE1_NAME=worker1.spark
CON_SPARK_SLAVE1_DNS_NAME=worker1.spark
CON_SPARK_SLAVE1_VOL_SP_LOGS=/home/nibbler/docker/spark/slave1/logs:/opt/spark/logs
CON_SPARK_SLAVE1_VOL_SV_LOGS=/home/nibbler/docker/spark/supervisord/logs:/var/log/supervisord
CON_SPARK_SLAVE1_PORT_SP_WEB=9081:8081
CON_SPARK_SLAVE1_PORT_SV_WEB=9009:9001

CON_SPARK_SLAVE2_NAME=worker2.spark
CON_SPARK_SLAVE2_DNS_NAME=worker2.spark
CON_SPARK_SLAVE2_VOL_SP_LOGS=/home/nibbler/docker/spark/slave2/logs:/opt/spark/logs
CON_SPARK_SLAVE2_VOL_SV_LOGS=/home/nibbler/docker/spark/supervisord/logs:/var/log/supervisord
CON_SPARK_SLAVE2_PORT_SP_WEB=9082:8081
CON_SPARK_SLAVE2_PORT_SV_WEB=9010:9001