package spark.stream;

import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class AccessLogLine implements Serializable {

	private static final long serialVersionUID = 7454527443888857904L;

	private static final SimpleDateFormat inputTime = new SimpleDateFormat("dd/MMM/yyyy:HH:mm:ss");
	
	private Calendar timestamp;
	private String request;
	private String context;
	private String url;
	private int code;
	
	public AccessLogLine(String line) {
		try {
			processLine(line);
		} catch (ParseException e) {
			System.err.println("Unable to parse: " + line);
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		String line = "10.0.2.2 - - [04/Jul/2015:15:21:16 +0000] \"GET /one/ HTTP/1.1\" 304 - \"-\" \"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.125 Safari/537.36 OPR/30.0.1835.88\"";
		System.out.println("Log line: " + line);
		System.out.println(new AccessLogLine(line));
	}
	
	private void processLine(String line) throws ParseException {
		int idx = line.indexOf("[") + 1;
	
		timestamp = Calendar.getInstance();
		timestamp.setTime(inputTime.parse(line.substring(idx, idx += 20)));

//		int minutes = timestamp.get(Calendar.HOUR_OF_DAY) * 60 + timestamp.get(Calendar.MINUTE);		
//		long date = timestamp.getTimeInMillis() - minutes * 60 * 1000;
		
		idx = line.indexOf("\"", idx) + 1;
		request = line.substring(idx, idx = line.indexOf(" ", idx));
		
		idx += 1;
		int quoteIdx = line.indexOf(" HTTP/1.", idx);
		
		url = (quoteIdx != -1) 
			? line.substring(idx, idx = line.indexOf("\"", quoteIdx) )
			: line.substring(idx, idx = line.indexOf("\" "));
		
		context = "/";
		int cidx = url.lastIndexOf(" ");
		if (cidx != -1) {
			url = url.substring(0, cidx);
		}
		if ((cidx = url.indexOf("/", 1)) != -1) {
			int alt = url.indexOf("?", 1); // exclude long url for / context
			if (alt != -1 && alt < cidx) {
				context = url.substring(1, alt);
			} else {
				context = url.substring(1, cidx);
			}
		}
		
		idx++;
		while(idx < line.length()) {
			if (line.charAt(idx) != ' ')
				break;
			idx++;
		}
		
		code = Integer.parseInt(line.substring(idx, idx = line.indexOf(" ", idx)));
	}
	
	public Calendar getTimestamp() {
		return timestamp;
	}
	
	public String getRequest() {
		return request;
	}
	
	public String getContext() {
		return context;
	}
	
	public String getUrl() {
		return url;
	}
	
	public int getCode() {
		return code;
	}
	
	@Override
	public String toString() {
		StringBuilder sb = new StringBuilder();
		sb.append("LogLine[");
		sb.append(inputTime.format(timestamp.getTime()));
		sb.append(',');
		sb.append(request);
		sb.append(',');
		sb.append(context);
		sb.append(',');
		sb.append(url);
		sb.append(',');
		sb.append(code);
		sb.append(']');
		return sb.toString();
	}
	
}
