package cn.net.sunrise.su.tool;

public class IpTool {
	
	public static String IpAnonymous(String ip) {
		if (!ip.matches("^((25[0-5]|2[0-4]\\d|[1]{1}\\d{1}\\d{1}|[1-9]{1}\\d{1}|\\d{1})($|(?!\\.$)\\.)){4}$")) {
			return ip;
		}
		String[] ips = ip.split("\\.");
		return String.format("%s.%s.%s.*", ips[0], ips[1], ips[2]);
	}
	
	private IpTool() {
		throw new Error("No such object for class: " + this.getClass().getName());
	}
}
