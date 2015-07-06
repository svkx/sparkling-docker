#!/bin/bash

DRIVER=/opt/spark-driver/SparkDriver.jar
CLASS=spark.stream.ApacheLogsAnalyzerSimple

SPARK=$SPARK_HOME/lib/spark-assembly-1.4.0-hadoop1.0.4.jar
MASTER=spark://master.spark:7077

SOURCE=hdfs://namenode.hadoop:8020/flume/events/httpd/FlumeData.1436023282744

java -cp $DRIVER:$SPARK $CLASS $DRIVER $MASTER $SOURCE
