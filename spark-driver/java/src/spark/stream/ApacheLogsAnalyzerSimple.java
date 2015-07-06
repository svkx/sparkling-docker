package spark.stream;

import org.apache.spark.SparkConf;
import org.apache.spark.api.java.JavaRDD;
import org.apache.spark.api.java.JavaSparkContext;
import org.apache.spark.api.java.function.Function;

public class ApacheLogsAnalyzerSimple {

	@SuppressWarnings({ "serial" })
	public static void main(String[] args) {
		if (args.length < 3) {
			System.out.println("Not enough parameters");
			System.out.println("usage: java " + ApacheLogsAnalyzerSimple.class.getName()
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
		sc.setAppName(ApacheLogsAnalyzerSimple.class.getName());
		sc.setJars(jars.split(","));

		try (JavaSparkContext jsc = new JavaSparkContext(sc)) {
			JavaRDD<String> rawLines = jsc.textFile(hadoopSource);
			JavaRDD<AccessLogLine> logLines = rawLines.map(new Function<String, AccessLogLine>() {
				@Override
				public AccessLogLine call(String line) throws Exception {
					return new AccessLogLine(line);
				}
			});
	
			System.out.println(logLines.collect());
		}
	}

}
