# sparkling-docker
This project combines multiple technologies, running in separate containers, and represents how easily distributed system can be built and run with Docker. It covers Apache HTTPD access logs processing with Flume, Hadoop and Spark Streaming.


***
## Overall architecture
Current architecture of containers can be represented by the following interaction diagram

<PRE>
[HTTPD]      [FLUME-AGENT]----[FLUME-COLLECTOR]      [SPARK]----[SPARK-DRIVER]
   |               |                  |                 |
 (logs)-------------              [HADOOP]---------------
         {volume}                     |
                                   (hdfs)
</PRE>
1. Apache server generates access logs, which are written to host-binded volume folder
2. Flume Agent is targeted to access logs via setup volume and sends data to sink, running in separate container
3. Flume Collector writes data to HDFS of Hadoop
4. Spark-Driver is Spark Streaming application, which scans HDFS folder and processes data on Spark cluster

***
## Containers list
- DNS
- Apache HTTPD
- Flume Agent
- Flume Collector
- Hadoop NameNode (namenode, jobtracker)
- Hadoop SecondaryNameNode (secondarynamenode)
- Hadoop DataNode 1 (datanote, tasktracker)
- Hadoop DataNode 2 (datanote, tasktracker)
- Spark Master
- Spark Slave 1
- Spark Slave 2
- Spark Streaming Driver Application

***
## Docker Images
#### List of Images
- tonistiigi/dnsdock - public DNSDock image from http://hub.docker.com
- centos:6 - public CentOS image from http://hub.docker.com
- centos:6-my - CentOS image with some linux tools, supervisord, sshd and bootstrap scripts
- centos-httpd:my - extended CentOS image with Apache HTTPD server
- centos-java:7-my - extended CentOS image with JDK
- centos-flume:1.6.0-my - JDK image with Flume
- centos-hadoop:1.2.1-my - JDK image with Hadoop
- centos-spark:1.4.0-my - JDK image with Spark
- centos-spark-driver:0.0.1-my - Spark image with Spark Streaming Java Application

#### Images Hierarchy
<PRE>

  |- tonistiigi/dnsdock
  |- centos:6
      |- centos:6-my
         |- centos-httpd:my
         |- centos-java:7-my
            |- centos-flume:1.6.0-my
            |- centos-hadoop:1.2.1-my
            |- centos-spark:1.4.0-my
                |- centos-spark-driver:0.0.1-my

</PRE>

#### Build Process
All Docker images, except tonistiigi/dnsdock and centos:6, should be build. Build sequence should match the hierarchy above.

- ./build-centos.sh - builds centos:6-my image
- ./build-httpd.sh - builds centos-httpd:my image
- ./build-java.sh - builds centos-java:7-my image
- ./build-flume.sh - builds centos-flume:1.6.0-my image
- ./build-hadoop.sh - builds centos-hadoop:1.2.1-my image
- ./build-spark.sh - builds centos-spark:1.4.0-my image
- ./build-spark-driver.sh - builds centos-spark-driver:0.0.1-my image

Make sure that dependent image is built before proceeding with the next build

#### Launching containers
The only major recommendation here is to start dnsdock container first, so all other containers will be able to register in DNS and communicate with one another. To minimize the quantity of Exceptions, caused by inactive containers, start containers in the following order. 
<PRE>
$ ./start-dns.sh
$ ./start-httpd.sh
$ ./start-hadoop.sh
$ ./start-flume.sh
$ ./start-spark.sh
$ ./start-spark-driver.sh
</PRE>

Every container writes data and logs to host folder, binded via volume. Make sure that HOST_VOL variable is set properly in env.sh:
<PRE>
HOST_VOL=/home/nibbler/docker
</PRE>

If Hadoop is started first time, make sure to use start-hadoop-format.sh script, instead of start-hadoop.sh. Services.sh script will format Hadoop file system in NameNode container prior to startup.
<PRE>
$ ./start-hadoop-format.sh
</PRE>

To startup Flume, Hadoop and Spark components containers step-by-step, use another set of scripts:
<PRE>
$ ./start-hadoop-namenode.sh
$ ./start-hadoop-namenode-format.sh
$ ./start-hadoop-secondarynamenode.sh
$ ./start-hadoop-datanodes.sh

$ ./start-flume-agent.sh
$ ./start-flume-collector.sh

$ ./start-spark-master.sh
$ ./start-spark-slaves.sh
</PRE>

To stop containers separately, use the following scripts:
<PRE>
$ ./stop-spark-driver.sh
$ ./stop-spark.sh
$ ./stop-flume.sh
$ ./stop-hadoop.sh
$ ./stop-httpd.sh
$ ./stop-dns.sh
</PRE>

or kill them all in one shot:
<PRE>
$ ./stop-all.sh
</PRE>

#### Useful Scripts
Stop the container and remove it, including dangling volumes:
<PRE>
$ ./stop-container.sh -n container-name -c -v

$ ./stop-container.sh -h
This script stops and removes containers by name
OPTIONS:
   -h          Show this message
   -n &lt;name&gt;   Container name
   -c          Remove container
   -v          Remove conrainer and volume

</PRE>

Open bash shell to running container:
<PRE>
$ ./tty.sh container-id
</PRE>

Inspect running container:
<PRE>
$ ./inspect.sh container-id
</PRE>

Cleanup exited containers:
<PRE>
$ ./cleanup-containers.sh
</PRE>

Cleanup dangling images, e.g. after unsuccessful builds:
<PRE>
$ ./cleanup-images.sh
</PRE>

Cleanup exited containers and dangling images:
<PRE>
$ ./cleanup-all.sh
</PRE>
