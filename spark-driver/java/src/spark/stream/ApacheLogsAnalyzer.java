package spark.stream;

import org.apache.spark.SparkConf;
import org.apache.spark.api.java.JavaRDD;
import org.apache.spark.api.java.function.Function;
import org.apache.spark.streaming.Durations;
import org.apache.spark.streaming.api.java.JavaDStream;
import org.apache.spark.streaming.api.java.JavaStreamingContext;

public class ApacheLogsAnalyzer {

	@SuppressWarnings({ "serial" })
	public static void main(String[] args) {
		if (args.length < 3) {
			System.out.println("Not enough parameters");
			System.out.println("usage: java " + ApacheLogsAnalyzer.class.getName()
					+ " jar1,jar2 spark://master:7077 hdfs://namenode:8020/folder");
			System.exit(1);
		}

		String jars = args[0];
		String sparkMaster = args[1];
		String hadoopSource = args[2];

		System.out.println("Jars: " + jars);
		System.out.println("Master: " + sparkMaster);
		System.out.println("Source: " + hadoopSource);

		SparkConf sc = new SparkConf();
		sc.setMaster(sparkMaster);
		sc.setAppName(ApacheLogsAnalyzer.class.getName());
		sc.setJars(jars.split(","));

		try (JavaStreamingContext jsc = new JavaStreamingContext(sc, Durations.seconds(10))) {
			JavaDStream<String> rawLines = jsc.textFileStream(hadoopSource);
			JavaDStream<AccessLogLine> logLines = rawLines.map(new Function<String, AccessLogLine>() {
				@Override
				public AccessLogLine call(String line) throws Exception {
					return new AccessLogLine(line);
				}
			});
	
			logLines.foreachRDD(new Function<JavaRDD<AccessLogLine>, Void>(){
				@Override
				public Void call(JavaRDD<AccessLogLine> rdd) throws Exception {
					for (AccessLogLine line: rdd.collect()) {
						System.out.println(line);
					}
					return null;
				}
				
			});
	
			jsc.start();
			jsc.awaitTermination();
		}

	}

}
